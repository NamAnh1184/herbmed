// Script to update disease images in dim_benh table
const { Pool } = require('pg');
require('dotenv').config();

const pool = new Pool({
    host: process.env.POSTGRES_HOST || 'localhost',
    port: process.env.POSTGRES_PORT || 5432,
    user: process.env.POSTGRES_USER || 'postgres',
    password: process.env.POSTGRES_PASSWORD || '12345678',
    database: process.env.POSTGRES_DATABASE || 'group_project'
});

// Disease images mapping - using reliable medical image sources
const diseaseImages = {
    7: 'https://images.unsplash.com/photo-1559757175-0eb30cd8c063?w=400', // Hội chứng ruột kích thích
    8: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400', // Táo bón
    9: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400', // Tiêu chảy
    10: 'https://images.unsplash.com/photo-1579684385127-1ef15d508118?w=400', // Đái tháo đường typ 2
    11: 'https://images.unsplash.com/photo-1576091160550-2173dba999ef?w=400', // Tăng huyết áp
    12: 'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=400', // Rối loạn mỡ máu
    13: 'https://images.unsplash.com/photo-1609252509102-aa73d8e52d04?w=400', // Thoái hóa khớp
    14: 'https://images.unsplash.com/photo-1609252509102-aa73d8e52d04?w=400', // Viêm khớp dạng thấp
    15: 'https://images.unsplash.com/photo-1609252509102-aa73d8e52d04?w=400', // Bệnh gút
    16: 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=400', // Đau lưng / căng cơ
    17: 'https://images.unsplash.com/photo-1616012480717-fd9867059ca0?w=400', // Đau nửa đầu
    18: 'https://images.unsplash.com/photo-1616012480717-fd9867059ca0?w=400', // Đau đầu do căng thẳng
    19: 'https://images.unsplash.com/photo-1474418397713-7ede21d49118?w=400', // Lo âu
    20: 'https://images.unsplash.com/photo-1493836512294-502baa1986e2?w=400', // Trầm cảm
    21: 'https://images.unsplash.com/photo-1541781774459-bb2af2f05b55?w=400', // Mất ngủ
    22: 'https://images.unsplash.com/photo-1615461066841-6116e61058f4?w=400', // Thiếu máu
    23: 'https://images.unsplash.com/photo-1559757175-0eb30cd8c063?w=400', // Sỏi thận
    24: 'https://images.unsplash.com/photo-1559757175-0eb30cd8c063?w=400', // Phì đại tuyến tiền liệt
    25: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400', // Đau bụng kinh
    26: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=400', // Vảy nến
    27: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=400', // Mụn trứng cá
    28: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=400', // Viêm da
    29: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=400', // Nấm da
    30: 'https://images.unsplash.com/photo-1583947581924-860bda6a26df?w=400', // Lành vết thương
    31: 'https://images.unsplash.com/photo-1583947581924-860bda6a26df?w=400', // Bỏng nhẹ
    32: 'https://images.unsplash.com/photo-1606811841689-23dfddce3e95?w=400', // Đau răng
    33: 'https://images.unsplash.com/photo-1606811841689-23dfddce3e95?w=400', // Viêm lợi
    34: 'https://images.unsplash.com/photo-1606811841689-23dfddce3e95?w=400', // Hôi miệng
    35: 'https://images.unsplash.com/photo-1584017911766-d451b3d0e843?w=400', // Viêm mũi dị ứng
    36: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400', // Béo phì
    37: 'https://images.unsplash.com/photo-1559757175-0eb30cd8c063?w=400', // Gan nhiễm mỡ
    38: 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=400', // Mệt mỏi mãn tính
    39: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400', // Hỗ trợ miễn dịch
    40: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=400', // Herpes labialis
    41: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=400', // Herpes zoster-zona thần kinh
    42: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=400', // Ghẻ
    43: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=400', // Bệnh vòng, nấm da
    44: 'https://images.unsplash.com/photo-1559757175-0eb30cd8c063?w=400', // Trĩ
    45: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=400', // Viêm mô tế bào
    46: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=400', // Gàu
    47: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=400', // Rụng tóc
    48: 'https://images.unsplash.com/photo-1609252509102-aa73d8e52d04?w=400', // Loãng xương
    49: 'https://images.unsplash.com/photo-1609252509102-aa73d8e52d04?w=400', // Lành xương
    50: 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=400', // Chuột rút
    51: 'https://images.unsplash.com/photo-1609252509102-aa73d8e52d04?w=400', // Viêm gân
    52: 'https://images.unsplash.com/photo-1559757175-0eb30cd8c063?w=400', // Viêm gan
    53: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400', // Say tàu xe
    54: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400', // Buồn nôn
    55: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400', // Chán ăn
    56: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400', // Tiêu hoá kém
    57: 'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=400', // Cholesterol cao
    58: 'https://images.unsplash.com/photo-1517483000871-1dbf64a6e1c6?w=400', // Say nắng
    59: 'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=400', // Khô mắt
    60: 'https://images.unsplash.com/photo-1517483000871-1dbf64a6e1c6?w=400', // Bỏng do mặt trời
    61: 'https://images.unsplash.com/photo-1584017911766-d451b3d0e843?w=400', // Ho do cảm lạnh
    62: 'https://images.unsplash.com/photo-1584017911766-d451b3d0e843?w=400', // Ho do cảm nóng
    63: 'https://images.unsplash.com/photo-1584017911766-d451b3d0e843?w=400', // Ho khan
    64: 'https://images.unsplash.com/photo-1584017911766-d451b3d0e843?w=400', // Ho có đờm
    65: 'https://images.unsplash.com/photo-1584017911766-d451b3d0e843?w=400', // Ho khan nhiều, rát họng
};

async function updateDiseaseImages() {
    console.log('Starting to update disease images...\n');

    let updated = 0;
    let errors = 0;

    for (const [benh_sk, image_url] of Object.entries(diseaseImages)) {
        try {
            const result = await pool.query(
                'UPDATE dim_benh SET image_url = $1 WHERE benh_sk = $2 AND image_url IS NULL',
                [image_url, parseInt(benh_sk)]
            );

            if (result.rowCount > 0) {
                updated++;
                console.log(`✅ Updated benh_sk ${benh_sk}`);
            } else {
                console.log(`⏭️ Skipped benh_sk ${benh_sk} (already has image)`);
            }
        } catch (err) {
            errors++;
            console.error(`❌ Error updating benh_sk ${benh_sk}:`, err.message);
        }
    }

    console.log(`\n========== SUMMARY ==========`);
    console.log(`Updated: ${updated}`);
    console.log(`Errors: ${errors}`);
    console.log(`==============================`);

    await pool.end();
}

updateDiseaseImages();
