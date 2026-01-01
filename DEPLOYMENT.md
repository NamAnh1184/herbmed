# 🚀 Hướng Dẫn Deploy HerbMed lên Railway & Vercel

## 📋 Tổng Quan

Dự án HerbMed bao gồm 3 thành phần cần deploy:

| Thành phần | Công nghệ | Nền tảng deploy |
|-----------|-----------|-----------------|
| Frontend | HTML/CSS/JS | **Vercel** |
| Backend API | Node.js/Express | **Railway** |
| Chatbot API | Python/Flask | **Railway** |
| Database | PostgreSQL | **Railway** |

## 🔧 Bước 1: Chuẩn Bị Repository GitHub

### 1.1 Push code lên GitHub

```bash
# Vào thư mục dự án
cd "c:\Users\nayeu\Downloads\làm lại"

# Khởi tạo git (nếu chưa có)
git init

# Thêm tất cả files
git add .

# Commit
git commit -m "Initial commit - HerbMed project"

# Tạo repository trên GitHub.com, sau đó:
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/herbmed.git
git push -u origin main
```

> ⚠️ **Lưu ý**: File `.gitignore` đã được cấu hình để không upload các file nhạy cảm như `.env`, `node_modules`, v.v.

---

## 🚂 Bước 2: Deploy Backend lên Railway

### 2.1 Tạo tài khoản Railway
1. Truy cập: https://railway.app
2. Đăng ký bằng GitHub

### 2.2 Tạo Project mới
1. Click **"New Project"**
2. Chọn **"Deploy from GitHub repo"**
3. Chọn repository `herbmed` của bạn

### 2.3 Thêm PostgreSQL Database
1. Trong project, click **"+ New"**
2. Chọn **"Database" → "PostgreSQL"**
3. Railway sẽ tự động tạo database và cung cấp `DATABASE_URL`

### 2.4 Cấu hình Backend Service
1. Click vào service backend
2. Vào tab **"Settings"**
3. Trong phần **"Root Directory"**, nhập: `backend`
4. Vào tab **"Variables"**, thêm các biến môi trường:

```
NODE_ENV=production
DATABASE_URL=${{Postgres.DATABASE_URL}}
```

> 💡 Railway tự động inject `DATABASE_URL` từ PostgreSQL service

### 2.5 Lấy URL Backend
Sau khi deploy xong:
1. Vào tab **"Settings"**
2. Trong phần **"Domains"**, click **"Generate Domain"**
3. Bạn sẽ có URL dạng: `https://herbmed-backend-production.up.railway.app`

---

## 🤖 Bước 3: Deploy Chatbot lên Railway

### 3.1 Thêm Service mới
1. Trong cùng project Railway, click **"+ New"**
2. Chọn **"GitHub Repo"** → chọn lại repository của bạn

### 3.2 Cấu hình Chatbot Service
1. Vào tab **"Settings"**
2. Trong phần **"Root Directory"**, nhập: `chatbot/ThanhHai`
3. Vào tab **"Variables"**, thêm:

```
OPENAI_API_KEY=sk-your-openai-api-key-here
PORT=5000
```

> ⚠️ **QUAN TRỌNG**: Bạn cần có API key từ OpenAI. Lấy tại: https://platform.openai.com/api-keys

### 3.3 Lấy URL Chatbot
1. Vào tab **"Settings"**
2. Click **"Generate Domain"**
3. URL dạng: `https://herbmed-chatbot-production.up.railway.app`

---

## 🌐 Bước 4: Deploy Frontend lên Vercel

### 4.1 Tạo tài khoản Vercel
1. Truy cập: https://vercel.com
2. Đăng ký bằng GitHub

### 4.2 Import Project
1. Click **"Add New..." → "Project"**
2. Chọn repository `herbmed`
3. Trong **"Configure Project"**:
   - **Root Directory**: `frontend`
   - **Framework Preset**: `Other`

### 4.3 Cấu hình Environment Variables
Trong phần **"Environment Variables"**, thêm:

```
HERBMED_API_URL=https://herbmed-backend-production.up.railway.app/api
HERBMED_CHATBOT_URL=https://herbmed-chatbot-production.up.railway.app/api
```

> Thay URL bằng URL thực tế từ Railway

### 4.4 Deploy
1. Click **"Deploy"**
2. Đợi vài phút để Vercel build và deploy
3. Bạn sẽ có URL dạng: `https://herbmed.vercel.app`

---

## 🗄️ Bước 5: Import Database

### 5.1 Xuất database từ máy local

```bash
# Trong thư mục backend
cd backend

# Xuất database (cần có pg_dump)
pg_dump -U postgres -d group_project -f herbmed_backup.sql
```

### 5.2 Import vào Railway PostgreSQL

**Cách 1: Sử dụng Railway CLI**
```bash
# Cài đặt Railway CLI
npm install -g @railway/cli

# Đăng nhập
railway login

# Link project
railway link

# Import database
railway run psql $DATABASE_URL < herbmed_backup.sql
```

**Cách 2: Sử dụng psql trực tiếp**
1. Lấy connection string từ Railway PostgreSQL
2. Chạy:
```bash
psql "postgresql://postgres:PASSWORD@HOST:PORT/railway" < herbmed_backup.sql
```

---

## ⚡ Bước 6: Cập Nhật Frontend URLs

Sau khi có URLs từ Railway, cần cập nhật trong frontend:

### 6.1 Cập nhật file `frontend/js/config.js`

Mở file và thay đổi URLs:

```javascript
const config = {
    API_BASE_URL: isLocalhost 
        ? 'http://localhost:3000/api' 
        : 'https://YOUR-BACKEND.up.railway.app/api',

    CHATBOT_API_URL: isLocalhost 
        ? 'http://localhost:5000/api' 
        : 'https://YOUR-CHATBOT.up.railway.app/api',
};
```

### 6.2 Commit và Push
```bash
git add .
git commit -m "Update API URLs for production"
git push
```

Vercel sẽ tự động redeploy.

---

## 🧪 Bước 7: Kiểm Tra

### 7.1 Kiểm tra Backend
```
https://your-backend.up.railway.app/api/health
```
Kết quả mong đợi: `{"status":"ok","database":"PostgreSQL"}`

### 7.2 Kiểm tra Chatbot
```
https://your-chatbot.up.railway.app/api/health
```
Kết quả mong đợi: `{"status":"ok","chatbot_loaded":true,...}`

### 7.3 Kiểm tra Frontend
Truy cập URL Vercel và test các chức năng:
- Đăng nhập
- Tìm kiếm
- Chatbot

---

## 🔧 Troubleshooting

### ❌ Backend không kết nối được database
- Kiểm tra biến `DATABASE_URL` đã được cấu hình đúng
- Kiểm tra Railway PostgreSQL service đang chạy

### ❌ Chatbot trả về lỗi
- Kiểm tra `OPENAI_API_KEY` hợp lệ
- Kiểm tra có đủ credit trong tài khoản OpenAI

### ❌ Frontend không gọi được API
- Kiểm tra CORS đã được cấu hình
- Kiểm tra URLs trong `config.js` đã đúng
- Kiểm tra browser console để xem lỗi chi tiết

### ❌ Models chatbot không load được
- Pickle files (`*.pkl`) cần được commit lên git
- Kiểm tra đường dẫn `saved_model` trong chatbot

---

## 📝 Chi Phí Ước Tính

| Dịch vụ | Gói miễn phí | Gói trả phí |
|---------|-------------|-------------|
| Railway | $5/tháng trial | ~$10-20/tháng |
| Vercel | Miễn phí (hobby) | $20/tháng (pro) |
| OpenAI | $0 (trial credits) | Pay-as-you-go |

---

## 📞 Hỗ Trợ

- Railway Docs: https://docs.railway.app
- Vercel Docs: https://vercel.com/docs
- OpenAI Docs: https://platform.openai.com/docs

---

**Chúc bạn deploy thành công! 🎉**
