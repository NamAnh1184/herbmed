/**
 * Populate Disease Data Script
 * Cập nhật thông tin chi tiết cho 65 bệnh vào database
 * Chạy: node populate-disease-data.js
 */

const { Pool } = require('pg');
require('dotenv').config();

// Import all disease batches
const batch1 = require('./data/diseases-batch1');
const batch2 = require('./data/diseases-batch2');
const batch3 = require('./data/diseases-batch3');
const batch4 = require('./data/diseases-batch4');
const batch5 = require('./data/diseases-batch5');
const batch6 = require('./data/diseases-batch6');
const batch7 = require('./data/diseases-batch7');
const batch8 = require('./data/diseases-batch8');
const batch9 = require('./data/diseases-batch9');
const batch10 = require('./data/diseases-batch10');
const batch11 = require('./data/diseases-batch11');
const batch12 = require('./data/diseases-batch12');

// Combine all batches
const allDiseases = [
    ...batch1,
    ...batch2,
    ...batch3,
    ...batch4,
    ...batch5,
    ...batch6,
    ...batch7,
    ...batch8,
    ...batch9,
    ...batch10,
    ...batch11,
    ...batch12
];

// PostgreSQL connection
const pool = new Pool({
    host: process.env.POSTGRES_HOST || 'localhost',
    port: process.env.POSTGRES_PORT || 5432,
    user: process.env.POSTGRES_USER || 'postgres',
    password: process.env.POSTGRES_PASSWORD || '12345678',
    database: process.env.POSTGRES_DATABASE || 'group_project'
});

async function ensureColumnsExist() {
    console.log('🔧 Đảm bảo các cột mới đã tồn tại...');

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

    console.log('✅ Các cột đã sẵn sàng');
}

async function populateDiseases() {
    console.log(`\n📊 Bắt đầu cập nhật ${allDiseases.length} bệnh...\n`);

    let successCount = 0;
    let errorCount = 0;

    for (const disease of allDiseases) {
        try {
            const result = await pool.query(
                `UPDATE dim_benh SET
          mo_ta = $1,
          nguyen_nhan = $2,
          trieu_chung_chinh = $3,
          doi_tuong_nguy_co = $4,
          phong_ngua = $5,
          khi_nao_can_kham = $6,
          bien_chung = $7,
          luu_y = $8,
          nguon_tham_khao = $9
        WHERE benh_sk = $10
        RETURNING ten_benh`,
                [
                    disease.mo_ta,
                    disease.nguyen_nhan,
                    disease.trieu_chung_chinh,
                    disease.doi_tuong_nguy_co,
                    disease.phong_ngua,
                    disease.khi_nao_can_kham,
                    disease.bien_chung,
                    disease.luu_y,
                    disease.nguon_tham_khao,
                    disease.benh_sk
                ]
            );

            if (result.rows.length > 0) {
                console.log(`✅ [${disease.benh_sk}] ${result.rows[0].ten_benh}`);
                successCount++;
            } else {
                console.log(`⚠️ [${disease.benh_sk}] Không tìm thấy trong database`);
                errorCount++;
            }
        } catch (err) {
            console.error(`❌ [${disease.benh_sk}] Lỗi:`, err.message);
            errorCount++;
        }
    }

    console.log(`\n========================================`);
    console.log(`📈 Kết quả: ${successCount} thành công, ${errorCount} lỗi`);
    console.log(`========================================\n`);
}

async function verifyData() {
    console.log('🔍 Kiểm tra dữ liệu đã cập nhật...\n');

    const result = await pool.query(`
    SELECT benh_sk, ten_benh, 
           CASE WHEN mo_ta IS NOT NULL THEN 'Có' ELSE 'Không' END as co_mo_ta,
           CASE WHEN nguyen_nhan IS NOT NULL THEN 'Có' ELSE 'Không' END as co_nguyen_nhan
    FROM dim_benh 
    WHERE mo_ta IS NOT NULL
    ORDER BY benh_sk
    LIMIT 10
  `);

    console.log('Mẫu 10 bệnh đã cập nhật:');
    console.table(result.rows);

    const countResult = await pool.query(`
    SELECT COUNT(*) as total,
           COUNT(mo_ta) as co_mo_ta,
           COUNT(nguyen_nhan) as co_nguyen_nhan
    FROM dim_benh
  `);

    console.log('\nThống kê:');
    console.log(`- Tổng bệnh: ${countResult.rows[0].total}`);
    console.log(`- Có mô tả: ${countResult.rows[0].co_mo_ta}`);
    console.log(`- Có nguyên nhân: ${countResult.rows[0].co_nguyen_nhan}`);
}

async function main() {
    try {
        console.log('🚀 Bắt đầu populate dữ liệu bệnh...\n');

        await ensureColumnsExist();
        await populateDiseases();
        await verifyData();

        console.log('\n✅ Hoàn thành!');
    } catch (err) {
        console.error('❌ Lỗi:', err);
    } finally {
        await pool.end();
    }
}

main();
