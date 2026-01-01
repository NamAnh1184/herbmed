// =====================================================
// SCRIPT SỬA LẠI GIỚI TÍNH - Giảm "Khác" xuống ~10%
// Chạy: node fix-gender.js
// =====================================================

const { Pool } = require('pg');
require('dotenv').config();

const pool = new Pool({
    host: process.env.POSTGRES_HOST || 'localhost',
    port: process.env.POSTGRES_PORT || 5432,
    user: process.env.POSTGRES_USER || 'postgres',
    password: process.env.POSTGRES_PASSWORD || '12345678',
    database: process.env.POSTGRES_DATABASE || 'group_project'
});

async function fixGenderDistribution() {
    console.log('🔧 Bắt đầu sửa phân bố giới tính...\n');

    // 1. Kiểm tra phân bố hiện tại
    const beforeStats = await pool.query(`
    SELECT gender, COUNT(*) as count 
    FROM users 
    GROUP BY gender 
    ORDER BY gender
  `);

    console.log('📊 Phân bố TRƯỚC khi sửa:');
    beforeStats.rows.forEach(row => {
        console.log(`   ${row.gender || 'NULL'}: ${row.count} người`);
    });

    // 2. Đếm số người có giới tính "Khác"
    const khacCount = await pool.query("SELECT COUNT(*) FROM users WHERE gender = 'Khác'");
    const totalCount = await pool.query("SELECT COUNT(*) FROM users");

    const totalUsers = parseInt(totalCount.rows[0].count);
    const currentKhac = parseInt(khacCount.rows[0].count);

    // Tính toán: Muốn ~10% là "Khác"
    const targetKhac = Math.round(totalUsers * 0.10);
    const needToConvert = currentKhac - targetKhac;

    console.log(`\n📈 Tổng users: ${totalUsers}`);
    console.log(`   Hiện tại "Khác": ${currentKhac} (${(currentKhac / totalUsers * 100).toFixed(1)}%)`);
    console.log(`   Mục tiêu "Khác": ${targetKhac} (~10%)`);
    console.log(`   Cần chuyển đổi: ${needToConvert} người\n`);

    if (needToConvert <= 0) {
        console.log('✅ Không cần chuyển đổi - tỷ lệ đã OK!');
        await pool.end();
        return;
    }

    // 3. Lấy danh sách ID người có giới tính "Khác" cần chuyển
    const usersToConvert = await pool.query(`
    SELECT id FROM users 
    WHERE gender = 'Khác' 
    ORDER BY RANDOM() 
    LIMIT $1
  `, [needToConvert]);

    // 4. Chuyển đổi: 50% thành Nam, 50% thành Nữ
    let convertedToNam = 0;
    let convertedToNu = 0;

    for (let i = 0; i < usersToConvert.rows.length; i++) {
        const userId = usersToConvert.rows[i].id;
        const newGender = i % 2 === 0 ? 'Nam' : 'Nữ';

        await pool.query('UPDATE users SET gender = $1 WHERE id = $2', [newGender, userId]);

        if (newGender === 'Nam') convertedToNam++;
        else convertedToNu++;
    }

    console.log(`✅ Đã chuyển đổi:`);
    console.log(`   → ${convertedToNam} người thành Nam`);
    console.log(`   → ${convertedToNu} người thành Nữ`);

    // 5. Kiểm tra phân bố sau khi sửa
    const afterStats = await pool.query(`
    SELECT gender, COUNT(*) as count 
    FROM users 
    GROUP BY gender 
    ORDER BY gender
  `);

    console.log('\n📊 Phân bố SAU khi sửa:');
    afterStats.rows.forEach(row => {
        const percentage = (parseInt(row.count) / totalUsers * 100).toFixed(1);
        console.log(`   ${row.gender || 'NULL'}: ${row.count} người (${percentage}%)`);
    });

    await pool.end();
    console.log('\n✅ Hoàn tất!');
}

fixGenderDistribution().catch(err => {
    console.error('❌ Lỗi:', err);
    process.exit(1);
});
