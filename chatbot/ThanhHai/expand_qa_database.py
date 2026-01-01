# expand_qa_database.py - Mở rộng CSDL Q&A cho chatbot
# Tạo thêm nhiều cặp Q&A từ dữ liệu bệnh/thuốc/thảo dược có sẵn

import json
import os
import hashlib
import sys

# Fix Windows encoding
if sys.platform == 'win32':
    sys.stdout.reconfigure(encoding='utf-8')

from dotenv import load_dotenv

load_dotenv()

def generate_id(text):
    """Generate unique ID from text"""
    return hashlib.md5(text.encode()).hexdigest()[:10]

def load_data():
    """Load existing data_loader.json"""
    with open('saved_model/data_loader.json', 'r', encoding='utf-8') as f:
        return json.load(f)

def generate_qa_pairs(data):
    """Generate comprehensive Q&A pairs from docs"""
    qa_bank = []
    
    disease_names = data.get('disease_names', {})
    docs = data.get('docs', [])
    
    print(f"📊 Đang xử lý {len(docs)} documents...")
    
    for doc in docs:
        doc_type = doc.get('type', '')
        metadata = doc.get('metadata', {})
        text = doc.get('text', '')
        disease = metadata.get('disease', '')
        
        # 1. Q&A cho triệu chứng bệnh (disease_overview)
        if doc_type == 'disease_overview':
            vn_name = metadata.get('vietnamese_name', '')
            en_name = metadata.get('english_name', '')
            
            # Triệu chứng từ text
            symptoms = ""
            if "Triệu chứng (tổng hợp):" in text:
                try:
                    symptoms = text.split("Triệu chứng (tổng hợp):")[1].split("\n")[0].strip()
                except:
                    pass
            
            if symptoms:
                # Q1: Hỏi triệu chứng bệnh (tiếng Việt)
                qa_bank.append({
                    'question': f"Triệu chứng của bệnh {vn_name} là gì?",
                    'answer': f"Triệu chứng của bệnh {vn_name}: {symptoms}\n\n⚠️ Thông tin chỉ mang tính tham khảo.",
                    'intent': 'symptoms',
                    'disease': disease
                })
                
                # Q2: Hỏi bệnh gì từ triệu chứng
                symptom_list = symptoms.split(',')[:3]
                if symptom_list:
                    qa_bank.append({
                        'question': f"Tôi bị {', '.join(symptom_list).strip()} là bệnh gì?",
                        'answer': f"Với các triệu chứng {', '.join(symptom_list).strip()}, bạn có thể đang mắc bệnh **{vn_name}**.\n\n{symptoms}\n\n⚠️ Đây chỉ là gợi ý, vui lòng đến cơ sở y tế để được chẩn đoán chính xác.",
                        'intent': 'symptom_to_disease',
                        'disease': disease
                    })
                
                # Q3: Hỏi bằng tiếng Anh
                if en_name:
                    qa_bank.append({
                        'question': f"What are the symptoms of {en_name}?",
                        'answer': f"Symptoms of {en_name} ({vn_name}): {symptoms}\n\n⚠️ This information is for reference only.",
                        'intent': 'symptoms',
                        'disease': disease
                    })
            
            # Q4: Thông tin chung về bệnh
            qa_bank.append({
                'question': f"Bệnh {vn_name} là gì?",
                'answer': text,
                'intent': 'general',
                'disease': disease
            })
        
        # 2. Q&A cho thuốc tây (disease_drug)
        elif doc_type == 'disease_drug':
            drug = metadata.get('drug', '')
            active = metadata.get('active_ingredient', '')
            
            if drug:
                # Q1: Thuốc dùng để trị gì
                vn_disease = disease.split('(')[-1].replace(')', '').strip() if '(' in disease else disease
                qa_bank.append({
                    'question': f"Thuốc {drug} dùng để trị bệnh gì?",
                    'answer': f"Thuốc **{drug}** được sử dụng để điều trị bệnh **{vn_disease}**.\n\n{text}\n\n⚠️ Vui lòng tham khảo ý kiến bác sĩ trước khi sử dụng.",
                    'intent': 'drug',
                    'disease': disease
                })
                
                # Q2: Cách dùng thuốc
                qa_bank.append({
                    'question': f"Thuốc {drug} dùng như thế nào?",
                    'answer': text,
                    'intent': 'drug',
                    'disease': disease
                })
                
                # Q3: Tác dụng phụ
                if "Cảnh báo" in text:
                    qa_bank.append({
                        'question': f"Thuốc {drug} có tác dụng phụ gì?",
                        'answer': text,
                        'intent': 'drug',
                        'disease': disease
                    })
                
                # Q4: Hoạt chất
                if active:
                    qa_bank.append({
                        'question': f"Hoạt chất của thuốc {drug} là gì?",
                        'answer': f"Hoạt chất chính của thuốc {drug} là **{active}**.\n\n{text}",
                        'intent': 'drug',
                        'disease': disease
                    })
        
        # 3. Q&A cho thảo dược (disease_herb)
        elif doc_type == 'disease_herb':
            herb = metadata.get('herb_main', '')
            
            if herb:
                vn_disease = disease.split('(')[-1].replace(')', '').strip() if '(' in disease else disease
                
                # Q1: Thảo dược trị bệnh gì
                qa_bank.append({
                    'question': f"{herb} có tác dụng gì?",
                    'answer': f"**{herb}** có tác dụng hỗ trợ điều trị bệnh **{vn_disease}**.\n\n{text}\n\n⚠️ Tham khảo ý kiến thầy thuốc trước khi dùng.",
                    'intent': 'herb',
                    'disease': disease
                })
                
                # Q2: Cách dùng thảo dược
                qa_bank.append({
                    'question': f"Cách dùng {herb} như thế nào?",
                    'answer': text,
                    'intent': 'herb',
                    'disease': disease
                })
                
                # Q3: Thảo dược trị bệnh
                qa_bank.append({
                    'question': f"Thảo dược nào trị được bệnh {vn_disease}?",
                    'answer': f"Thảo dược **{herb}** có thể hỗ trợ điều trị bệnh {vn_disease}.\n\n{text}",
                    'intent': 'herb',
                    'disease': disease
                })
                
                # Q4: Liều lượng
                if "Liều lượng" in text:
                    qa_bank.append({
                        'question': f"Liều lượng dùng {herb} là bao nhiêu?",
                        'answer': text,
                        'intent': 'herb',
                        'disease': disease
                    })
                
                # Q5: Cảnh báo khi dùng thảo dược
                if "Cảnh báo" in text or "Chống chỉ định" in text:
                    qa_bank.append({
                        'question': f"Khi nào không nên dùng {herb}?",
                        'answer': text,
                        'intent': 'herb',
                        'disease': disease
                    })
        
        # 4. Q&A cho kết hợp thuốc-thảo dược (disease_pairing)
        elif doc_type == 'disease_pairing':
            herb = metadata.get('herb_main', '')
            drug = metadata.get('drug', '')
            
            if herb and drug:
                qa_bank.append({
                    'question': f"Có thể dùng {herb} kết hợp với thuốc {drug} không?",
                    'answer': f"Thông tin về kết hợp **{herb}** và **{drug}**:\n\n{text}\n\n⚠️ Vui lòng tham khảo ý kiến bác sĩ.",
                    'intent': 'interaction',
                    'disease': disease
                })
    
    # Thêm Q&A tổng hợp cho các thuốc phổ biến
    common_drugs = [
        ('Paracetamol', 'hạ sốt, giảm đau'),
        ('Ibuprofen', 'giảm đau, chống viêm'),
        ('Omeprazole', 'điều trị đau dạ dày, trào ngược'),
        ('Amoxicillin', 'kháng sinh điều trị nhiễm khuẩn'),
        ('Metformin', 'điều trị tiểu đường type 2'),
    ]
    
    for drug_name, usage in common_drugs:
        qa_bank.append({
            'question': f"Thuốc {drug_name} có tác dụng gì?",
            'answer': f"Thuốc **{drug_name}** thường được sử dụng để {usage}.\n\n⚠️ Vui lòng tham khảo ý kiến bác sĩ hoặc dược sĩ trước khi sử dụng.",
            'intent': 'drug',
            'disease': 'general'
        })
    
    # Thêm Q&A cho thảo dược phổ biến
    common_herbs = [
        ('Nghệ', 'chống viêm, hỗ trợ tiêu hóa, làm đẹp da'),
        ('Gừng', 'chống buồn nôn, làm ấm, hỗ trợ tiêu hóa, giảm đau đầu'),
        ('Tỏi', 'tăng cường miễn dịch, hạ cholesterol'),
        ('Mật ong', 'kháng khuẩn, làm dịu họng, giảm ho'),
        ('Cam thảo', 'làm dịu họng, hỗ trợ tiêu hóa'),
        ('Bạc hà', 'giảm đau đầu, làm mát, hỗ trợ tiêu hóa'),
        ('Đinh hương', 'giảm đau răng, kháng khuẩn'),
        ('Quế', 'làm ấm, hạ đường huyết, chống viêm'),
        ('Atiso', 'lợi gan, mát gan, giải độc'),
        ('Đương quy', 'bổ máu, điều kinh, giảm đau bụng kinh'),
        ('Nhân sâm', 'bổ khí, tăng cường sức khỏe, chống mệt mỏi'),
        ('Lạc tiên', 'an thần, giảm căng thẳng, hỗ trợ giấc ngủ'),
        ('Hoa cúc', 'giảm đau đầu, an thần nhẹ, chống viêm'),
        ('Bạch chỉ', 'giảm đau đầu, trị viêm xoang'),
        ('Xuyên khung', 'giảm đau đầu, hoạt huyết'),
        ('Cỏ xước', 'lợi tiểu, giảm đau khớp'),
        ('Diếp cá', 'thanh nhiệt, giải độc, kháng viêm'),
        ('Rau má', 'thanh nhiệt, làm đẹp da, giải độc'),
        ('Lá trầu', 'kháng khuẩn, giảm ho'),
        ('Tía tô', 'giải cảm, giảm ho, kháng dị ứng'),
    ]
    
    for herb_name, usage in common_herbs:
        # Q1: Tác dụng
        qa_bank.append({
            'question': f"{herb_name} có tác dụng gì?",
            'answer': f"**{herb_name}** có tác dụng {usage}.\n\n⚠️ Tham khảo ý kiến thầy thuốc trước khi dùng để điều trị bệnh.",
            'intent': 'herb',
            'disease': 'general'
        })
        
        # Q2: Cách dùng
        qa_bank.append({
            'question': f"Cách dùng {herb_name} như thế nào?",
            'answer': f"**{herb_name}** có thể dùng dưới dạng sắc uống, hãm trà, hoặc chế biến món ăn. Tác dụng: {usage}.\n\n⚠️ Liều lượng tùy thuộc tình trạng, nên tham khảo thầy thuốc.",
            'intent': 'herb',
            'disease': 'general'
        })
    
    # Thêm Q&A hỏi thảo dược theo bệnh/triệu chứng
    disease_herb_mapping = [
        ('đau đầu', 'Bạc hà, Hoa cúc, Bạch chỉ, Xuyên khung, Gừng'),
        ('mất ngủ', 'Lạc tiên, Tâm sen, Hoa cúc, Valerian'),
        ('ho', 'Mật ong, Gừng, Lá trầu, Tía tô, Cam thảo'),
        ('cảm cúm', 'Gừng, Tỏi, Tía tô, Sả'),
        ('đau dạ dày', 'Nghệ, Gừng, Cam thảo, Mật ong'),
        ('tiêu hóa kém', 'Gừng, Nghệ, Bạc hà, Trần bì'),
        ('đau bụng kinh', 'Đương quy, Ngải cứu, Ích mẫu'),
        ('stress', 'Lạc tiên, Hoa cúc, Bạc hà'),
        ('huyết áp cao', 'Tỏi, Hoa hòe, Cỏ xước'),
        ('gan yếu', 'Atiso, Diệp hạ châu, Nghệ'),
        ('mụn trứng cá', 'Diếp cá, Rau má, Trà xanh'),
        ('viêm họng', 'Mật ong, Cam thảo, Gừng, Chanh'),
    ]
    
    for symptom, herbs in disease_herb_mapping:
        qa_bank.append({
            'question': f"Thảo dược nào chữa {symptom}?",
            'answer': f"Các thảo dược hỗ trợ điều trị **{symptom}** bao gồm: **{herbs}**.\n\n💡 Cách dùng: Có thể sắc uống hoặc hãm trà.\n\n⚠️ Tham khảo ý kiến thầy thuốc trước khi sử dụng.",
            'intent': 'herb',
            'disease': symptom
        })
        qa_bank.append({
            'question': f"Bị {symptom} dùng thảo dược gì?",
            'answer': f"Khi bị **{symptom}**, bạn có thể sử dụng các thảo dược: **{herbs}**.\n\n💡 Nên dùng liên tục 3-7 ngày để thấy hiệu quả.\n\n⚠️ Nếu triệu chứng không giảm, hãy đến cơ sở y tế.",
            'intent': 'herb',
            'disease': symptom
        })
    
    return qa_bank

def update_data_loader(data, qa_bank):
    """Update data_loader.json with new qa_bank"""
    data['qa_bank_flat'] = qa_bank
    
    # Backup old file
    backup_path = 'saved_model/data_loader_backup.json'
    with open(backup_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
    print(f"✅ Đã backup file cũ: {backup_path}")
    
    # Write new file
    with open('saved_model/data_loader.json', 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
    print(f"✅ Đã cập nhật data_loader.json")
    
    return data

def main():
    print("🚀 Bắt đầu mở rộng CSDL Q&A cho chatbot...\n")
    
    # Load existing data
    data = load_data()
    old_qa_count = len(data.get('qa_bank_flat', []))
    print(f"📋 Số Q&A cũ: {old_qa_count}")
    
    # Generate new Q&A pairs
    qa_bank = generate_qa_pairs(data)
    new_qa_count = len(qa_bank)
    print(f"📋 Số Q&A mới: {new_qa_count}")
    
    # Update data_loader.json
    update_data_loader(data, qa_bank)
    
    print(f"\n========================================")
    print(f"✅ Hoàn tất! Đã tăng từ {old_qa_count} lên {new_qa_count} Q&A pairs")
    print(f"⚠️ Bước tiếp theo: Chạy script regenerate_embeddings.py để cập nhật embeddings")
    print(f"========================================\n")

if __name__ == '__main__':
    main()
