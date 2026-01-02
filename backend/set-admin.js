const { Pool } = require('pg');

// Railway Database URL (Production)
const RAILWAY_URL = 'postgresql://postgres:IswzwPHhKLGzgEtePjCvgGJsOMavtttT@switchback.proxy.rlwy.net:40293/railway';

const username = process.argv[2];

if (!username) {
    console.log('❌ Vui lòng cung cấp username!');
    console.log('👉 Cách dùng: node set-admin.js <username>');
    process.exit(1);
}

async function setAdmin() {
    const pool = new Pool({
        connectionString: RAILWAY_URL,
        ssl: { rejectUnauthorized: false }
    });

    try {
        console.log(`🔍 Đang tìm user "${username}"...`);

        // Check if user exists
        const check = await pool.query('SELECT * FROM users WHERE username = $1', [username]);

        if (check.rows.length === 0) {
            console.log(`❌ Không tìm thấy user "${username}" trong database!`);
        } else {
            // Update role
            await pool.query("UPDATE users SET role = 'admin' WHERE username = $1", [username]);
            console.log(`✅ Đã set quyền ADMIN thành công cho user: "${username}"`);
        }

    } catch (error) {
        console.error('❌ Lỗi:', error.message);
    } finally {
        await pool.end();
    }
}

setAdmin();
