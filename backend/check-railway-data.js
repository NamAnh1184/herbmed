const { Pool } = require('pg');

const RAILWAY_URL = 'postgresql://postgres:IswzwPHhKLGzgEtePjCvgGJsOMavtttT@switchback.proxy.rlwy.net:40293/railway';

async function checkData() {
    const pool = new Pool({
        connectionString: RAILWAY_URL,
        ssl: { rejectUnauthorized: false }
    });

    try {
        console.log('📊 Kiểm tra số lượng dữ liệu trên Railway:\n');

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
                console.log(`   ${table}: ❌ Error - ${err.message.substring(0, 50)}`);
            }
        }

        console.log('\n✅ Kiểm tra hoàn tất!');

    } catch (error) {
        console.error('❌ Connection error:', error.message);
    } finally {
        await pool.end();
    }
}

checkData();
