// =====================================================
// HERBMED BACKEND SERVER - PostgreSQL Version
// =====================================================

const express = require('express');
const { Pool } = require('pg');
const bcrypt = require('bcryptjs');
const cors = require('cors');
const path = require('path');
require('dotenv').config();

const app = express();

// ====== MIDDLEWARE ======
// CORS configuration for production
const corsOptions = {
  origin: [
    'http://localhost:3000',
    'http://localhost:5500',
    'http://127.0.0.1:3000',
    'http://127.0.0.1:5500',
    'https://herbmed-23yn.vercel.app',
    'https://herbmed.vercel.app',
    /\.vercel\.app$/  // Allow all Vercel preview deployments
  ],
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization'],
  credentials: true
};
app.use(cors(corsOptions));
app.use(express.json());


// Serve static frontend files
app.use(express.static(path.join(__dirname, '../frontend')));

// ====== POSTGRESQL CONNECTION ======
// Support Railway's DATABASE_URL or individual environment variables
const poolConfig = process.env.DATABASE_URL
  ? {
    connectionString: process.env.DATABASE_URL,
    ssl: process.env.NODE_ENV === 'production' ? { rejectUnauthorized: false } : false
  }
  : {
    host: process.env.POSTGRES_HOST || 'localhost',
    port: process.env.POSTGRES_PORT || 5432,
    user: process.env.POSTGRES_USER || 'postgres',
    password: process.env.POSTGRES_PASSWORD || '12345678',
    database: process.env.POSTGRES_DATABASE || 'group_project'
  };

const pool = new Pool(poolConfig);

// Test connection
pool.connect((err, client, release) => {
  if (err) {
    console.error('❌ PostgreSQL connection error:', err.message);
  } else {
    console.log('✅ Connected to PostgreSQL herbmed');
    release();
  }
});

// ====== HELPER: Initialize User Tables ======
async function initUserTables() {
  try {
    // Create users table if not exists
    await pool.query(`
      CREATE TABLE IF NOT EXISTS users (
        id SERIAL PRIMARY KEY,
        username VARCHAR(255) UNIQUE NOT NULL,
        email VARCHAR(255) UNIQUE NOT NULL,
        phone_number VARCHAR(50),
        password_hash VARCHAR(255) NOT NULL,
        age INTEGER,
        gender VARCHAR(20),
        height NUMERIC(5,2),
        weight NUMERIC(5,2),
        location VARCHAR(255),
        common_diseases TEXT,
        allergies TEXT,
        role VARCHAR(20) DEFAULT 'user',
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        last_login_at TIMESTAMP
      )
    `);

    // Add role column if not exists (for existing tables)
    await pool.query(`
      ALTER TABLE users ADD COLUMN IF NOT EXISTS role VARCHAR(20) DEFAULT 'user'
    `);

    // Create login_logs table if not exists
    await pool.query(`
      CREATE TABLE IF NOT EXISTS login_logs (
        id SERIAL PRIMARY KEY,
        user_id INTEGER REFERENCES users(id),
        login_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        logout_at TIMESTAMP,
        ip_address VARCHAR(100),
        user_agent TEXT
      )
    `);

    // Add image_url column to dim_benh if not exists
    await pool.query(`
      ALTER TABLE dim_benh ADD COLUMN IF NOT EXISTS image_url VARCHAR(500)
    `);

    // Add disease detail columns to dim_benh
    await pool.query(`
      ALTER TABLE dim_benh 
      ADD COLUMN IF NOT EXISTS mo_ta TEXT,
      ADD COLUMN IF NOT EXISTS nguyen_nhan TEXT,
      ADD COLUMN IF NOT EXISTS trieu_chung_chinh TEXT,
      ADD COLUMN IF NOT EXISTS doi_tuong_nguy_co TEXT,
      ADD COLUMN IF NOT EXISTS phong_ngua TEXT,
      ADD COLUMN IF NOT EXISTS khi_nao_can_kham TEXT,
      ADD COLUMN IF NOT EXISTS bien_chung TEXT,
      ADD COLUMN IF NOT EXISTS luu_y TEXT,
      ADD COLUMN IF NOT EXISTS nguon_tham_khao TEXT
    `);

    // Add image_url column to dim_thaoduoc if not exists
    await pool.query(`
      ALTER TABLE dim_thaoduoc ADD COLUMN IF NOT EXISTS image_url VARCHAR(500)
    `);

    // Add image_url column to dim_thuoctay if not exists
    await pool.query(`
      ALTER TABLE dim_thuoctay ADD COLUMN IF NOT EXISTS image_url VARCHAR(500)
    `);

    console.log('✅ User tables initialized');
    console.log('✅ Image_url columns ready for benh, thaoduoc, thuoctay');
  } catch (err) {
    console.error('⚠️ Error initializing tables:', err.message);
  }
}

// Initialize tables on startup
initUserTables();

// ====== API ROUTES ======

// Health check
app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', database: 'PostgreSQL' });
});

// ====== SEARCH API - Tìm kiếm toàn diện ======
app.get('/api/search', async (req, res) => {
  try {
    const { q, limit = 10 } = req.query;

    if (!q || q.trim().length < 2) {
      return res.json({ benh: [], thaoduoc: [], thuoctay: [] });
    }

    const searchTerm = `%${q.trim()}%`;
    const limitNum = Math.min(parseInt(limit) || 10, 20);

    // Tìm kiếm song song trong 3 bảng
    const [benhResult, thaoduocResult, thuoctayResult] = await Promise.all([
      // Tìm bệnh
      pool.query(
        `SELECT benh_sk as id, ten_benh as name, 'benh' as type 
         FROM dim_benh 
         WHERE ten_benh ILIKE $1 
         ORDER BY ten_benh 
         LIMIT $2`,
        [searchTerm, limitNum]
      ),
      // Tìm thảo dược
      pool.query(
        `SELECT thaoduoc_sk as id, thao_duoc as name, 'thaoduoc' as type 
         FROM dim_thaoduoc 
         WHERE thao_duoc ILIKE $1 
         ORDER BY thao_duoc 
         LIMIT $2`,
        [searchTerm, limitNum]
      ),
      // Tìm thuốc tây
      pool.query(
        `SELECT thuoctay_sk as id, thuoc_tay as name, 'thuoctay' as type 
         FROM dim_thuoctay 
         WHERE thuoc_tay ILIKE $1 
         ORDER BY thuoc_tay 
         LIMIT $2`,
        [searchTerm, limitNum]
      )
    ]);

    res.json({
      benh: benhResult.rows,
      thaoduoc: thaoduocResult.rows,
      thuoctay: thuoctayResult.rows,
      total: benhResult.rows.length + thaoduocResult.rows.length + thuoctayResult.rows.length
    });
  } catch (err) {
    console.error('Search error:', err);
    res.status(500).json({ message: 'Lỗi server khi tìm kiếm' });
  }
});

// ====== ADMIN APIs ======

// Get all users (Admin)
app.get('/api/admin/users', async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT id, username, email, phone_number, age, gender, 
             height, weight, location, common_diseases, allergies, 
             created_at, last_login_at
      FROM users 
      ORDER BY created_at DESC
    `);

    res.json({
      total: result.rows.length,
      users: result.rows
    });
  } catch (err) {
    console.error('Get users error:', err);
    res.status(500).json({ message: 'Lỗi server khi lấy danh sách users' });
  }
});

// Get login history (Admin)
app.get('/api/admin/login-logs', async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT l.*, u.username, u.email
      FROM login_logs l
      LEFT JOIN users u ON l.user_id = u.id
      ORDER BY l.login_at DESC
      LIMIT 100
    `);

    res.json({
      total: result.rows.length,
      logs: result.rows
    });
  } catch (err) {
    console.error('Get login logs error:', err);
    res.status(500).json({ message: 'Lỗi server khi lấy login logs' });
  }
});

// Get user statistics (Admin)
app.get('/api/admin/stats', async (req, res) => {
  try {
    const totalUsers = await pool.query('SELECT COUNT(*) FROM users');
    const todayLogins = await pool.query(`
      SELECT COUNT(*) FROM login_logs 
      WHERE login_at >= CURRENT_DATE
    `);
    const recentUsers = await pool.query(`
      SELECT COUNT(*) FROM users 
      WHERE created_at >= CURRENT_DATE - INTERVAL '7 days'
    `);

    // Đếm theo giới tính
    const maleCount = await pool.query("SELECT COUNT(*) FROM users WHERE gender = 'Nam'");
    const femaleCount = await pool.query("SELECT COUNT(*) FROM users WHERE gender = 'Nữ'");

    res.json({
      totalUsers: parseInt(totalUsers.rows[0].count),
      todayLogins: parseInt(todayLogins.rows[0].count),
      newUsersLast7Days: parseInt(recentUsers.rows[0].count),
      maleCount: parseInt(maleCount.rows[0].count),
      femaleCount: parseInt(femaleCount.rows[0].count)
    });
  } catch (err) {
    console.error('Get stats error:', err);
    res.status(500).json({ message: 'Lỗi server khi lấy thống kê' });
  }
});

// ====== COMPREHENSIVE DASHBOARD STATS (Admin) ======
app.get('/api/admin/dashboard-stats', async (req, res) => {
  try {
    // === Summary Statistics ===
    console.log('Fetching summary stats...');
    const totalUsers = await pool.query('SELECT COUNT(*) FROM users');
    const todayLogins = await pool.query(`
      SELECT COUNT(*) FROM login_logs 
      WHERE login_at >= CURRENT_DATE
    `);
    const newUsers7Days = await pool.query(`
      SELECT COUNT(*) FROM users 
      WHERE created_at >= CURRENT_DATE - INTERVAL '7 days'
    `);
    const totalDiseases = await pool.query('SELECT COUNT(*) FROM dim_benh');
    const totalHerbs = await pool.query('SELECT COUNT(*) FROM dim_thaoduoc');
    const totalMedicines = await pool.query('SELECT COUNT(*) FROM dim_thuoctay');
    const avgAge = await pool.query('SELECT AVG(age) FROM users WHERE age IS NOT NULL');
    const avgBmi = await pool.query(`
      SELECT AVG(weight / ((height / 100.0) * (height / 100.0))) as avg_bmi 
      FROM users 
      WHERE weight IS NOT NULL AND height IS NOT NULL AND height > 0
    `);
    console.log('Summary stats done');

    // === Gender Distribution ===
    console.log('Fetching gender distribution...');
    const genderDistribution = await pool.query(`
      SELECT 
        COALESCE(gender, 'Khác') as gender, 
        COUNT(*) as count 
      FROM users 
      GROUP BY COALESCE(gender, 'Khác')
      ORDER BY count DESC
    `);
    console.log('Gender distribution done');

    // === Age Distribution ===
    console.log('Fetching age distribution...');
    const ageDistribution = await pool.query(`
      SELECT age_group, COUNT(*) as count FROM (
        SELECT 
          CASE 
            WHEN age < 18 THEN 'Dưới 18'
            WHEN age BETWEEN 18 AND 30 THEN '18-30'
            WHEN age BETWEEN 31 AND 45 THEN '31-45'
            WHEN age BETWEEN 46 AND 60 THEN '46-60'
            WHEN age > 60 THEN 'Trên 60'
            ELSE 'Chưa rõ'
          END as age_group,
          CASE 
            WHEN age < 18 THEN 1
            WHEN age BETWEEN 18 AND 30 THEN 2
            WHEN age BETWEEN 31 AND 45 THEN 3
            WHEN age BETWEEN 46 AND 60 THEN 4
            WHEN age > 60 THEN 5
            ELSE 6
          END as sort_order
        FROM users
      ) subq
      GROUP BY age_group, sort_order
      ORDER BY sort_order
    `);
    console.log('Age distribution done');

    // === Registration Timeline (30 days) ===
    console.log('Fetching registration timeline...');
    const registrationTimeline = await pool.query(`
      SELECT DATE(created_at) as date, COUNT(*) as count
      FROM users
      WHERE created_at >= CURRENT_DATE - INTERVAL '30 days'
      GROUP BY DATE(created_at)
      ORDER BY date
    `);
    console.log('Registration timeline done');

    // === BMI Distribution ===
    console.log('Fetching BMI distribution...');
    const bmiDistribution = await pool.query(`
      SELECT bmi_category, COUNT(*) as count FROM (
        SELECT 
          CASE 
            WHEN (weight / ((height / 100.0) * (height / 100.0))) < 18.5 THEN 'Thiếu cân'
            WHEN (weight / ((height / 100.0) * (height / 100.0))) BETWEEN 18.5 AND 24.9 THEN 'Bình thường'
            WHEN (weight / ((height / 100.0) * (height / 100.0))) BETWEEN 25 AND 29.9 THEN 'Thừa cân'
            WHEN (weight / ((height / 100.0) * (height / 100.0))) >= 30 THEN 'Béo phì'
            ELSE 'Chưa có dữ liệu'
          END as bmi_category,
          CASE 
            WHEN (weight / ((height / 100.0) * (height / 100.0))) < 18.5 THEN 1
            WHEN (weight / ((height / 100.0) * (height / 100.0))) BETWEEN 18.5 AND 24.9 THEN 2
            WHEN (weight / ((height / 100.0) * (height / 100.0))) BETWEEN 25 AND 29.9 THEN 3
            WHEN (weight / ((height / 100.0) * (height / 100.0))) >= 30 THEN 4
            ELSE 5
          END as sort_order
        FROM users
        WHERE weight IS NOT NULL AND height IS NOT NULL AND height > 0
      ) subq
      GROUP BY bmi_category, sort_order
      ORDER BY sort_order
    `);
    console.log('BMI distribution done');

    // === Location Distribution (Top 15) ===
    console.log('Fetching location distribution...');
    const locationDistribution = await pool.query(`
      SELECT 
        COALESCE(location, 'Chưa rõ') as location, 
        COUNT(*) as count 
      FROM users 
      WHERE location IS NOT NULL AND location != ''
      GROUP BY location 
      ORDER BY count DESC 
      LIMIT 15
    `);
    console.log('Location distribution done');

    // === Disease Categories ===
    console.log('Fetching disease categories...');
    let diseaseCategories = { rows: [] };
    try {
      diseaseCategories = await pool.query(`
        SELECT n.nhom_benh, COUNT(m.benh_sk) as count
        FROM nhombenh n
        LEFT JOIN map_nhombenh_benh m ON n.nhombenh_sk = m.nhombenh_sk
        GROUP BY n.nhom_benh
        ORDER BY count DESC
      `);
    } catch (e) {
      console.log('Disease categories table not found, skipping...');
    }
    console.log('Disease categories done');

    // === Login Timeline (14 days) ===
    console.log('Fetching login timeline...');
    const loginTimeline = await pool.query(`
      SELECT DATE(login_at) as date, COUNT(*) as count
      FROM login_logs
      WHERE login_at >= CURRENT_DATE - INTERVAL '14 days'
      GROUP BY DATE(login_at)
      ORDER BY date
    `);
    console.log('Login timeline done');

    // === Health Data Coverage ===
    console.log('Fetching health data coverage...');
    const healthDataCoverage = await pool.query(`
      SELECT 
        COUNT(*) as total,
        COUNT(CASE WHEN height IS NOT NULL AND weight IS NOT NULL THEN 1 END) as with_bmi,
        COUNT(CASE WHEN common_diseases IS NOT NULL AND common_diseases != '' THEN 1 END) as with_diseases,
        COUNT(CASE WHEN allergies IS NOT NULL AND allergies != '' THEN 1 END) as with_allergies
      FROM users
    `);
    console.log('Health data coverage done');

    // === Common Diseases (from user profiles) ===
    console.log('Fetching common diseases...');
    const usersWithDiseases = await pool.query(`
      SELECT common_diseases FROM users 
      WHERE common_diseases IS NOT NULL AND common_diseases != ''
    `);

    // Parse and count diseases
    const diseaseCounts = {};
    usersWithDiseases.rows.forEach(row => {
      const diseases = row.common_diseases.split(/[,;]/);
      diseases.forEach(d => {
        const disease = d.trim();
        if (disease) {
          diseaseCounts[disease] = (diseaseCounts[disease] || 0) + 1;
        }
      });
    });

    const commonDiseases = Object.entries(diseaseCounts)
      .map(([disease, count]) => ({ disease, count }))
      .sort((a, b) => b.count - a.count)
      .slice(0, 10);
    console.log('Common diseases done');

    // === Allergies ===
    console.log('Fetching allergies...');
    const usersWithAllergies = await pool.query(`
      SELECT allergies FROM users 
      WHERE allergies IS NOT NULL AND allergies != ''
    `);

    // Parse and count allergies
    const allergyCounts = {};
    usersWithAllergies.rows.forEach(row => {
      const allergies = row.allergies.split(/[,;]/);
      allergies.forEach(a => {
        const allergy = a.trim();
        if (allergy) {
          allergyCounts[allergy] = (allergyCounts[allergy] || 0) + 1;
        }
      });
    });

    const allergies = Object.entries(allergyCounts)
      .map(([allergy, count]) => ({ allergy, count }))
      .sort((a, b) => b.count - a.count)
      .slice(0, 10);
    console.log('Allergies done');

    console.log('All data fetched, sending response...');
    res.json({
      summary: {
        totalUsers: parseInt(totalUsers.rows[0].count),
        todayLogins: parseInt(todayLogins.rows[0].count),
        newUsers7Days: parseInt(newUsers7Days.rows[0].count),
        totalDiseases: parseInt(totalDiseases.rows[0].count),
        totalHerbs: parseInt(totalHerbs.rows[0].count),
        totalMedicines: parseInt(totalMedicines.rows[0].count),
        avgAge: parseFloat(avgAge.rows[0].avg) || null,
        avgBmi: parseFloat(avgBmi.rows[0].avg_bmi) || null
      },
      genderDistribution: genderDistribution.rows,
      ageDistribution: ageDistribution.rows,
      registrationTimeline: registrationTimeline.rows,
      bmiDistribution: bmiDistribution.rows,
      locationDistribution: locationDistribution.rows,
      diseaseCategories: diseaseCategories.rows,
      loginTimeline: loginTimeline.rows,
      healthDataCoverage: healthDataCoverage.rows[0],
      commonDiseases,
      allergies
    });
  } catch (err) {
    console.error('Get dashboard stats error:', err);
    res.status(500).json({ message: 'Lỗi server khi lấy thống kê dashboard', error: err.message });
  }
});

// Update user role (Admin) - Nâng cấp/hạ cấp quyền user
app.put('/api/admin/users/:id/role', async (req, res) => {
  try {
    const { id } = req.params;
    const { role } = req.body;

    // Validate role
    if (!['user', 'admin'].includes(role)) {
      return res.status(400).json({ message: 'Role không hợp lệ. Chỉ chấp nhận: user, admin' });
    }

    // Check if user exists
    const checkResult = await pool.query('SELECT id, username FROM users WHERE id = $1', [id]);
    if (checkResult.rows.length === 0) {
      return res.status(404).json({ message: 'Không tìm thấy người dùng' });
    }

    // Update role
    await pool.query('UPDATE users SET role = $1 WHERE id = $2', [role, id]);

    res.json({
      message: `Đã cập nhật quyền cho user ${checkResult.rows[0].username} thành ${role}`,
      userId: parseInt(id),
      role: role
    });
  } catch (err) {
    console.error('Update role error:', err);
    res.status(500).json({ message: 'Lỗi server khi cập nhật role' });
  }
});

// Set user as admin by username (for initial setup)
app.post('/api/admin/make-admin', async (req, res) => {
  try {
    const { username, secretKey } = req.body;

    // Simple secret key check (in production, use proper authentication)
    if (secretKey !== 'herbmed2024admin') {
      return res.status(403).json({ message: 'Secret key không đúng' });
    }

    if (!username) {
      return res.status(400).json({ message: 'Username là bắt buộc' });
    }

    // Check if user exists
    const checkResult = await pool.query('SELECT id FROM users WHERE username = $1', [username]);
    if (checkResult.rows.length === 0) {
      return res.status(404).json({ message: 'Không tìm thấy người dùng' });
    }

    // Update to admin
    await pool.query('UPDATE users SET role = $1 WHERE username = $2', ['admin', username]);

    res.json({
      message: `Đã nâng cấp ${username} thành admin`,
      username: username
    });
  } catch (err) {
    console.error('Make admin error:', err);
    res.status(500).json({ message: 'Lỗi server khi nâng cấp admin' });
  }
});


// --- SIGNUP ---
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
      location,
      psw,
      commonDiseases,
      allergies
    } = req.body;

    if (!email || !username || !psw) {
      return res.status(400).json({ message: 'Thiếu email / username / password' });
    }

    // Check if user exists
    const existCheck = await pool.query(
      'SELECT id FROM users WHERE email = $1 OR username = $2',
      [email, username]
    );

    if (existCheck.rows.length > 0) {
      return res.status(400).json({ message: 'Email hoặc username đã tồn tại' });
    }

    const passwordHash = await bcrypt.hash(psw, 10);

    const result = await pool.query(
      `INSERT INTO users (
        email, username, phone_number, password_hash, age, gender,
        height, weight, location, common_diseases, allergies
      ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
      RETURNING id`,
      [
        email,
        username,
        phonenumber || null,
        passwordHash,
        age || null,
        gender || null,
        height || null,
        weight || null,
        location || null,
        commonDiseases || null,
        allergies || null
      ]
    );

    res.status(201).json({
      message: 'Đăng ký thành công',
      userId: result.rows[0].id
    });
  } catch (err) {
    console.error('Signup error:', err);
    res.status(500).json({ message: 'Lỗi server khi signup' });
  }
});

// --- LOGIN ---
app.post('/api/login', async (req, res) => {
  try {
    const { username, password } = req.body;

    if (!username || !password) {
      return res.status(400).json({ message: 'Thiếu username hoặc password' });
    }

    const result = await pool.query(
      'SELECT * FROM users WHERE username = $1',
      [username]
    );

    if (result.rows.length === 0) {
      return res.status(400).json({ message: 'Sai username hoặc password' });
    }

    const user = result.rows[0];
    const ok = await bcrypt.compare(password, user.password_hash);

    if (!ok) {
      return res.status(400).json({ message: 'Sai username hoặc password' });
    }

    // Update last login
    await pool.query(
      'UPDATE users SET last_login_at = CURRENT_TIMESTAMP WHERE id = $1',
      [user.id]
    );

    // Log login
    await pool.query(
      'INSERT INTO login_logs (user_id, ip_address, user_agent) VALUES ($1, $2, $3)',
      [user.id, req.ip, req.headers['user-agent'] || '']
    );

    res.json({
      message: 'Đăng nhập thành công',
      userId: user.id,
      username: user.username,
      role: user.role || 'user'
    });
  } catch (err) {
    console.error('Login error:', err);
    res.status(500).json({ message: 'Lỗi server khi login' });
  }
});

// --- GET PROFILE ---
app.get('/api/profile/:userId', async (req, res) => {
  try {
    const { userId } = req.params;

    const result = await pool.query(
      `SELECT id, email, username, phone_number, age, gender,
              height, weight, location, common_diseases, allergies, created_at
       FROM users WHERE id = $1`,
      [userId]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ message: 'Không tìm thấy người dùng' });
    }

    const user = result.rows[0];
    res.json({
      userId: user.id,
      email: user.email,
      username: user.username,
      phoneNumber: user.phone_number || '',
      age: user.age || '',
      gender: user.gender || '',
      height: user.height || '',
      weight: user.weight || '',
      location: user.location || '',
      commonDiseases: user.common_diseases || '',
      allergies: user.allergies || '',
      role: user.role || 'user',
      createdAt: user.created_at
    });
  } catch (err) {
    console.error('Get profile error:', err);
    res.status(500).json({ message: 'Lỗi server khi lấy profile' });
  }
});

// --- UPDATE PROFILE ---
app.put('/api/profile/:userId', async (req, res) => {
  try {
    const { userId } = req.params;
    const {
      phonenumber,
      age,
      gender,
      height,
      weight,
      location,
      commonDiseases,
      allergies
    } = req.body;

    // Check user exists
    const checkResult = await pool.query('SELECT id FROM users WHERE id = $1', [userId]);
    if (checkResult.rows.length === 0) {
      return res.status(404).json({ message: 'Không tìm thấy người dùng' });
    }

    await pool.query(
      `UPDATE users SET
        phone_number = COALESCE($1, phone_number),
        age = COALESCE($2, age),
        gender = COALESCE($3, gender),
        height = COALESCE($4, height),
        weight = COALESCE($5, weight),
        location = COALESCE($6, location),
        common_diseases = COALESCE($7, common_diseases),
        allergies = COALESCE($8, allergies)
       WHERE id = $9`,
      [phonenumber, age, gender, height, weight, location, commonDiseases, allergies, userId]
    );

    res.json({
      message: 'Cập nhật thông tin thành công',
      userId: parseInt(userId)
    });
  } catch (err) {
    console.error('Update profile error:', err);
    res.status(500).json({ message: 'Lỗi server khi cập nhật profile' });
  }
});

// ====== DISEASE APIs (using existing schema from public.md) ======

// --- Lấy danh sách tất cả bệnh ---
app.get('/api/benh', async (req, res) => {
  try {
    const { nhombenh_sk, search, limit = 50, skip = 0 } = req.query;

    let query = '';
    const params = [];
    let paramIndex = 1;

    if (nhombenh_sk) {
      // Filter by specific nhombenh_sk
      query = `
        SELECT d.*, m.nhombenh_sk FROM dim_benh d
        INNER JOIN map_nhombenh_benh m ON d.benh_sk = m.benh_sk
        WHERE m.nhombenh_sk = $${paramIndex}
      `;
      params.push(parseInt(nhombenh_sk));
      paramIndex++;
    } else {
      // Get all diseases with their nhombenh_sk
      query = `
        SELECT d.*, m.nhombenh_sk FROM dim_benh d
        LEFT JOIN map_nhombenh_benh m ON d.benh_sk = m.benh_sk
        WHERE 1=1
      `;
    }

    if (search) {
      query += ` AND d.ten_benh ILIKE $${paramIndex}`;
      params.push(`%${search}%`);
      paramIndex++;
    }

    query += ` ORDER BY d.benh_sk LIMIT $${paramIndex} OFFSET $${paramIndex + 1}`;
    params.push(parseInt(limit), parseInt(skip));

    const result = await pool.query(query, params);

    // Count total
    let countQuery = '';
    const countParams = [];
    let countIndex = 1;

    if (nhombenh_sk) {
      countQuery = `
        SELECT COUNT(*) FROM dim_benh d
        INNER JOIN map_nhombenh_benh m ON d.benh_sk = m.benh_sk
        WHERE m.nhombenh_sk = $${countIndex}
      `;
      countParams.push(parseInt(nhombenh_sk));
      countIndex++;
    } else {
      countQuery = `
        SELECT COUNT(*) FROM dim_benh d
        LEFT JOIN map_nhombenh_benh m ON d.benh_sk = m.benh_sk
        WHERE 1=1
      `;
    }

    if (search) {
      countQuery += ` AND d.ten_benh ILIKE $${countIndex}`;
      countParams.push(`%${search}%`);
    }

    const countResult = await pool.query(countQuery, countParams);
    const total = parseInt(countResult.rows[0].count);

    res.json({
      data: result.rows,
      total,
      limit: parseInt(limit),
      skip: parseInt(skip)
    });
  } catch (err) {
    console.error('Get benh error:', err);
    res.status(500).json({ message: 'Lỗi server khi lấy danh sách bệnh' });
  }
});

// --- Lấy chi tiết 1 bệnh ---
app.get('/api/benh/:id', async (req, res) => {
  try {
    const { id } = req.params;

    const diseaseResult = await pool.query(
      'SELECT * FROM dim_benh WHERE benh_sk = $1',
      [parseInt(id)]
    );

    if (diseaseResult.rows.length === 0) {
      return res.status(404).json({ message: 'Không tìm thấy bệnh' });
    }

    const disease = diseaseResult.rows[0];

    // Get triệu chứng
    const symptomsResult = await pool.query(
      'SELECT * FROM trieu_chung WHERE benh_sk = $1',
      [disease.benh_sk]
    );

    // Get nhóm bệnh
    const nhomBenhResult = await pool.query(
      `SELECT n.nhom_benh FROM nhombenh n
       INNER JOIN map_nhombenh_benh m ON n.nhombenh_sk = m.nhombenh_sk
       WHERE m.benh_sk = $1`,
      [disease.benh_sk]
    );

    res.json({
      ...disease,
      nhom_benh: nhomBenhResult.rows[0]?.nhom_benh || null,
      trieu_chung: symptomsResult.rows
    });
  } catch (err) {
    console.error('Get benh detail error:', err);
    res.status(500).json({ message: 'Lỗi server khi lấy thông tin bệnh' });
  }
});

// --- Tạo bệnh mới ---
app.post('/api/benh', async (req, res) => {
  try {
    const { ten_benh, nhombenh_sk, trieu_chung, image_url, nguyen_nhan, phong_ngua } = req.body;

    if (!ten_benh) {
      return res.status(400).json({ message: 'Tên bệnh là bắt buộc' });
    }

    // Insert into dim_benh with all fields
    const insertResult = await pool.query(
      'INSERT INTO dim_benh (ten_benh, image_url, nguyen_nhan, phong_ngua) VALUES ($1, $2, $3, $4) RETURNING benh_sk',
      [ten_benh, image_url || null, nguyen_nhan || null, phong_ngua || null]
    );

    const benh_sk = insertResult.rows[0].benh_sk;

    // Insert nhóm bệnh mapping if provided
    if (nhombenh_sk) {
      await pool.query(
        'INSERT INTO map_nhombenh_benh (nhombenh_sk, benh_sk) VALUES ($1, $2)',
        [parseInt(nhombenh_sk), benh_sk]
      );
    }

    // Insert triệu chứng if provided
    if (trieu_chung && Array.isArray(trieu_chung)) {
      for (const tc of trieu_chung) {
        if (tc && tc.trim()) {
          await pool.query(
            'INSERT INTO trieu_chung (benh_sk, trieu_chung) VALUES ($1, $2)',
            [benh_sk, tc.trim()]
          );
        }
      }
    }

    res.status(201).json({
      message: 'Tạo bệnh thành công',
      benh_sk
    });
  } catch (err) {
    console.error('Create benh error:', err);
    res.status(500).json({ message: 'Lỗi server khi tạo bệnh' });
  }
});

// --- Cập nhật bệnh ---
app.put('/api/benh/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { ten_benh, nhombenh_sk, trieu_chung, image_url, nguyen_nhan, phong_ngua } = req.body;

    // Check if disease exists
    const checkResult = await pool.query(
      'SELECT benh_sk FROM dim_benh WHERE benh_sk = $1',
      [parseInt(id)]
    );

    if (checkResult.rows.length === 0) {
      return res.status(404).json({ message: 'Không tìm thấy bệnh' });
    }

    // Update dim_benh with all fields
    await pool.query(
      `UPDATE dim_benh SET 
        ten_benh = COALESCE($1, ten_benh), 
        image_url = COALESCE($2, image_url),
        nguyen_nhan = COALESCE($3, nguyen_nhan),
        phong_ngua = COALESCE($4, phong_ngua)
      WHERE benh_sk = $5`,
      [ten_benh, image_url, nguyen_nhan, phong_ngua, parseInt(id)]
    );

    // Update nhóm bệnh mapping if provided
    if (nhombenh_sk !== undefined) {
      // Remove old mapping
      await pool.query('DELETE FROM map_nhombenh_benh WHERE benh_sk = $1', [parseInt(id)]);
      // Add new mapping if not null
      if (nhombenh_sk) {
        await pool.query(
          'INSERT INTO map_nhombenh_benh (nhombenh_sk, benh_sk) VALUES ($1, $2)',
          [parseInt(nhombenh_sk), parseInt(id)]
        );
      }
    }

    // Update triệu chứng if provided
    if (trieu_chung !== undefined) {
      // Remove old symptoms
      await pool.query('DELETE FROM trieu_chung WHERE benh_sk = $1', [parseInt(id)]);
      // Add new symptoms
      if (trieu_chung && Array.isArray(trieu_chung)) {
        for (const tc of trieu_chung) {
          if (tc && tc.trim()) {
            await pool.query(
              'INSERT INTO trieu_chung (benh_sk, trieu_chung) VALUES ($1, $2)',
              [parseInt(id), tc.trim()]
            );
          }
        }
      }
    }

    res.json({ message: 'Cập nhật bệnh thành công' });
  } catch (err) {
    console.error('Update benh error:', err);
    res.status(500).json({ message: 'Lỗi server khi cập nhật bệnh' });
  }
});

// --- Xóa bệnh ---
app.delete('/api/benh/:id', async (req, res) => {
  try {
    const { id } = req.params;

    // Delete related data first
    await pool.query('DELETE FROM trieu_chung WHERE benh_sk = $1', [parseInt(id)]);
    await pool.query('DELETE FROM map_nhombenh_benh WHERE benh_sk = $1', [parseInt(id)]);

    // Delete disease
    const result = await pool.query(
      'DELETE FROM dim_benh WHERE benh_sk = $1 RETURNING benh_sk',
      [parseInt(id)]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ message: 'Không tìm thấy bệnh' });
    }

    res.json({ message: 'Xóa bệnh thành công' });
  } catch (err) {
    console.error('Delete benh error:', err);
    res.status(500).json({ message: 'Lỗi server khi xóa bệnh' });
  }
});

// --- Lấy thảo dược theo bệnh ---
app.get('/api/benh/:id/thaoduoc', async (req, res) => {
  try {
    const { id } = req.params;

    // Use thaoduoc_cochetacdong table which has benh_sk and thaoduoc_sk
    const result = await pool.query(
      `SELECT DISTINCT d.*
       FROM dim_thaoduoc d
       INNER JOIN thaoduoc_cochetacdong m ON d.thaoduoc_sk = m.thaoduoc_sk
       WHERE m.benh_sk = $1`,
      [parseInt(id)]
    );

    res.json({ data: result.rows });
  } catch (err) {
    console.error('Get thaoduoc by benh error:', err);
    res.status(500).json({ message: 'Lỗi server khi lấy thảo dược theo bệnh' });
  }
});

// --- Lấy thuốc tây theo bệnh ---
app.get('/api/benh/:id/thuoctay', async (req, res) => {
  try {
    const { id } = req.params;

    // Use thuoctay_thoigiantacdung table which has benh_sk and thuoctay_sk
    const result = await pool.query(
      `SELECT DISTINCT d.*
       FROM dim_thuoctay d
       INNER JOIN thuoctay_thoigiantacdung m ON d.thuoctay_sk = m.thuoctay_sk
       WHERE m.benh_sk = $1`,
      [parseInt(id)]
    );

    res.json({ data: result.rows });
  } catch (err) {
    console.error('Get thuoctay by benh error:', err);
    res.status(500).json({ message: 'Lỗi server khi lấy thuốc tây theo bệnh' });
  }
});

// --- Lấy danh sách nhóm bệnh ---
app.get('/api/nhombenh', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM nhombenh ORDER BY nhombenh_sk');
    res.json({ data: result.rows });
  } catch (err) {
    console.error('Get nhombenh error:', err);
    res.status(500).json({ message: 'Lỗi server khi lấy danh sách nhóm bệnh' });
  }
});
app.get('/api/thaoduoc', async (req, res) => {
  try {
    const { benh_sk, search, limit = 50, skip = 0 } = req.query;

    let query = 'SELECT * FROM dim_thaoduoc WHERE 1=1';
    const params = [];
    let paramIndex = 1;

    if (benh_sk) {
      query = `
        SELECT d.* FROM dim_thaoduoc d
        INNER JOIN map_benh_thaoduoc_survey m ON d.thaoduoc_sk = m.thaoduoc_sk
        WHERE m.benh_sk = $${paramIndex}
      `;
      params.push(parseInt(benh_sk));
      paramIndex++;
    }

    if (search) {
      if (benh_sk) {
        query += ` AND d.thao_duoc ILIKE $${paramIndex}`;
      } else {
        query += ` AND thao_duoc ILIKE $${paramIndex}`;
      }
      params.push(`%${search}%`);
      paramIndex++;
    }

    query += ` ORDER BY thaoduoc_sk LIMIT $${paramIndex} OFFSET $${paramIndex + 1}`;
    params.push(parseInt(limit), parseInt(skip));

    const result = await pool.query(query, params);

    res.json({
      data: result.rows,
      total: result.rows.length,
      limit: parseInt(limit),
      skip: parseInt(skip)
    });
  } catch (err) {
    console.error('Get thaoduoc error:', err);
    res.status(500).json({ message: 'Lỗi server khi lấy danh sách thảo dược' });
  }
});

// --- Lấy chi tiết 1 thảo dược ---
app.get('/api/thaoduoc/:id', async (req, res) => {
  try {
    const { id } = req.params;

    // Get main thaoduoc info
    const result = await pool.query(
      'SELECT * FROM dim_thaoduoc WHERE thaoduoc_sk = $1',
      [parseInt(id)]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ message: 'Không tìm thấy thảo dược' });
    }

    const thaoduoc = result.rows[0];

    // Get cơ chế tác dụng
    const cocheResult = await pool.query(
      'SELECT * FROM thaoduoc_cochetacdong WHERE thaoduoc_sk = $1',
      [parseInt(id)]
    );

    // Get đặc điểm nguồn gốc (linked by benh_sk from cochetacdong)
    let dacdiemResult = { rows: [] };
    if (cocheResult.rows.length > 0 && cocheResult.rows[0].benh_sk) {
      dacdiemResult = await pool.query(
        'SELECT * FROM thaoduoc_dacdiemnguongoc WHERE benh_sk = $1',
        [cocheResult.rows[0].benh_sk]
      );
    }

    // Get độc tính (linked by benh_sk)  
    let doctinhResult = { rows: [] };
    if (cocheResult.rows.length > 0 && cocheResult.rows[0].benh_sk) {
      doctinhResult = await pool.query(
        'SELECT * FROM thaoduoc_doctinh WHERE benh_sk = $1',
        [cocheResult.rows[0].benh_sk]
      );
    }

    // Get thời gian tác dụng
    const thoigianResult = await pool.query(
      'SELECT * FROM thaoduoc_thoigiantacdung WHERE thaoduoc_sk = $1',
      [parseInt(id)]
    );

    res.json({
      ...thaoduoc,
      co_che_tac_dung: cocheResult.rows[0] || null,
      dac_diem_nguon_goc: dacdiemResult.rows[0] || null,
      doc_tinh: doctinhResult.rows[0] || null,
      thoi_gian_tac_dung: thoigianResult.rows[0] || null
    });
  } catch (err) {
    console.error('Get thaoduoc detail error:', err);
    res.status(500).json({ message: 'Lỗi server khi lấy thông tin thảo dược' });
  }
});

// --- Tạo thảo dược mới ---
app.post('/api/thaoduoc', async (req, res) => {
  try {
    const { thao_duoc, image_url } = req.body;

    if (!thao_duoc) {
      return res.status(400).json({ message: 'Tên thảo dược là bắt buộc' });
    }

    const insertResult = await pool.query(
      'INSERT INTO dim_thaoduoc (thao_duoc, image_url) VALUES ($1, $2) RETURNING thaoduoc_sk',
      [thao_duoc, image_url || null]
    );

    res.status(201).json({
      message: 'Tạo thảo dược thành công',
      thaoduoc_sk: insertResult.rows[0].thaoduoc_sk
    });
  } catch (err) {
    console.error('Create thaoduoc error:', err);
    res.status(500).json({ message: 'Lỗi server khi tạo thảo dược' });
  }
});

// --- Cập nhật thảo dược ---
app.put('/api/thaoduoc/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { thao_duoc, image_url } = req.body;

    const checkResult = await pool.query(
      'SELECT thaoduoc_sk FROM dim_thaoduoc WHERE thaoduoc_sk = $1',
      [parseInt(id)]
    );

    if (checkResult.rows.length === 0) {
      return res.status(404).json({ message: 'Không tìm thấy thảo dược' });
    }

    await pool.query(
      'UPDATE dim_thaoduoc SET thao_duoc = COALESCE($1, thao_duoc), image_url = COALESCE($2, image_url) WHERE thaoduoc_sk = $3',
      [thao_duoc, image_url, parseInt(id)]
    );

    res.json({ message: 'Cập nhật thảo dược thành công' });
  } catch (err) {
    console.error('Update thaoduoc error:', err);
    res.status(500).json({ message: 'Lỗi server khi cập nhật thảo dược' });
  }
});

// --- Xóa thảo dược ---
app.delete('/api/thaoduoc/:id', async (req, res) => {
  try {
    const { id } = req.params;

    // Delete related data first
    await pool.query('DELETE FROM thaoduoc_cochetacdong WHERE thaoduoc_sk = $1', [parseInt(id)]);
    await pool.query('DELETE FROM thaoduoc_thoigiantacdung WHERE thaoduoc_sk = $1', [parseInt(id)]);

    const result = await pool.query(
      'DELETE FROM dim_thaoduoc WHERE thaoduoc_sk = $1 RETURNING thaoduoc_sk',
      [parseInt(id)]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ message: 'Không tìm thấy thảo dược' });
    }

    res.json({ message: 'Xóa thảo dược thành công' });
  } catch (err) {
    console.error('Delete thaoduoc error:', err);
    res.status(500).json({ message: 'Lỗi server khi xóa thảo dược' });
  }
});

// --- Lấy danh sách thuốc tây ---
app.get('/api/thuoctay', async (req, res) => {
  try {
    const { benh_sk, search, limit = 50, skip = 0 } = req.query;

    let query = 'SELECT * FROM dim_thuoctay WHERE 1=1';
    const params = [];
    let paramIndex = 1;

    if (benh_sk) {
      query = `
        SELECT d.* FROM dim_thuoctay d
        INNER JOIN map_benh_thuoctay_survey m ON d.thuoctay_sk = m.thuoctay_sk
        WHERE m.benh_sk = $${paramIndex}
      `;
      params.push(parseInt(benh_sk));
      paramIndex++;
    }

    if (search) {
      if (benh_sk) {
        query += ` AND d.thuoc_tay ILIKE $${paramIndex}`;
      } else {
        query += ` AND thuoc_tay ILIKE $${paramIndex}`;
      }
      params.push(`%${search}%`);
      paramIndex++;
    }

    query += ` ORDER BY thuoctay_sk LIMIT $${paramIndex} OFFSET $${paramIndex + 1}`;
    params.push(parseInt(limit), parseInt(skip));

    const result = await pool.query(query, params);

    res.json({
      data: result.rows,
      total: result.rows.length,
      limit: parseInt(limit),
      skip: parseInt(skip)
    });
  } catch (err) {
    console.error('Get thuoctay error:', err);
    res.status(500).json({ message: 'Lỗi server khi lấy danh sách thuốc tây' });
  }
});

// --- Lấy chi tiết 1 thuốc tây ---
app.get('/api/thuoctay/:id', async (req, res) => {
  try {
    const { id } = req.params;

    // Get main thuoctay info
    const result = await pool.query(
      'SELECT * FROM dim_thuoctay WHERE thuoctay_sk = $1',
      [parseInt(id)]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ message: 'Không tìm thấy thuốc tây' });
    }

    const thuoctay = result.rows[0];

    // Get đặc điểm nguồn gốc
    const dacdiemResult = await pool.query(
      'SELECT * FROM thuoctay_dacdiemnguongoc WHERE thuoctay_sk = $1',
      [parseInt(id)]
    );

    // Get độc tính
    const doctinhResult = await pool.query(
      'SELECT * FROM thuoctay_doctinh WHERE thuoctay_sk = $1',
      [parseInt(id)]
    );

    // Get thời gian tác dụng
    const thoigianResult = await pool.query(
      'SELECT * FROM thuoctay_thoigiantacdung WHERE thuoctay_sk = $1',
      [parseInt(id)]
    );

    res.json({
      ...thuoctay,
      dac_diem_nguon_goc: dacdiemResult.rows[0] || null,
      doc_tinh: doctinhResult.rows[0] || null,
      thoi_gian_tac_dung: thoigianResult.rows[0] || null
    });
  } catch (err) {
    console.error('Get thuoctay detail error:', err);
    res.status(500).json({ message: 'Lỗi server khi lấy thông tin thuốc tây' });
  }
});

// --- Tạo thuốc tây mới ---
app.post('/api/thuoctay', async (req, res) => {
  try {
    const { thuoc_tay, hoat_chat, biet_duoc, cac_thanh_phan_trong_thuoc, canh_bao_va_chong_chi_dinh, image_url } = req.body;

    if (!thuoc_tay) {
      return res.status(400).json({ message: 'Tên thuốc tây là bắt buộc' });
    }

    const insertResult = await pool.query(
      `INSERT INTO dim_thuoctay (thuoc_tay, hoat_chat, biet_duoc, cac_thanh_phan_trong_thuoc, canh_bao_va_chong_chi_dinh, image_url) 
       VALUES ($1, $2, $3, $4, $5, $6) RETURNING thuoctay_sk`,
      [thuoc_tay, hoat_chat || null, biet_duoc || null, cac_thanh_phan_trong_thuoc || null, canh_bao_va_chong_chi_dinh || null, image_url || null]
    );

    res.status(201).json({
      message: 'Tạo thuốc tây thành công',
      thuoctay_sk: insertResult.rows[0].thuoctay_sk
    });
  } catch (err) {
    console.error('Create thuoctay error:', err);
    res.status(500).json({ message: 'Lỗi server khi tạo thuốc tây' });
  }
});

// --- Cập nhật thuốc tây ---
app.put('/api/thuoctay/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { thuoc_tay, hoat_chat, biet_duoc, cac_thanh_phan_trong_thuoc, canh_bao_va_chong_chi_dinh, image_url } = req.body;

    const checkResult = await pool.query(
      'SELECT thuoctay_sk FROM dim_thuoctay WHERE thuoctay_sk = $1',
      [parseInt(id)]
    );

    if (checkResult.rows.length === 0) {
      return res.status(404).json({ message: 'Không tìm thấy thuốc tây' });
    }

    await pool.query(
      `UPDATE dim_thuoctay SET 
        thuoc_tay = COALESCE($1, thuoc_tay), 
        hoat_chat = COALESCE($2, hoat_chat), 
        biet_duoc = COALESCE($3, biet_duoc),
        cac_thanh_phan_trong_thuoc = COALESCE($4, cac_thanh_phan_trong_thuoc),
        canh_bao_va_chong_chi_dinh = COALESCE($5, canh_bao_va_chong_chi_dinh),
        image_url = COALESCE($6, image_url) 
      WHERE thuoctay_sk = $7`,
      [thuoc_tay, hoat_chat, biet_duoc, cac_thanh_phan_trong_thuoc, canh_bao_va_chong_chi_dinh, image_url, parseInt(id)]
    );

    res.json({ message: 'Cập nhật thuốc tây thành công' });
  } catch (err) {
    console.error('Update thuoctay error:', err);
    res.status(500).json({ message: 'Lỗi server khi cập nhật thuốc tây' });
  }
});

// --- Xóa thuốc tây ---
app.delete('/api/thuoctay/:id', async (req, res) => {
  try {
    const { id } = req.params;

    // Delete related data first
    await pool.query('DELETE FROM thuoctay_dacdiemnguongoc WHERE thuoctay_sk = $1', [parseInt(id)]);
    await pool.query('DELETE FROM thuoctay_doctinh WHERE thuoctay_sk = $1', [parseInt(id)]);
    await pool.query('DELETE FROM thuoctay_thoigiantacdung WHERE thuoctay_sk = $1', [parseInt(id)]);

    const result = await pool.query(
      'DELETE FROM dim_thuoctay WHERE thuoctay_sk = $1 RETURNING thuoctay_sk',
      [parseInt(id)]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ message: 'Không tìm thấy thuốc tây' });
    }

    res.json({ message: 'Xóa thuốc tây thành công' });
  } catch (err) {
    console.error('Delete thuoctay error:', err);
    res.status(500).json({ message: 'Lỗi server khi xóa thuốc tây' });
  }
});

// ====== ENHANCED DASHBOARD APIs ======

// Get comprehensive dashboard statistics
app.get('/api/admin/dashboard-stats', async (req, res) => {
  try {
    // Basic counts
    const totalUsers = await pool.query('SELECT COUNT(*) FROM users');
    const totalDiseases = await pool.query('SELECT COUNT(*) FROM dim_benh');
    const totalHerbs = await pool.query('SELECT COUNT(*) FROM dim_thaoduoc');
    const totalMedicines = await pool.query('SELECT COUNT(*) FROM dim_thuoctay');

    // Today logins
    const todayLogins = await pool.query(`
      SELECT COUNT(*) FROM login_logs 
      WHERE login_at >= CURRENT_DATE
    `);

    // Users registered in last 7 days
    const newUsers7Days = await pool.query(`
      SELECT COUNT(*) FROM users 
      WHERE created_at >= CURRENT_DATE - INTERVAL '7 days'
    `);

    // Gender distribution
    const genderStats = await pool.query(`
      SELECT 
        COALESCE(gender, 'Chưa xác định') as gender,
        COUNT(*) as count
      FROM users
      GROUP BY gender
    `);

    // Age distribution
    const ageStats = await pool.query(`
      SELECT 
        CASE 
          WHEN age < 18 THEN 'Dưới 18'
          WHEN age BETWEEN 18 AND 30 THEN '18-30'
          WHEN age BETWEEN 31 AND 45 THEN '31-45'
          WHEN age BETWEEN 46 AND 60 THEN '46-60'
          WHEN age > 60 THEN 'Trên 60'
          ELSE 'Chưa xác định'
        END as age_group,
        COUNT(*) as count
      FROM users
      GROUP BY age_group
      ORDER BY age_group
    `);

    // BMI distribution (calculated from height and weight)
    const bmiStats = await pool.query(`
      SELECT 
        CASE 
          WHEN height IS NULL OR weight IS NULL OR height = 0 THEN 'Chưa có dữ liệu'
          WHEN weight / ((height/100) * (height/100)) < 18.5 THEN 'Thiếu cân (<18.5)'
          WHEN weight / ((height/100) * (height/100)) BETWEEN 18.5 AND 24.9 THEN 'Bình thường (18.5-24.9)'
          WHEN weight / ((height/100) * (height/100)) BETWEEN 25 AND 29.9 THEN 'Thừa cân (25-29.9)'
          ELSE 'Béo phì (≥30)'
        END as bmi_category,
        COUNT(*) as count
      FROM users
      GROUP BY bmi_category
    `);

    // Location distribution
    const locationStats = await pool.query(`
      SELECT 
        COALESCE(location, 'Chưa xác định') as location,
        COUNT(*) as count
      FROM users
      GROUP BY location
      ORDER BY count DESC
      LIMIT 15
    `);

    // Common diseases distribution
    const diseaseStats = await pool.query(`
      SELECT 
        TRIM(disease) as disease,
        COUNT(*) as count
      FROM users,
      LATERAL unnest(string_to_array(COALESCE(common_diseases, ''), ',')) as disease
      WHERE TRIM(disease) != ''
      GROUP BY TRIM(disease)
      ORDER BY count DESC
      LIMIT 10
    `);

    // Allergies distribution
    const allergyStats = await pool.query(`
      SELECT 
        TRIM(allergy) as allergy,
        COUNT(*) as count
      FROM users,
      LATERAL unnest(string_to_array(COALESCE(allergies, ''), ',')) as allergy
      WHERE TRIM(allergy) != ''
      GROUP BY TRIM(allergy)
      ORDER BY count DESC
      LIMIT 10
    `);

    // Registration timeline (last 30 days)
    const registrationTimeline = await pool.query(`
      SELECT 
        DATE(created_at) as date,
        COUNT(*) as count
      FROM users
      WHERE created_at >= CURRENT_DATE - INTERVAL '30 days'
      GROUP BY DATE(created_at)
      ORDER BY date
    `);

    // Login activity (last 14 days)
    const loginTimeline = await pool.query(`
      SELECT 
        DATE(login_at) as date,
        COUNT(*) as count
      FROM login_logs
      WHERE login_at >= CURRENT_DATE - INTERVAL '14 days'
      GROUP BY DATE(login_at)
      ORDER BY date
    `);

    // Average age
    const avgAge = await pool.query('SELECT AVG(age) as avg_age FROM users WHERE age IS NOT NULL');

    // Average BMI
    const avgBmi = await pool.query(`
      SELECT AVG(weight / ((height/100) * (height/100))) as avg_bmi
      FROM users
      WHERE height IS NOT NULL AND weight IS NOT NULL AND height > 0
    `);

    // Disease categories stats
    const diseaseCategoryStats = await pool.query(`
      SELECT n.nhom_benh, COUNT(DISTINCT m.benh_sk) as count
      FROM nhombenh n
      LEFT JOIN map_nhombenh_benh m ON n.nhombenh_sk = m.nhombenh_sk
      GROUP BY n.nhom_benh
      ORDER BY count DESC
    `);

    // Users with health data
    const usersWithHealthData = await pool.query(`
      SELECT 
        COUNT(*) FILTER (WHERE height IS NOT NULL AND weight IS NOT NULL) as with_bmi,
        COUNT(*) FILTER (WHERE common_diseases IS NOT NULL AND common_diseases != '') as with_diseases,
        COUNT(*) FILTER (WHERE allergies IS NOT NULL AND allergies != '') as with_allergies,
        COUNT(*) as total
      FROM users
    `);

    res.json({
      summary: {
        totalUsers: parseInt(totalUsers.rows[0].count),
        totalDiseases: parseInt(totalDiseases.rows[0].count),
        totalHerbs: parseInt(totalHerbs.rows[0].count),
        totalMedicines: parseInt(totalMedicines.rows[0].count),
        todayLogins: parseInt(todayLogins.rows[0].count),
        newUsers7Days: parseInt(newUsers7Days.rows[0].count),
        avgAge: parseFloat(avgAge.rows[0].avg_age) || 0,
        avgBmi: parseFloat(avgBmi.rows[0].avg_bmi) || 0
      },
      healthDataCoverage: usersWithHealthData.rows[0],
      genderDistribution: genderStats.rows,
      ageDistribution: ageStats.rows,
      bmiDistribution: bmiStats.rows,
      locationDistribution: locationStats.rows,
      commonDiseases: diseaseStats.rows,
      allergies: allergyStats.rows,
      registrationTimeline: registrationTimeline.rows,
      loginTimeline: loginTimeline.rows,
      diseaseCategories: diseaseCategoryStats.rows
    });
  } catch (err) {
    console.error('Dashboard stats error:', err);
    res.status(500).json({ message: 'Lỗi server khi lấy thống kê dashboard' });
  }
});

// Catch-all: serve frontend for any unmatched routes (Express 5 compatible)
app.get(/^\/(?!api).*/, (req, res) => {
  res.sendFile(path.join(__dirname, '../frontend/index.html'));
});

// ====== START SERVER ======
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`🚀 Server running at http://localhost:${PORT}`);
});
