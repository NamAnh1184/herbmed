// export-thuoctay-csv.js - Xuất danh sách thuốc tây ra file CSV
require('dotenv').config();
const { Pool } = require('pg');
const fs = require('fs');

const pool = new Pool({
    host: process.env.POSTGRES_HOST || 'localhost',
    port: process.env.POSTGRES_PORT || 5432,
    user: process.env.POSTGRES_USER || 'postgres',
    password: process.env.POSTGRES_PASSWORD || '12345678',
    database: process.env.POSTGRES_DATABASE || 'group_project'
});

async function exportMedicines() {
    try {
        const result = await pool.query('SELECT thuoctay_sk, thuoc_tay, hoat_chat, image_url FROM dim_thuoctay ORDER BY thuoctay_sk');

        // Create CSV with BOM for Excel UTF-8 support
        let csv = '\uFEFFID,Tên Thuốc Tây,Hoạt Chất,URL Ảnh Hiện Tại,URL Ảnh Mới (Điền vào đây)\n';

        for (const row of result.rows) {
            const id = row.thuoctay_sk;
            const name = (row.thuoc_tay || '').replace(/,/g, ';').replace(/\n/g, ' ');
            const hoatChat = (row.hoat_chat || '').replace(/,/g, ';').replace(/\n/g, ' ').substring(0, 100);
            const currentUrl = row.image_url || '';
            csv += `${id},"${name}","${hoatChat}","${currentUrl}",\n`;
        }

        fs.writeFileSync('thuoctay_images.csv', csv, 'utf8');
        console.log('✅ Đã tạo file: thuoctay_images.csv');
        console.log('📊 Số lượng thuốc tây: ' + result.rows.length);
    } catch (err) {
        console.error('Lỗi:', err.message);
    } finally {
        await pool.end();
    }
}

exportMedicines();
