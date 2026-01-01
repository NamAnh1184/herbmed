# -*- coding: utf-8 -*-
"""
Flask API Server for Medical Chatbot
Chuyển đổi từ Streamlit app sang REST API
"""

from flask import Flask, request, jsonify
from flask_cors import CORS
import json
import os
import pickle
import re
import unicodedata
from datetime import datetime
import sys

# Set stdout encoding for Windows
if sys.platform == 'win32':
    sys.stdout.reconfigure(encoding='utf-8')

# Load environment variables
try:
    from dotenv import load_dotenv
    load_dotenv()
except ImportError:
    pass

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

# ============================================================
# GLOBAL VARIABLES
# ============================================================
chatbot = None
synonyms = {}

# ============================================================
# HELLO PATTERNS (No API needed)
# ============================================================
HELLO_PATTERNS = [
    r"^\s*(hi|hello|hey|helo|hii+)\s*$",
    r"^\s*(xin\s*chào|chào|chao|chào\s*bạn|chao\s*ban)\s*$",
    r"^\s*(alo|a\s*l\s*o|ê|êi|ei|ad\s*ơi|admin\s*ơi)\s*$",
    r"^\s*(chào\s*buổi\s*sáng|chào\s*buổi\s*trưa|chào\s*buổi\s*chiều|chào\s*buổi\s*tối)\s*$",
]

HELLO_REPLY = """Xin chào! 👋 Mình là **trợ lý ảo tư vấn thông tin bệnh tiêu hoá**.

Bạn có thể hỏi theo các dạng:
- **Triệu chứng**: "đau bụng, buồn nôn là bệnh gì?"
- **Bệnh**: "triệu chứng viêm dạ dày?"
- **Thuốc**: "omeprazole dùng như thế nào?"
- **Thảo dược**: "nghệ vàng có tác dụng gì?"

⚠️ **Lưu ý**: Thông tin chỉ mang tính tham khảo, không thay thế tư vấn bác sĩ."""

def hello_no_api_reply(user_query):
    """Check if query is a greeting and return hello reply"""
    q = user_query.strip().lower()
    
    for pat in HELLO_PATTERNS:
        if re.search(pat, q, flags=re.IGNORECASE):
            return {
                "query": user_query,
                "intent": "smalltalk",
                "response": HELLO_REPLY,
                "retrieved_docs": []
            }
    return None

# ============================================================
# HELPER FUNCTIONS
# ============================================================
def remove_accents(s):
    s = unicodedata.normalize("NFD", s)
    s = "".join(ch for ch in s if unicodedata.category(ch) != "Mn")
    return unicodedata.normalize("NFC", s)

def norm_text(s):
    s = s.strip().lower()
    s = remove_accents(s)
    s = re.sub(r"\s+", " ", s)
    return s

def load_synonyms(path="synonyms.json"):
    """Load synonyms.json for intent classification"""
    if not os.path.exists(path):
        return {}
    try:
        with open(path, "r", encoding="utf-8") as f:
            raw = json.load(f)
        return {k: [norm_text(x) for x in v] for k, v in raw.items() if isinstance(v, list)}
    except Exception:
        return {}

# ============================================================
# CHATBOT CORE FUNCTIONS
# ============================================================
def get_embedding(client, text, embedding_cache, model="text-embedding-3-small"):
    """Get embedding for text"""
    if text in embedding_cache:
        return embedding_cache[text]
    
    text = text.replace("\n", " ").strip()
    response = client.embeddings.create(input=[text], model=model)
    embedding = response.data[0].embedding
    embedding_cache[text] = embedding
    return embedding

def compute_similarity(emb1, emb2):
    """Compute cosine similarity"""
    try:
        from sklearn.metrics.pairwise import cosine_similarity
        return cosine_similarity([emb1], [emb2])[0][0]
    except Exception:
        # Fallback manual cosine
        dot = sum(float(x) * float(y) for x, y in zip(emb1, emb2))
        na = sum(float(x) ** 2 for x in emb1)
        nb = sum(float(y) ** 2 for y in emb2)
        denom = (na ** 0.5) * (nb ** 0.5) + 1e-12
        return dot / denom

def classify_intent(client, query, synonyms_dict):
    """Classify intent of the query"""
    qn = norm_text(query)
    
    # Priority check with synonyms
    if synonyms_dict:
        priority = ["symptom_to_disease", "interaction", "drug", "herb", "symptoms", "general"]
        for intent in priority:
            for phrase in synonyms_dict.get(intent, []):
                if phrase and phrase in qn:
                    return intent
    
    # Fallback keywords
    INTENTS = {
        "symptoms": ["trieu chung", "dau hieu", "bieu hien", "symptoms", "signs"],
        "herb": ["thao duoc", "nghe", "dong y", "yhct", "herb", "herbal"],
        "drug": ["thuoc tay", "thuoc", "drug", "medicine", "medication"],
        "interaction": ["tuong tac", "dung chung", "ket hop", "interaction", "combine"],
        "symptom_to_disease": ["toi bi", "toi co", "benh gi", "what disease", "i have"],
        "general": ["la gi", "what is", "thong tin", "information"]
    }
    
    query_normalized = norm_text(query)
    for intent, keywords in INTENTS.items():
        for keyword in keywords:
            if keyword in query_normalized:
                return intent
    
    return "general"

def retrieve_documents(client, query, intent, qa_embeddings, embedding_cache, top_k=3):
    """Retrieve top-k relevant documents"""
    query_embedding = get_embedding(client, query, embedding_cache)
    
    # First try: filter by intent
    scores = []
    for item in qa_embeddings:
        item_intent = item["qa"].get("intent", "general")
        # Only filter by intent for specific intents (not "general")
        if intent != "general" and item_intent != intent:
            continue
        
        similarity = compute_similarity(query_embedding, item["embedding"])
        scores.append((similarity, item["qa"]))
    
    # Fallback: if no results with intent filter, search all documents
    if len(scores) < top_k:
        scores = []
        for item in qa_embeddings:
            similarity = compute_similarity(query_embedding, item["embedding"])
            scores.append((similarity, item["qa"]))
    
    scores.sort(reverse=True, key=lambda x: x[0])
    return [{"score": score, "qa": qa} for score, qa in scores[:top_k]]

def generate_response(client, query, intent, retrieved_docs):
    """Generate response from retrieved documents"""
    
    if not retrieved_docs:
        return """Xin lỗi, CSDL hiện tại chưa có đủ thông tin để trả lời câu hỏi của bạn.

💡 **Gợi ý**:
- Thử diễn đạt câu hỏi khác đi
- Cung cấp thêm triệu chứng cụ thể
- Nêu rõ tên bệnh hoặc thuốc bạn muốn hỏi

⚠️ Nếu bạn có triệu chứng nghiêm trọng, hãy đến cơ sở y tế để được thăm khám trực tiếp."""
    
    # Prepare context
    context_parts = []
    for i, doc in enumerate(retrieved_docs, 1):
        qa = doc["qa"]
        score = doc["score"]
        
        context_parts.append(f"""
[Tài liệu {i}] (Độ liên quan: {score:.2f})
Bệnh: {qa.get('disease', 'N/A')}
Intent: {qa.get('intent', 'N/A')}
Câu trả lời từ CSDL:
{qa.get('answer', 'N/A')}
---
""")
    
    context = "\n".join(context_parts)
    
    system_prompt = """Bạn là trợ lý y tế AI chuyên nghiệp, trả lời HOÀN TOÀN dựa trên dữ liệu có sẵn trong cơ sở dữ liệu (CSDL).

QUY TẮC BẮT BUỘC:
1. CHỈ sử dụng thông tin từ CSDL được cung cấp
2. KHÔNG bổ sung kiến thức y khoa bên ngoài
3. KHÔNG đưa ra khuyến nghị điều trị cụ thể
4. Luôn nhắc nhở: "⚠️ Thông tin mang tính tham khảo, không thay thế chẩn đoán và tư vấn y khoa trực tiếp"
5. Nếu CSDL không có thông tin, nói rõ "CSDL chưa có thông tin về..."
6. Trích dẫn nguồn từ CSDL khi có
7. Trả lời bằng tiếng Việt, rõ ràng, có cấu trúc

ĐỊNH DẠNG TRẢ LỜI:
- Sử dụng bullet points khi liệt kê
- Highlight từ khóa quan trọng bằng **bold**
- Thêm emoji phù hợp để dễ đọc
"""
    
    user_prompt = f"""Câu hỏi: {query}

Intent: {intent}

Thông tin từ CSDL:
{context}

Hãy trả lời câu hỏi dựa HOÀN TOÀN trên thông tin từ CSDL trên."""
    
    response = client.chat.completions.create(
        model="gpt-4o-mini",
        messages=[
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_prompt}
        ],
        temperature=0.3,
        max_tokens=1500
    )
    
    return response.choices[0].message.content

def chat_with_bot(chatbot_data, user_query, synonyms_dict):
    """Main chat function"""
    
    # Check for hello greeting first (no API needed)
    rb = hello_no_api_reply(user_query)
    if rb is not None:
        return rb
    
    # Get chatbot components
    client = chatbot_data['client']
    qa_embeddings = chatbot_data['qa_embeddings']
    embedding_cache = chatbot_data['embedding_cache']
    
    # Classify intent
    intent = classify_intent(client, user_query, synonyms_dict)
    
    # Retrieve documents
    retrieved_docs = retrieve_documents(
        client, user_query, intent, qa_embeddings, embedding_cache, top_k=3
    )
    
    # Generate response
    response = generate_response(client, user_query, intent, retrieved_docs)
    
    return {
        "query": user_query,
        "intent": intent,
        "response": response,
        "retrieved_docs": retrieved_docs
    }

# ============================================================
# LOAD MODEL ON STARTUP
# ============================================================
def load_chatbot(save_dir="./saved_model"):
    """Load chatbot from saved model"""
    global chatbot, synonyms
    
    try:
        from openai import OpenAI
    except ImportError:
        print("❌ Thiếu thư viện openai. Cài đặt: pip install openai")
        return False
    
    # Check saved model exists
    if not os.path.exists(save_dir):
        print(f"❌ Không tìm thấy saved model tại {save_dir}")
        return False
    
    try:
        # Load metadata
        meta_path = os.path.join(save_dir, 'model_metadata.json')
        if os.path.exists(meta_path):
            with open(meta_path, 'r', encoding='utf-8') as f:
                metadata = json.load(f)
        else:
            metadata = {}
        
        # Load data
        data_path = os.path.join(save_dir, 'data_loader.json')
        with open(data_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        # Load embeddings (support multiple file names)
        qa_candidates = [
            os.path.join(save_dir, 'qa_embeddings.pkl'),
            os.path.join(save_dir, 'qa_embbedings.pkl'),
        ]
        qa_file = next((p for p in qa_candidates if os.path.exists(p)), None)
        if not qa_file:
            print("❌ Không tìm thấy file QA embeddings")
            return False
        
        with open(qa_file, 'rb') as f:
            qa_embeddings = pickle.load(f)
        
        cache_path = os.path.join(save_dir, 'embedding_cache.pkl')
        with open(cache_path, 'rb') as f:
            embedding_cache = pickle.load(f)
        
        # Create OpenAI client
        api_key = os.getenv("OPENAI_API_KEY")
        if not api_key:
            print("❌ Không tìm thấy OPENAI_API_KEY trong environment")
            return False
        
        client = OpenAI(api_key=api_key)
        
        # Store chatbot
        chatbot = {
            'client': client,
            'data': data,
            'qa_embeddings': qa_embeddings,
            'embedding_cache': embedding_cache,
            'metadata': metadata,
        }
        
        # Load synonyms
        synonyms = load_synonyms("synonyms.json")
        
        print("✅ Chatbot đã tải thành công!")
        print(f"   📊 Số bệnh: {len(data.get('disease_names', {}))}")
        print(f"   💬 QA pairs: {len(data.get('qa_bank_flat', []))}")
        print(f"   💾 Embeddings cached: {len(embedding_cache)}")
        
        return True
        
    except Exception as e:
        print(f"❌ Lỗi khi tải model: {str(e)}")
        import traceback
        traceback.print_exc()
        return False

# ============================================================
# API ENDPOINTS
# ============================================================
@app.route('/api/health', methods=['GET'])
def health_check():
    """Health check endpoint"""
    return jsonify({
        "status": "ok",
        "chatbot_loaded": chatbot is not None,
        "timestamp": datetime.now().isoformat()
    })

@app.route('/api/chat', methods=['POST'])
def chat():
    """Chat endpoint"""
    global chatbot, synonyms
    
    if chatbot is None:
        return jsonify({
            "error": "Chatbot chưa được khởi tạo. Vui lòng thử lại sau.",
            "success": False
        }), 503
    
    data = request.get_json()
    if not data or 'message' not in data:
        return jsonify({
            "error": "Thiếu trường 'message' trong request",
            "success": False
        }), 400
    
    user_message = data['message'].strip()
    if not user_message:
        return jsonify({
            "error": "Message không được để trống",
            "success": False
        }), 400
    
    try:
        result = chat_with_bot(chatbot, user_message, synonyms)
        
        return jsonify({
            "success": True,
            "query": result["query"],
            "intent": result["intent"],
            "response": result["response"],
            "sources": [
                {
                    "disease": doc["qa"].get("disease", "N/A"),
                    "score": round(doc["score"], 4)
                }
                for doc in result.get("retrieved_docs", [])
            ]
        })
        
    except Exception as e:
        print(f"❌ Lỗi chat: {str(e)}")
        import traceback
        traceback.print_exc()
        return jsonify({
            "error": f"Lỗi xử lý: {str(e)}",
            "success": False
        }), 500

@app.route('/api/stats', methods=['GET'])
def get_stats():
    """Get chatbot statistics"""
    global chatbot
    
    if chatbot is None:
        return jsonify({"error": "Chatbot not loaded"}), 503
    
    data = chatbot.get('data', {})
    return jsonify({
        "diseases": len(data.get('disease_names', {})),
        "qa_pairs": len(data.get('qa_bank_flat', [])),
        "embeddings_cached": len(chatbot.get('embedding_cache', {}))
    })

# ============================================================
# MAIN
# ============================================================
if __name__ == '__main__':
    print("🚀 Đang khởi động Medical Chatbot API Server...")
    
    # Get the directory where this script is located
    script_dir = os.path.dirname(os.path.abspath(__file__))
    os.chdir(script_dir)
    
    # Load chatbot on startup
    if load_chatbot("./saved_model"):
        print("🏥 Medical Chatbot API đã sẵn sàng!")
    else:
        print("⚠️ Chatbot không tải được. API sẽ trả về lỗi cho đến khi model được tải.")
    
    # Get port from environment variable (Railway sets this automatically)
    port = int(os.getenv('PORT', 5000))
    
    # Run Flask app
    print(f"🌐 Server đang chạy tại http://0.0.0.0:{port}")
    app.run(host='0.0.0.0', port=port, debug=False)

