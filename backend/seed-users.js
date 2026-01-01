// =====================================================
// SCRIPT TẠO 350 NGƯỜI DÙNG MẪU
// Chạy: node seed-users.js
// =====================================================

const { Pool } = require('pg');
const bcrypt = require('bcryptjs');
require('dotenv').config();

const pool = new Pool({
    host: process.env.POSTGRES_HOST || 'localhost',
    port: process.env.POSTGRES_PORT || 5432,
    user: process.env.POSTGRES_USER || 'postgres',
    password: process.env.POSTGRES_PASSWORD || '12345678',
    database: process.env.POSTGRES_DATABASE || 'group_project'
});

// ====== DỮ LIỆU MẪU ======

// Họ và tên Việt Nam
const ho = ['Nguyễn', 'Trần', 'Lê', 'Phạm', 'Hoàng', 'Huỳnh', 'Phan', 'Vũ', 'Võ', 'Đặng', 'Bùi', 'Đỗ', 'Hồ', 'Ngô', 'Dương', 'Lý'];
const tenDem = ['Văn', 'Thị', 'Hoàng', 'Minh', 'Ngọc', 'Quang', 'Thanh', 'Tuấn', 'Kim', 'Anh', 'Bảo', 'Đức', 'Hải', 'Hương', 'Lan', 'Mai', 'Phương', 'Thu', 'Xuân', ''];
const ten = ['An', 'Anh', 'Bình', 'Chi', 'Cường', 'Dũng', 'Giang', 'Hà', 'Hải', 'Hạnh', 'Hiếu', 'Hòa', 'Hùng', 'Hương', 'Khoa', 'Lan', 'Linh', 'Long', 'Mai', 'Minh', 'Nam', 'Nga', 'Ngọc', 'Nhung', 'Phong', 'Phương', 'Quân', 'Sơn', 'Thảo', 'Thành', 'Thủy', 'Trang', 'Trung', 'Tú', 'Tuấn', 'Vinh', 'Vy', 'Yến'];

// Tỉnh/Thành phố (giống form đăng ký)
const tinhThanh = [
    'An Giang', 'Bắc Ninh', 'Cà Mau', 'Cao Bằng', 'Điện Biên', 'Đắk Lắk',
    'Đồng Nai', 'Đồng Tháp', 'Gia Lai', 'Hà Tĩnh', 'Hưng Yên', 'Khánh Hoà',
    'Lai Châu', 'Lạng Sơn', 'Lào Cai', 'Lâm Đồng', 'Nghệ An', 'Ninh Bình',
    'Phú Thọ', 'Quảng Ngãi', 'Quảng Ninh', 'Quảng Trị', 'Sơn La', 'Tây Ninh',
    'Thái Nguyên', 'Thanh Hóa', 'TP. Cần Thơ', 'TP. Đà Nẵng', 'TP. Hà Nội',
    'TP. Hải Phòng', 'TP. Hồ Chí Minh', 'TP. Huế', 'Tuyên Quang', 'Vĩnh Long'
];

// Giới tính
const gioiTinh = ['Nam', 'Nữ', 'Khác'];

// Bệnh phổ biến ở Việt Nam
const benhPhooBien = [
    'Viêm mũi dị ứng', 'Đau dạ dày', 'Tiểu đường type 2', 'Cao huyết áp',
    'Viêm họng', 'Cảm cúm thường xuyên', 'Viêm gan B', 'Đau lưng mãn tính',
    'Mất ngủ', 'Stress', 'Đau đầu migraine', 'Viêm khớp', 'Hen suyễn',
    'Bệnh tim mạch', 'Cholesterol cao', 'Gout', 'Viêm xoang', 'Trào ngược dạ dày',
    'Viêm loét dạ dày', 'Đau khớp gối', 'Thoái hóa cột sống', 'Viêm phế quản',
    'Rối loạn tiêu hóa', 'Viêm da cơ địa', 'Mụn trứng cá', 'Rụng tóc',
    'Thiếu máu', 'Suy nhược cơ thể', 'Béo phì', 'Táo bón mãn tính'
];

// Dị ứng phổ biến
const diUng = [
    'Dị ứng penicillin', 'Dị ứng hải sản', 'Dị ứng đậu phộng',
    'Dị ứng sữa bò', 'Dị ứng trứng', 'Dị ứng bụi nhà',
    'Dị ứng phấn hoa', 'Dị ứng aspirin', 'Dị ứng sulfa',
    'Dị ứng latex', 'Không có dị ứng', 'Không có dị ứng', 'Không có dị ứng'
];

// ====== HÀM TRỢ GIÚP ======

function random(arr) {
    return arr[Math.floor(Math.random() * arr.length)];
}

function randomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function generateUsername(hoTen, index) {
    // Tạo username từ họ tên, loại bỏ dấu và thêm số
    const normalized = hoTen.toLowerCase()
        .normalize('NFD').replace(/[\u0300-\u036f]/g, '')
        .replace(/đ/g, 'd').replace(/Đ/g, 'D')
        .replace(/\s+/g, '');
    return normalized + randomInt(10, 99);
}

function generateEmail(username) {
    const domains = ['gmail.com', 'yahoo.com', 'outlook.com', 'hotmail.com', 'email.com'];
    return `${username}@${random(domains)}`;
}

function generatePhone() {
    const prefixes = ['090', '091', '093', '094', '096', '097', '098', '099', '086', '088', '089'];
    return random(prefixes) + randomInt(1000000, 9999999);
}

function generateCommonDiseases() {
    // 60% có bệnh, 40% không có
    if (Math.random() < 0.4) return '';

    const count = randomInt(1, 3);
    const selected = [];
    for (let i = 0; i < count; i++) {
        const benh = random(benhPhooBien);
        if (!selected.includes(benh)) selected.push(benh);
    }
    return selected.join(', ');
}

function generateAllergies() {
    // 70% không có dị ứng, 30% có
    if (Math.random() < 0.7) return '';

    const count = randomInt(1, 2);
    const selected = [];
    for (let i = 0; i < count; i++) {
        const allergy = random(diUng.slice(0, 10)); // Chỉ lấy dị ứng thực sự
        if (!selected.includes(allergy)) selected.push(allergy);
    }
    return selected.join(', ');
}

function generateHeight(gender, age) {
    // Chiều cao trong khoảng thực tế theo giới tính và tuổi
    if (age < 18) {
        return gender === 'Nam' ? randomInt(150, 175) : randomInt(145, 165);
    }
    return gender === 'Nam' ? randomInt(160, 185) : randomInt(150, 170);
}

function generateWeight(gender, height) {
    // Cân nặng theo chiều cao (BMI khoảng 18-28)
    const bmi = 18 + Math.random() * 10;
    const heightM = height / 100;
    return Math.round(bmi * heightM * heightM);
}

function generateCreatedAt() {
    // Ngày đăng ký ngẫu nhiên trong 1 năm qua
    const now = new Date();
    const pastYear = new Date(now.getTime() - 365 * 24 * 60 * 60 * 1000);
    const randomTime = pastYear.getTime() + Math.random() * (now.getTime() - pastYear.getTime());
    return new Date(randomTime);
}

function generateLastLogin(createdAt) {
    // Đăng nhập cuối cùng sau ngày tạo tài khoản
    const now = new Date();
    // 80% đã đăng nhập gần đây
    if (Math.random() < 0.8) {
        const recentDays = randomInt(0, 30);
        return new Date(now.getTime() - recentDays * 24 * 60 * 60 * 1000);
    }
    return null;
}

// ====== HÀM CHÍNH ======

async function seedUsers(count = 350) {
    console.log(`🚀 Bắt đầu tạo ${count} người dùng mẫu...`);

    const defaultPassword = await bcrypt.hash('password123', 10);
    let created = 0;
    let skipped = 0;

    for (let i = 0; i < count; i++) {
        try {
            // Tạo họ tên
            const hoTen = `${random(ho)} ${random(tenDem)} ${random(ten)}`.replace(/\s+/g, ' ').trim();
            const username = generateUsername(hoTen, i);
            const email = generateEmail(username);

            // Giới tính và tuổi
            const gender = random(gioiTinh);
            const age = randomInt(13, 75);

            // Chiều cao, cân nặng
            const height = generateHeight(gender, age);
            const weight = generateWeight(gender, height);

            // Thông tin khác
            const location = random(tinhThanh);
            const phone = generatePhone();
            const commonDiseases = generateCommonDiseases();
            const allergies = generateAllergies();

            // Thời gian
            const createdAt = generateCreatedAt();
            const lastLogin = generateLastLogin(createdAt);

            // Insert vào database
            await pool.query(
                `INSERT INTO users (
          username, email, phone_number, password_hash, age, gender,
          height, weight, location, common_diseases, allergies, 
          role, created_at, last_login_at
        ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)
        ON CONFLICT (username) DO NOTHING`,
                [
                    username, email, phone, defaultPassword, age, gender,
                    height, weight, location, commonDiseases || null, allergies || null,
                    'user', createdAt, lastLogin
                ]
            );

            created++;

            // Progress
            if ((i + 1) % 50 === 0) {
                console.log(`   ✅ Đã tạo ${i + 1}/${count} người dùng...`);
            }
        } catch (err) {
            skipped++;
            // Skip nếu trùng username/email
        }
    }

    console.log(`\n🎉 Hoàn thành!`);
    console.log(`   - Đã tạo: ${created} người dùng`);
    console.log(`   - Bỏ qua (trùng): ${skipped} người dùng`);

    // Thống kê
    const stats = await pool.query('SELECT COUNT(*) as total FROM users');
    console.log(`   - Tổng số user trong database: ${stats.rows[0].total}`);

    await pool.end();
    console.log('\n✅ Đã ngắt kết nối database.');
}

// Chạy script
seedUsers(350).catch(err => {
    console.error('❌ Lỗi:', err);
    process.exit(1);
});
