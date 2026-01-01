// =====================================================
// HERBMED BACKEND SERVER
// =====================================================

const express = require('express');
const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');
const cors = require('cors');
const path = require('path');

const app = express();

// ====== MIDDLEWARE ======
app.use(cors());
app.use(express.json());

// Serve static frontend files
app.use(express.static(path.join(__dirname, '../../frontend')));

// ====== MONGODB CONNECTION ======
const MONGO_URI = process.env.MONGO_URI || 'mongodb://127.0.0.1:27017/herbmed';

mongoose
    .connect(MONGO_URI)
    .then(() => console.log('✅ Connected to MongoDB herbmed'))
    .catch((err) => console.error('❌ MongoDB error:', err));

// ====== SCHEMA & MODEL ======
const userSchema = new mongoose.Schema({
    username: { type: String, required: true, unique: true },
    email: { type: String, required: true, unique: true },
    phoneNumber: { type: String },
    passwordHash: { type: String, required: true },
    age: { type: Number },
    gender: { type: String, enum: ['male', 'female', 'other'] },
    height: { type: Number },
    weight: { type: Number },
    address: { type: String },
    commonDiseases: { type: String },
    allergies: { type: String },
    createdAt: { type: Date, default: Date.now },
    lastLoginAt: { type: Date }
});

const loginSchema = new mongoose.Schema({
    userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    loginAt: { type: Date, default: Date.now },
    logoutAt: { type: Date, default: null },
    ipAddress: { type: String },
    userAgent: { type: String }
});

const User = mongoose.model('User', userSchema);
const Login = mongoose.model('Login', loginSchema);

// ====== API ROUTES ======

// Health check
app.get('/api/health', (req, res) => {
    res.json({ status: 'ok' });
});

// Signup
app.post('/api/signup', async (req, res) => {
    try {
        const {
            email,
            phonenumber,
            username,
            age,
            gender,
            height,
            weight,
            address,
            psw,
            commonDiseases,
            allergies
        } = req.body;

        if (!email || !username || !psw) {
            return res.status(400).json({ message: 'Thiếu email / username / password' });
        }

        const existed = await User.findOne({
            $or: [{ email }, { username }]
        });

        if (existed) {
            return res.status(400).json({ message: 'Email hoặc username đã tồn tại' });
        }

        const passwordHash = await bcrypt.hash(psw, 10);

        const user = await User.create({
            email,
            username,
            phoneNumber: phonenumber,
            age,
            gender,
            height,
            weight,
            address,
            passwordHash,
            commonDiseases,
            allergies
        });

        res.status(201).json({
            message: 'Đăng ký thành công',
            userId: user._id
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: 'Lỗi server khi signup' });
    }
});

// Login
app.post('/api/login', async (req, res) => {
    try {
        const { username, password } = req.body;

        if (!username || !password) {
            return res.status(400).json({ message: 'Thiếu username hoặc password' });
        }

        const user = await User.findOne({ username });
        if (!user) {
            return res.status(400).json({ message: 'Sai username hoặc password' });
        }

        const ok = await bcrypt.compare(password, user.passwordHash);
        if (!ok) {
            return res.status(400).json({ message: 'Sai username hoặc password' });
        }

        // Update last login
        user.lastLoginAt = new Date();
        await user.save();

        // Log login
        await Login.create({
            userId: user._id,
            ipAddress: req.ip,
            userAgent: req.headers['user-agent'] || ''
        });

        res.json({
            message: 'Đăng nhập thành công',
            userId: user._id,
            username: user.username
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: 'Lỗi server khi login' });
    }
});

// Catch-all: serve frontend for any unmatched routes
app.get('*', (req, res) => {
    res.sendFile(path.join(__dirname, '../../frontend/index.html'));
});

// ====== START SERVER ======
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`🚀 Server running at http://localhost:${PORT}`);
});
