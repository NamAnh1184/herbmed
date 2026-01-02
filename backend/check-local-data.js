const { Pool } = require('pg');
require('dotenv').config();

async function checkLocalData() {
    const pool = new Pool({
        host: process.env.POSTGRES_HOST || 'localhost',
        port: process.env.POSTGRES_PORT || 5432,
        user: process.env.POSTGRES_USER || 'postgres',
        password: process.env.POSTGRES_PASSWORD || '12345678',
        database: process.env.POSTGRES_DATABASE || 'group_project'
    });

    try {
        console.log('📊 Kiểm tra số lượng dữ liệu LOCAL:\n');

        const tables = [
            'dim_benh',
            'dim_thaoduoc',
            'dim_thuoctay',
            'users',
            'login_logs',
            'nhombenh',
            'map_nhombenh_benh',
            'trieu_chung',
            'thaoduoc_cochetacdong',
            'thaoduoc_dacdiemnguongoc',
            'thaoduoc_doctinh',
            'thaoduoc_thoigiantacdung',
            'thuoctay_dacdiemnguongoc',
            'thuoctay_doctinh',
            'thuoctay_thoigiantacdung'
        ];

        for (const table of tables) {
            try {
                const result = await pool.query(`SELECT COUNT(*) FROM ${table}`);
                console.log(`   ${table}: ${result.rows[0].count} records`);
            } catch (err) {
                console.log(`   ${table}: ❌ Không tồn tại`);
            }
        }

        console.log('\n✅ Kiểm tra hoàn tất!');

    } catch (error) {
        console.error('❌ Connection error:', error.message);
    } finally {
        await pool.end();
    }
}

checkLocalData();
