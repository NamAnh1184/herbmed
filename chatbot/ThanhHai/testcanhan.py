import streamlit as st
import json
import os
import pickle
from datetime import datetime
import re
import unicodedata

# ===== PAGE CONFIG =====
st.set_page_config(
    page_title="Medical Chatbot 🏥",
    page_icon="🏥",
    layout="wide",
    initial_sidebar_state="expanded"
)

# ===== CUSTOM CSS =====
st.markdown("""
<style>
    .stChatMessage {
        padding: 1rem;
        border-radius: 10px;
        margin-bottom: 1rem;
    }
    .main-header {
        text-align: center;
        padding: 2rem 0;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border-radius: 10px;
        margin-bottom: 2rem;
    }
    .stats-card {
        background-color: #ffffff;
        padding: 1rem;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        margin-bottom: 1rem;
    }
    .warning-box {
        background-color: #fff3cd;
        border-left: 4px solid #ffc107;
        padding: 1rem;
        border-radius: 5px;
        margin: 1rem 0;
    }
</style>
""", unsafe_allow_html=True)

# ===== INITIALIZE SESSION STATE =====
def init_session_state():
    """Khởi tạo session state"""
    if 'chatbot' not in st.session_state:
        st.session_state.chatbot = None
    if 'chat_history' not in st.session_state:
        st.session_state.chat_history = []
    if 'model_loaded' not in st.session_state:
        st.session_state.model_loaded = False
    if 'show_sources' not in st.session_state:
        st.session_state.show_sources = True
    if 'show_intent' not in st.session_state:
        st.session_state.show_intent = True
    if 'data_stats' not in st.session_state:
        st.session_state.data_stats = {}

init_session_state()

# ============================================================
# 0) HELLO RULE (KHÔNG DÙNG API)
# ============================================================
HELLO_PATTERNS = [
    r"^\s*(hi|hello|hey|helo|hii+)\s*$",
    r"^\s*(xin\s*chào|chào|chao|chào\s*bạn|chao\s*ban)\s*$",
    r"^\s*(alo|a\s*l\s*o|ê|êi|ei|ad\s*ơi|admin\s*ơi|mày\s*ơi|may\s*oi)\s*$",
    r"^\s*(chào\s*buổi\s*sáng|chào\s*buổi\s*trưa|chào\s*buổi\s*chiều|chào\s*buổi\s*tối)\s*$",
]
HELLO_REPLY = (
    "Xin chào 👋 Mình là **trợ lý ảo tư vấn thông tin bệnh tiêu hoá**.\n\n"
    "Bạn có thể hỏi theo các dạng:\n"
    "- **Triệu chứng**: “đau bụng, buồn nôn là bệnh gì?”\n"
    "- **Bệnh**: “triệu chứng viêm dạ dày?”\n"
    "- **Thuốc**: “omeprazole dùng như thế nào?”\n"
    "- **Thảo dược**: “nghệ vàng có tác dụng gì?”\n\n"
    "⚠️ Thông tin chỉ mang tính tham khảo, không thay thế tư vấn bác sĩ."
)

def hello_no_api_reply(user_query: str):
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
# 1) LOAD SYNONYMS.JSON (giữ nguyên luồng còn lại)
# ============================================================
def _remove_accents(s: str) -> str:
    s = unicodedata.normalize("NFD", s)
    s = "".join(ch for ch in s if unicodedata.category(ch) != "Mn")
    return unicodedata.normalize("NFC", s)

def _norm(s: str) -> str:
    s = s.strip().lower()
    s = _remove_accents(s)
    s = re.sub(r"\s+", " ", s)
    return s

@st.cache_data
def load_synonyms(path: str = "synonyms.json") -> dict:
    """
    Đọc synonyms.json nếu có (đặt cùng thư mục với app.py).
    Trả về dict: intent -> list[phrase_normalized]
    """
    if not os.path.exists(path):
        return {}
    try:
        with open(path, "r", encoding="utf-8") as f:
            raw = json.load(f)
        return {k: [_norm(x) for x in v] for k, v in raw.items() if isinstance(v, list)}
    except Exception:
        return {}

# ============================================================
# 2) LOAD CHATBOT FROM SAVED MODEL
# ============================================================
@st.cache_resource
def load_chatbot_from_saved_model(save_dir="./saved_model"):
    """
    Load chatbot từ saved model
    Sử dụng @st.cache_resource để cache và tránh load lại nhiều lần
    """
    try:
        # Import OpenAI + dotenv (nếu có)
        try:
            from openai import OpenAI
        except Exception:
            return None, "Thiếu thư viện openai. Hãy cài: pip install openai"

        try:
            from dotenv import load_dotenv
            load_dotenv()
        except Exception:
            # Không bắt buộc dotenv nếu bạn đã export OPENAI_API_KEY
            pass

        # Kiểm tra saved model có tồn tại không
        if not os.path.exists(save_dir):
            return None, "Không tìm thấy saved model. Vui lòng chạy file chatbot chính trước để tạo model."

        # Load metadata
        with open(os.path.join(save_dir, 'model_metadata.json'), 'r', encoding='utf-8') as f:
            metadata = json.load(f)

        # Load data
        with open(os.path.join(save_dir, 'data_loader.json'), 'r', encoding='utf-8') as f:
            data = json.load(f)

        # Load embeddings (hỗ trợ nhiều tên file)
        qa_candidates = [
            os.path.join(save_dir, 'qa_embeddings.pkl'),
            os.path.join(save_dir, 'qa_embbedings.pkl'),
            os.path.join(save_dir, 'qa_embbedings.pkl'),
        ]
        qa_file = next((p for p in qa_candidates if os.path.exists(p)), None)
        if not qa_file:
            return None, "Không tìm thấy file QA embeddings (.pkl) trong saved_model."

        with open(qa_file, 'rb') as f:
            qa_embeddings = pickle.load(f)

        with open(os.path.join(save_dir, 'embedding_cache.pkl'), 'rb') as f:
            embedding_cache = pickle.load(f)

        # Tạo OpenAI client
        client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

        # Tạo chatbot object
        chatbot = {
            'client': client,
            'data': data,
            'qa_embeddings': qa_embeddings,
            'embedding_cache': embedding_cache,
            'metadata': metadata,
            'qa_file': os.path.basename(qa_file),
        }

        return chatbot, None

    except Exception as e:
        return None, f"Lỗi khi load model: {str(e)}"

# ============================================================
# 3) CHATBOT LOGIC FUNCTIONS (giữ nguyên, chỉ chỉnh intent đọc synonyms.json)
# ============================================================
def get_embedding(client, text: str, embedding_cache: dict, model="text-embedding-3-small"):
    """Lấy embedding cho text"""
    if text in embedding_cache:
        return embedding_cache[text]

    text = text.replace("\n", " ").strip()
    response = client.embeddings.create(input=[text], model=model)
    embedding = response.data[0].embedding
    embedding_cache[text] = embedding
    return embedding

def compute_similarity(emb1, emb2):
    """Tính cosine similarity (ưu tiên sklearn; nếu thiếu sklearn thì fallback thủ công)"""
    try:
        from sklearn.metrics.pairwise import cosine_similarity
        return cosine_similarity([emb1], [emb2])[0][0]
    except Exception:
        # fallback cosine thủ công
        dot = 0.0
        na = 0.0
        nb = 0.0
        for x, y in zip(emb1, emb2):
            dot += float(x) * float(y)
            na += float(x) * float(x)
            nb += float(y) * float(y)
        denom = (na ** 0.5) * (nb ** 0.5) + 1e-12
        return dot / denom

def classify_intent(client, query: str) -> str:
    """
    Phân loại intent:
    - Ưu tiên đọc từ synonyms.json (nếu có)
    - Nếu không có file, fallback về keyword list cũ của bạn
    """
    synonyms = load_synonyms("synonyms.json")
    qn = _norm(query)

    # Ưu tiên symptom_to_disease trước
    if synonyms:
        priority = ["symptom_to_disease", "interaction", "drug", "herb", "symptoms", "general"]
        for intent in priority:
            for phrase in synonyms.get(intent, []):
                if phrase and phrase in qn:
                    return intent

    # Fallback (giữ nguyên logic cũ)
    INTENTS = {
        "symptoms": ["triệu chứng", "dấu hiệu", "biểu hiện", "symptoms", "signs"],
        "herb": ["thảo dược", "nghệ", "đông y", "yhct", "herb", "herbal"],
        "drug": ["thuốc tây", "thuốc", "drug", "medicine", "medication"],
        "interaction": ["tương tác", "dùng chung", "kết hợp", "interaction", "combine"],
        "symptom_to_disease": ["tôi bị", "tôi có", "bệnh gì", "what disease", "i have"],
        "general": ["là gì", "what is", "thông tin", "information"]
    }

    query_lower = query.lower()
    for intent, keywords in INTENTS.items():
        for keyword in keywords:
            if keyword in query_lower:
                return intent

    return "general"

def retrieve_documents(client, query: str, intent: str, qa_embeddings: list,
                       embedding_cache: dict, top_k: int = 3):
    """Retrieve top-k relevant documents"""
    query_embedding = get_embedding(client, query, embedding_cache)

    scores = []
    for item in qa_embeddings:
        if intent != "general" and item["qa"].get("intent") != intent:
            continue

        similarity = compute_similarity(query_embedding, item["embedding"])
        scores.append((similarity, item["qa"]))

    scores.sort(reverse=True, key=lambda x: x[0])
    return [{"score": score, "qa": qa} for score, qa in scores[:top_k]]

def generate_response(client, query: str, intent: str, retrieved_docs: list) -> str:
    """Generate response từ retrieved documents"""

    if not retrieved_docs:
        return f"""Xin lỗi, CSDL hiện tại chưa có đủ thông tin để trả lời câu hỏi: "{query}"

💡 Gợi ý:
- Thử diễn đạt câu hỏi khác đi
- Cung cấp thêm triệu chứng cụ thể
- Nêu rõ tên bệnh hoặc thuốc bạn muốn hỏi

⚠️ Nếu bạn có triệu chứng nghiêm trọng, hãy đến cơ sở y tế để được thăm khám trực tiếp.
"""

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

def chat_with_bot(chatbot, user_query: str):
    """Main chat function"""

    # ✅ 0) HELLO: trả lời ngay, KHÔNG dùng API
    rb = hello_no_api_reply(user_query)
    if rb is not None:
        return rb

    # phần còn lại giữ nguyên (có API như cũ)
    client = chatbot['client']
    qa_embeddings = chatbot['qa_embeddings']
    embedding_cache = chatbot['embedding_cache']

    # Classify intent (đọc synonyms.json trước)
    intent = classify_intent(client, user_query)

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

# ===== HELPER FUNCTIONS =====
def get_intent_emoji(intent: str) -> str:
    """Lấy emoji cho từng intent"""
    intent_emojis = {
        "symptoms": "🩺",
        "herb": "🌿",
        "drug": "💊",
        "interaction": "⚠️",
        "symptom_to_disease": "🔍",
        "general": "ℹ️",
        "smalltalk": "💬",
    }
    return intent_emojis.get(intent, "💬")

def export_chat_history():
    """Export lịch sử chat ra file JSON"""
    if st.session_state.chat_history:
        export_data = {
            "exported_at": datetime.now().isoformat(),
            "total_messages": len(st.session_state.chat_history),
            "chat_history": st.session_state.chat_history
        }
        json_str = json.dumps(export_data, ensure_ascii=False, indent=2)
        return json_str
    return None

# ============================================================
# SIDEBAR
# ============================================================
with st.sidebar:
    st.markdown("## ⚙️ Cài đặt")

    if not st.session_state.model_loaded:
        if st.button("🚀 Khởi động Chatbot", use_container_width=True):
            with st.spinner("🔄 Đang tải Medical Chatbot..."):
                chatbot, error = load_chatbot_from_saved_model("./saved_model")

                if error:
                    st.error(f"❌ {error}")
                    st.info("💡 **Hướng dẫn:** Chạy file chatbot chính trước để tạo saved model, sau đó quay lại đây.")
                else:
                    st.session_state.chatbot = chatbot
                    st.session_state.model_loaded = True
                    st.session_state.data_stats = {
                        'diseases': len(chatbot['data'].get('disease_names', {})),
                        'qa_pairs': len(chatbot['data'].get('qa_bank_flat', [])),
                        'embeddings': len(chatbot.get('embedding_cache', {})),
                        'qa_file': chatbot.get('qa_file', '')
                    }
                    st.success("✅ Chatbot đã sẵn sàng!")
                    st.rerun()
    else:
        st.success("✅ Chatbot đang hoạt động")

        if st.button("🔄 Tải lại Model", use_container_width=True):
            st.session_state.model_loaded = False
            st.session_state.chatbot = None
            st.cache_resource.clear()
            st.rerun()

    st.markdown("---")

    st.markdown("### 🎨 Hiển thị")
    st.session_state.show_intent = st.checkbox("Hiển thị Intent", value=st.session_state.show_intent)
    st.session_state.show_sources = st.checkbox("Hiển thị nguồn tham khảo", value=st.session_state.show_sources)

    st.markdown("---")

    if st.session_state.model_loaded and st.session_state.data_stats:
        st.markdown("### 📊 Thống kê")
        stats = st.session_state.data_stats
        st.markdown(f"""
        <div class="stats-card">
            <strong>🏥 Bệnh:</strong> {stats.get('diseases', 0)}<br>
            <strong>💬 QA Pairs:</strong> {stats.get('qa_pairs', 0)}<br>
            <strong>💾 Embeddings:</strong> {stats.get('embeddings', 0)}<br>
            <strong>📦 QA file:</strong> {stats.get('qa_file', '')}<br>
            <strong>📝 Tin nhắn:</strong> {len(st.session_state.chat_history)}
        </div>
        """, unsafe_allow_html=True)

    st.markdown("---")

    st.markdown("### 📜 Quản lý Chat")
    col1, col2 = st.columns(2)

    with col1:
        if st.button("🗑️ Xóa lịch sử", use_container_width=True):
            st.session_state.chat_history = []
            st.success("Đã xóa lịch sử!")
            st.rerun()

    with col2:
        chat_json = export_chat_history()
        if chat_json:
            st.download_button(
                label="💾 Export",
                data=chat_json,
                file_name=f"chat_history_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json",
                mime="application/json",
                use_container_width=True
            )

    st.markdown("---")

    st.markdown("### 💡 Câu hỏi mẫu")
    sample_questions = [
        "Hello",
        "Xin chào",
        "Alo admin ơi",
        "Nghệ vàng có tác dụng gì với viêm dạ dày?",
        "Thuốc Omeprazole dùng như thế nào?",
        "Triệu chứng của viêm loét dạ dày?",
        "Tôi bị đau bụng, buồn nôn là bệnh gì?",
        "Thảo dược nào tốt cho tiêu hóa?"
    ]

    for i, question in enumerate(sample_questions):
        if st.button(f"📝 {question[:35]}...", key=f"sample_{i}", use_container_width=True):
            st.session_state.current_question = question
            st.rerun()

# ============================================================
# MAIN CONTENT
# ============================================================

st.markdown("""
<div class="main-header">
    <h1>🏥 Medical Chatbot Assistant</h1>
    <p>Trợ lý y tế AI - Tư vấn thông tin về bệnh tiêu hóa</p>
</div>
""", unsafe_allow_html=True)

st.markdown("""
<div class="warning-box">
    ⚠️ <strong>Lưu ý quan trọng:</strong> Thông tin từ chatbot chỉ mang tính tham khảo, 
    không thay thế cho chẩn đoán và tư vấn y tế trực tiếp từ bác sĩ. 
    Nếu có triệu chứng nghiêm trọng, hãy đến cơ sở y tế ngay lập tức.
</div>
""", unsafe_allow_html=True)

if not st.session_state.model_loaded:
    st.info("👈 Vui lòng nhấn nút **'Khởi động Chatbot'** ở sidebar để bắt đầu!")

    col1, col2, col3 = st.columns(3)
    with col1:
        st.markdown("### 🩺 Hỏi về triệu chứng\nTìm hiểu các triệu chứng và dấu hiệu của bệnh")
    with col2:
        st.markdown("### 🌿 Thảo dược & Đông y\nThông tin về các loại thảo dược và cách sử dụng")
    with col3:
        st.markdown("### 💊 Thuốc & Tương tác\nHướng dẫn sử dụng thuốc và tương tác thuốc")

else:
    # Display chat history
    for message in st.session_state.chat_history:
        with st.chat_message("user"):
            st.write(message["query"])

        with st.chat_message("assistant"):
            if st.session_state.show_intent and "intent" in message:
                intent = message["intent"]
                emoji = get_intent_emoji(intent)
                st.caption(f"{emoji} Intent: **{intent}**")

            st.markdown(message["response"])

            if st.session_state.show_sources and "retrieved_docs" in message:
                with st.expander("📚 Nguồn tham khảo"):
                    for i, doc in enumerate(message["retrieved_docs"], 1):
                        st.markdown(f"""
                        **Nguồn {i}:** {doc['qa'].get('disease', 'N/A')}  
                        **Độ liên quan:** {doc['score']:.2%}
                        """)

    # Chat input
    if 'current_question' in st.session_state:
        user_input = st.session_state.current_question
        del st.session_state.current_question
    else:
        user_input = st.chat_input("💬 Nhập câu hỏi của bạn...", key="chat_input")

    # Process user input
    if user_input:
        with st.chat_message("user"):
            st.write(user_input)

        with st.chat_message("assistant"):
            with st.spinner("🤔 Đang suy nghĩ..."):
                try:
                    result = chat_with_bot(st.session_state.chatbot, user_input)

                    if st.session_state.show_intent:
                        intent = result["intent"]
                        emoji = get_intent_emoji(intent)
                        st.caption(f"{emoji} Intent: **{intent}**")

                    st.markdown(result["response"])

                    if st.session_state.show_sources and result.get("retrieved_docs"):
                        with st.expander("📚 Nguồn tham khảo"):
                            for i, doc in enumerate(result["retrieved_docs"], 1):
                                st.markdown(f"""
                                **Nguồn {i}:** {doc['qa'].get('disease', 'N/A')}  
                                **Độ liên quan:** {doc['score']:.2%}
                                """)

                    # Add to chat history
                    st.session_state.chat_history.append({
                        "query": user_input,
                        "intent": result["intent"],
                        "response": result["response"],
                        "retrieved_docs": result.get("retrieved_docs", []),
                        "timestamp": datetime.now().isoformat()
                    })

                except Exception as e:
                    st.error(f"❌ Lỗi: {str(e)}")

# ===== FOOTER =====
st.markdown("---")
st.markdown("""
<div style="text-align: center; color: #666; padding: 1rem;">
    <p>🏥 <strong>Medical Chatbot v1.0</strong> | Powered by OpenAI & RAG Technology</p>
    <p><small>⚠️ Chỉ dùng để tham khảo - Không thay thế tư vấn y tế chuyên nghiệp</small></p>
</div>
""", unsafe_allow_html=True)
