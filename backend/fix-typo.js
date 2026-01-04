const { Pool } = require('pg');

const pool = new Pool({
    connectionString: 'postgresql://postgres:IswzwPHhKLGzgEtePjCvgGJsOMavtttT@switchback.proxy.rlwy.net:40293/railway',
    ssl: { rejectUnauthorized: false }
});

async function fixTypo() {
    try {
        const result = await pool.query(
            "UPDATE dim_benh SET ten_benh = 'Đái tháo đường tuýp 2' WHERE ten_benh ILIKE '%đái tháo đường typ 2%'"
        );
        console.log('✅ Đã cập nhật:', result.rowCount, 'bản ghi');
    } catch (e) {
        console.error('❌ Lỗi:', e.message);
    } finally {
        await pool.end();
    }
}

fixTypo();
