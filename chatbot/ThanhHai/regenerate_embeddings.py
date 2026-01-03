# regenerate_embeddings.py - Regenerate embeddings cho Q&A mới
# Chạy sau khi expand_qa_database.py

import json
import os
import pickle
import sys

# Fix Windows encoding
if sys.platform == 'win32':
    sys.stdout.reconfigure(encoding='utf-8')

from dotenv import load_dotenv

load_dotenv()

def main():
    print("🚀 Bắt đầu regenerate embeddings...\n")
    
    # Check OpenAI API key
    api_key = os.getenv('OPENAI_API_KEY')
    if not api_key:
        print("❌ Không tìm thấy OPENAI_API_KEY trong .env")
        return
    
    try:
        from openai import OpenAI
    except ImportError:
        print("❌ Thiếu thư viện openai. Chạy: pip install openai")
        return
    
    client = OpenAI(api_key=api_key)
    
    # Load data
    print("📋 Đang load data_loader.json...")
    with open('saved_model/data_loader.json', 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    qa_bank = data.get('qa_bank_flat', [])
    docs = data.get('docs', [])
    
    print(f"   - Số Q&A: {len(qa_bank)}")
    print(f"   - Số docs: {len(docs)}")
    
    # Create embeddings for Q&A bank
    print("\n🔄 Đang tạo embeddings cho Q&A bank...")
    qa_embeddings = []
    embedding_cache = {}
    
    for i, qa in enumerate(qa_bank):
        question = qa.get('question', '')
        answer = qa.get('answer', '')
        
        # Create combined text for embedding
        combined = f"Câu hỏi: {question}\nTrả lời: {answer[:500]}"
        
        try:
            response = client.embeddings.create(
                input=[combined],
                model="text-embedding-3-small"
            )
            embedding = response.data[0].embedding
            
            qa_embeddings.append({
                'qa': qa,
                'embedding': embedding
            })
            
            # Cache the embedding
            embedding_cache[question] = embedding
            
            if (i + 1) % 50 == 0:
                print(f"   ✅ Đã xử lý {i + 1}/{len(qa_bank)} Q&A")
                
        except Exception as e:
            print(f"   ❌ Lỗi embedding Q&A {i}: {e}")
            continue
    
    # Also create embeddings for docs
    print("\n🔄 Đang tạo embeddings cho documents...")
    for i, doc in enumerate(docs):  # Process ALL docs
        text = doc.get('text', '')[:1000]  # Limit text length
        title = doc.get('title', '')
        
        combined = f"{title}\n{text}"
        
        try:
            response = client.embeddings.create(
                input=[combined],
                model="text-embedding-3-small"
            )
            embedding = response.data[0].embedding
            
            qa_embeddings.append({
                'qa': {
                    'question': title,
                    'answer': text,
                    'intent': doc.get('type', 'general'),
                    'disease': doc.get('metadata', {}).get('disease', '')
                },
                'embedding': embedding
            })
            
            embedding_cache[title] = embedding
            
            if (i + 1) % 50 == 0:
                print(f"   ✅ Đã xử lý {i + 1} documents")
                
        except Exception as e:
            print(f"   ❌ Lỗi embedding doc {i}: {e}")
            continue
    
    # Save embeddings
    print("\n💾 Đang lưu embeddings...")
    
    # Backup old files (remove old backups first)
    if os.path.exists('saved_model/qa_embeddings_backup.pkl'):
        os.remove('saved_model/qa_embeddings_backup.pkl')
    if os.path.exists('saved_model/embedding_cache_backup.pkl'):
        os.remove('saved_model/embedding_cache_backup.pkl')
    if os.path.exists('saved_model/qa_embeddings.pkl'):
        os.rename('saved_model/qa_embeddings.pkl', 'saved_model/qa_embeddings_backup.pkl')
    if os.path.exists('saved_model/embedding_cache.pkl'):
        os.rename('saved_model/embedding_cache.pkl', 'saved_model/embedding_cache_backup.pkl')
    
    with open('saved_model/qa_embeddings.pkl', 'wb') as f:
        pickle.dump(qa_embeddings, f)
    
    with open('saved_model/embedding_cache.pkl', 'wb') as f:
        pickle.dump(embedding_cache, f)
    
    # Update metadata
    metadata = {
        'qa_count': len(qa_bank),
        'embedding_count': len(qa_embeddings),
        'model': 'text-embedding-3-small',
        'updated': True
    }
    
    with open('saved_model/model_metadata.json', 'w', encoding='utf-8') as f:
        json.dump(metadata, f, ensure_ascii=False, indent=2)
    
    print(f"\n========================================")
    print(f"✅ Hoàn tất regenerate embeddings!")
    print(f"   📊 Q&A embeddings: {len(qa_embeddings)}")
    print(f"   💾 Cache size: {len(embedding_cache)}")
    print(f"========================================")
    print(f"\n⚠️ Hãy restart chatbot server để áp dụng thay đổi!")
    print(f"   cd chatbot/ThanhHai && python chatbot_api.py")

if __name__ == '__main__':
    main()
