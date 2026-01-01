const { Pool } = require('pg');
require('dotenv').config();

const pool = new Pool({
    host: process.env.POSTGRES_HOST,
    port: process.env.POSTGRES_PORT,
    user: process.env.POSTGRES_USER,
    password: process.env.POSTGRES_PASSWORD,
    database: process.env.POSTGRES_DATABASE
});

async function run() {
    // Get all tables
    const tablesResult = await pool.query(`
    SELECT table_name FROM information_schema.tables 
    WHERE table_schema = 'public' ORDER BY table_name
  `);

    console.log('=== TẤT CẢ BẢNG TRONG DATABASE ===');
    tablesResult.rows.forEach(r => console.log(`  - ${r.table_name}`));

    // Check structure of dim_benh
    console.log('\n=== CẤU TRÚC dim_benh ===');
    const benhCols = await pool.query(`
    SELECT column_name, data_type FROM information_schema.columns 
    WHERE table_name = 'dim_benh'
  `);
    benhCols.rows.forEach(r => console.log(`  ${r.column_name}: ${r.data_type}`));

    // Check structure of trieu_chung
    console.log('\n=== CẤU TRÚC trieu_chung ===');
    const tcCols = await pool.query(`
    SELECT column_name, data_type FROM information_schema.columns 
    WHERE table_name = 'trieu_chung'
  `);
    tcCols.rows.forEach(r => console.log(`  ${r.column_name}: ${r.data_type}`));

    // Sample data from dim_benh
    console.log('\n=== MẪU DỮ LIỆU dim_benh (1 record) ===');
    const sampleBenh = await pool.query('SELECT * FROM dim_benh LIMIT 1');
    console.log(JSON.stringify(sampleBenh.rows[0], null, 2));

    // Sample data from trieu_chung
    console.log('\n=== MẪU DỮ LIỆU trieu_chung (1 record) ===');
    const sampleTC = await pool.query('SELECT * FROM trieu_chung LIMIT 1');
    console.log(JSON.stringify(sampleTC.rows[0], null, 2));

    pool.end();
}

run();
