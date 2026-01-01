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
    const tables = [
        'thaoduoc_cochetacdong',
        'thaoduoc_dacdiemnguongoc',
        'thaoduoc_doctinh',
        'thaoduoc_thoigiantacdung',
        'thuoctay_dacdiemnguongoc',
        'thuoctay_doctinh',
        'thuoctay_thoigiantacdung'
    ];

    for (const t of tables) {
        try {
            const r = await pool.query(
                `SELECT column_name, data_type FROM information_schema.columns WHERE table_name = $1`,
                [t]
            );
            console.log(`\n=== ${t} ===`);
            r.rows.forEach(row => console.log(`  ${row.column_name}: ${row.data_type}`));

            // Get sample data
            const sample = await pool.query(`SELECT * FROM ${t} LIMIT 2`);
            if (sample.rows.length > 0) {
                console.log('  Sample:', JSON.stringify(sample.rows[0]).substring(0, 200));
            }
        } catch (e) {
            console.log(`Error ${t}:`, e.message);
        }
    }
    pool.end();
}

run();
