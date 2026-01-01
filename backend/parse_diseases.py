#!/usr/bin/env python3
"""
Script parse dữ liệu bệnh từ các file HTML và lưu vào PostgreSQL
Author: Auto-generated
"""

import os
import re
import json
import psycopg2
from bs4 import BeautifulSoup
from datetime import datetime

# ========== CONFIGURATION ==========
DISEASES_FOLDER = "../frontend/pages/diseases"
DB_CONFIG = {
    "host": "localhost",
    "port": 5432,
    "user": "postgres",
    "password": "12345678",  
    "database": "group_project"
}

# ========== HELPER FUNCTIONS ==========

def clean_text(text):
    """Làm sạch text: bỏ khoảng trắng thừa, xuống dòng"""
    if not text:
        return ""
    # Thay thế nhiều khoảng trắng/xuống dòng bằng 1 khoảng trắng
    text = re.sub(r'\s+', ' ', text)
    return text.strip()

def extract_list_items(section):
    """Trích xuất các item từ thẻ <ul>/<li>"""
    items = []
    ul = section.find('ul')
    if ul:
        for li in ul.find_all('li', recursive=False):
            # Bỏ qua các link trong li (thuốc điều trị)
            if li.find('a', class_='compare-btn'):
                continue
            items.append(clean_text(li.get_text()))
    return items

def parse_disease_html(filepath):
    """Parse một file HTML bệnh và trả về dict chứa thông tin"""
    with open(filepath, 'r', encoding='utf-8') as f:
        soup = BeautifulSoup(f.read(), 'html.parser')
    
    disease = {
        "filename": os.path.basename(filepath),
        "title": "",
        "tong_quan": "",
        "image_url": "",
        "nguyen_nhan": "",
        "trieu_chung": [],
        "doi_tuong_nguy_co": [],
        "phong_ngua": [],
        "link_thuoc_tay": "",
        "link_thao_duoc": ""
    }
    
    # Lấy title
    title_tag = soup.find('title')
    if title_tag:
        disease["title"] = clean_text(title_tag.text.split('|')[0])
    
    # Lấy nội dung trong main.container
    main = soup.find('main', class_='container')
    if not main:
        return disease
    
    sections = main.find_all('section', class_='section')
    
    for section in sections:
        # Kiểm tra xem section có heading nào
        h1 = section.find('h1')
        h2 = section.find('h2')
        h3 = section.find('h3')
        h4 = section.find('h4')
        h5 = section.find('h5')
        h6 = section.find('h6')
        img = section.find('img', class_='main-image')
        
        # Lấy heading text từ bất kỳ thẻ heading nào có trong section
        heading = h1 or h2 or h3 or h4 or h5 or h6
        heading_text = clean_text(heading.get_text()).lower() if heading else ""
        
        # Lấy tổng quan (h1)
        if h1:
            paragraphs = section.find_all('p')
            disease["tong_quan"] = " ".join([clean_text(p.get_text()) for p in paragraphs])
        
        # Lấy ảnh
        if img:
            disease["image_url"] = img.get('src', '')
        
        # Nguyên nhân - tìm ở bất kỳ heading level nào
        if 'nguyên nhân' in heading_text:
            paragraphs = section.find_all('p')
            paragraph_text = " ".join([clean_text(p.get_text()) for p in paragraphs])
            list_items = extract_list_items(section)
            # Gộp paragraph và list items
            if paragraph_text:
                disease["nguyen_nhan"] = paragraph_text
            if list_items:
                if disease["nguyen_nhan"]:
                    disease["nguyen_nhan"] += " " + " | ".join(list_items)
                else:
                    disease["nguyen_nhan"] = " | ".join(list_items)
        
        # Triệu chứng - tìm ở bất kỳ heading level nào
        if 'triệu chứng' in heading_text:
            items = extract_list_items(section)
            if items:
                disease["trieu_chung"] = items
            # Nếu có paragraph text mà không có list items
            if not items:
                paragraphs = section.find_all('p')
                if paragraphs:
                    disease["nguyen_nhan"] = " ".join([clean_text(p.get_text()) for p in paragraphs])
        
        # Đối tượng nguy cơ
        if 'đối tượng' in heading_text or 'nguy cơ' in heading_text:
            disease["doi_tuong_nguy_co"] = extract_list_items(section)
        
        # Phòng ngừa - mở rộng từ khóa tìm kiếm
        phong_ngua_keywords = ['phòng ngừa', 'phòng tránh', 'giảm đau', 'điều trị tại nhà', 
                               'cách chữa', 'tại nhà', 'dự phòng', 'làm giảm']
        if any(kw in heading_text for kw in phong_ngua_keywords):
            items = extract_list_items(section)
            if items:
                disease["phong_ngua"] = items
        
        # Các bài thuốc điều trị - chỉ lấy links
        if 'thuốc' in heading_text or 'điều trị' in heading_text:
            links = section.find_all('a', class_='compare-btn')
            for link in links:
                href = link.get('href', '')
                text = clean_text(link.get_text()).lower()
                if 'tây' in text or 'thuoc-tay' in href:
                    disease["link_thuoc_tay"] = href
                elif 'thảo' in text or 'dược' in text or 'herbs' in href:
                    disease["link_thao_duoc"] = href
    
    return disease

def parse_all_diseases(folder_path):
    """Parse tất cả file HTML trong folder và trả về list các bệnh"""
    diseases = []
    
    # Lấy đường dẫn tuyệt đối
    base_path = os.path.dirname(os.path.abspath(__file__))
    abs_folder = os.path.join(base_path, folder_path)
    
    print(f"📂 Đang đọc từ folder: {abs_folder}")
    
    # Chỉ lấy các file bệnh (bắt đầu bằng "benh-")
    html_files = [f for f in os.listdir(abs_folder) if f.startswith('benh-') and f.endswith('.html')]
    
    print(f"📋 Tìm thấy {len(html_files)} file bệnh")
    
    for filename in sorted(html_files):
        filepath = os.path.join(abs_folder, filename)
        try:
            disease = parse_disease_html(filepath)
            diseases.append(disease)
            print(f"  ✅ {filename}: {disease['title']}")
        except Exception as e:
            print(f"  ❌ Lỗi khi parse {filename}: {e}")
    
    return diseases

# ========== DATABASE FUNCTIONS ==========

def create_diseases_table(cursor):
    """Tạo bảng diseases_parsed nếu chưa tồn tại"""
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS diseases_parsed (
            id SERIAL PRIMARY KEY,
            filename VARCHAR(255) UNIQUE NOT NULL,
            title VARCHAR(500) NOT NULL,
            tong_quan TEXT,
            image_url VARCHAR(500),
            nguyen_nhan TEXT,
            trieu_chung TEXT,
            doi_tuong_nguy_co TEXT,
            phong_ngua TEXT,
            link_thuoc_tay VARCHAR(500),
            link_thao_duoc VARCHAR(500),
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    """)
    print("✅ Đã tạo/kiểm tra bảng diseases_parsed")

def insert_disease(cursor, disease):
    """Insert hoặc update một bệnh vào database"""
    cursor.execute("""
        INSERT INTO diseases_parsed (
            filename, title, tong_quan, image_url, nguyen_nhan,
            trieu_chung, doi_tuong_nguy_co, phong_ngua,
            link_thuoc_tay, link_thao_duoc, updated_at
        ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        ON CONFLICT (filename) DO UPDATE SET
            title = EXCLUDED.title,
            tong_quan = EXCLUDED.tong_quan,
            image_url = EXCLUDED.image_url,
            nguyen_nhan = EXCLUDED.nguyen_nhan,
            trieu_chung = EXCLUDED.trieu_chung,
            doi_tuong_nguy_co = EXCLUDED.doi_tuong_nguy_co,
            phong_ngua = EXCLUDED.phong_ngua,
            link_thuoc_tay = EXCLUDED.link_thuoc_tay,
            link_thao_duoc = EXCLUDED.link_thao_duoc,
            updated_at = EXCLUDED.updated_at
    """, (
        disease["filename"],
        disease["title"],
        disease["tong_quan"],
        disease["image_url"],
        disease["nguyen_nhan"],
        json.dumps(disease["trieu_chung"], ensure_ascii=False),
        json.dumps(disease["doi_tuong_nguy_co"], ensure_ascii=False),
        json.dumps(disease["phong_ngua"], ensure_ascii=False),
        disease["link_thuoc_tay"],
        disease["link_thao_duoc"],
        datetime.now()
    ))

def save_to_database(diseases):
    """Lưu tất cả diseases vào PostgreSQL"""
    print("\n🔌 Đang kết nối PostgreSQL...")
    
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cursor = conn.cursor()
        
        print(f"✅ Đã kết nối tới database: {DB_CONFIG['database']}")
        
        # Tạo bảng
        create_diseases_table(cursor)
        
        # Insert từng bệnh
        print("\n📥 Đang lưu dữ liệu...")
        success_count = 0
        for disease in diseases:
            try:
                insert_disease(cursor, disease)
                success_count += 1
            except Exception as e:
                print(f"  ❌ Lỗi insert {disease['filename']}: {e}")
        
        conn.commit()
        print(f"\n✅ Đã lưu thành công {success_count}/{len(diseases)} bệnh vào database!")
        
        # Đếm số record trong bảng
        cursor.execute("SELECT COUNT(*) FROM diseases_parsed")
        total = cursor.fetchone()[0]
        print(f"📊 Tổng số bệnh trong bảng diseases_parsed: {total}")
        
        cursor.close()
        conn.close()
        
    except Exception as e:
        print(f"❌ Lỗi kết nối database: {e}")
        raise

def export_to_json(diseases, output_file="diseases_data.json"):
    """Xuất dữ liệu ra file JSON (backup)"""
    base_path = os.path.dirname(os.path.abspath(__file__))
    output_path = os.path.join(base_path, output_file)
    
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(diseases, f, ensure_ascii=False, indent=2)
    
    print(f"📄 Đã xuất file JSON: {output_path}")

# ========== MAIN ==========

def main():
    print("=" * 50)
    print("🏥 DISEASE HTML PARSER - PostgreSQL")
    print("=" * 50)
    
    # 1. Parse tất cả file HTML
    print("\n📖 BƯỚC 1: Parse các file HTML...\n")
    diseases = parse_all_diseases(DISEASES_FOLDER)
    
    if not diseases:
        print("❌ Không tìm thấy file bệnh nào!")
        return
    
    # 2. Xuất ra JSON (backup)
    print("\n💾 BƯỚC 2: Xuất backup JSON...\n")
    export_to_json(diseases)
    
    # 3. Lưu vào PostgreSQL
    print("\n🗄️ BƯỚC 3: Lưu vào PostgreSQL...\n")
    save_to_database(diseases)
    
    print("\n" + "=" * 50)
    print("✅ HOÀN THÀNH!")
    print("=" * 50)

if __name__ == "__main__":
    main()
