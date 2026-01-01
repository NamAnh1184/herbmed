// update-thuoctay-images.js - Cập nhật URL ảnh thuốc tây từ CSV
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

// Mapping từ file CSV đã cập nhật
const medicineImages = {
    1: 'https://trungtamthuoc.com/images/products/paratramol-l4887.jpg',
    2: 'https://www.vinmec.com/static/uploads/medium_Hinh_anh_thuoc_chong_viem_ibuprofen_774d1dc8bf.png',
    3: 'https://www.crescentpharma.com/wp-content/uploads/2016/01/Diphenhydramine-50mg-2.png',
    4: 'https://www.vinmec.com/static/uploads/20220312_171056_775437_guaifenesin_a_max_1800x1800_jpg_f5ba20c0f8.jpg',
    5: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0GFNPrf-IOww-hLRi3b3gy9mGIGV5RKZUfg&s',
    6: 'https://5.imimg.com/data5/SELLER/Default/2022/7/CD/MN/UA/147460468/ranitidine-150mg-.jpg',
    7: 'https://5.imimg.com/data5/GLADMIN/Default/2023/5/306626631/DD/OM/QZ/132158408/famotidine-tablets-20mg.jpeg',
    8: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6YGkyni0w2NP8njq4EiqEbd4Bp-YD36_9Eg&s',
    9: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-f2OhOZGm0GFeMhd3M3HNysiFxqpo-HMG7A&s',
    10: 'https://5.imimg.com/data5/SELLER/Default/2022/6/MO/PQ/EX/31086406/dicyclomine-hydrochloride-tablets.jpg',
    11: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaqSUMraHMBvyBZgRcRnH-E5OxR9BFxr0grA&s',
    12: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTvme9g20453AY4IZ4eBiJCBEymVuFNDh7OA&s',
    13: 'https://www.vinmec.com/static/uploads/20200425_180940_111844_dextromethorphan_max_1800x1800_jpg_00650ff0b7.jpg',
    14: 'https://www.koala.health/_next/image?url=https%3A%2F%2Fres.cloudinary.com%2Fkoala-health%2Fimage%2Fupload%2Fc_scale%2Ch_900%2Funvuigigbazb2gvyh9ox%3F_a%3DBACAEuBn&w=640&q=75',
    15: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGqZrHlGZ6WnAiGhJeh-vd65928zOOIhbl3A&s',
    16: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRWBOVy5gE9ojjatdKBeU_LrRS8t5A7y0xHb-Ha-e1Ll4_qoNznQ76m6vOO_zLoR36cg61ug&s=10',
    17: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsh8wTkSQhUaGEE7Sk44_gCRKM0pd_uTIJzw&s',
    18: 'https://prod-cdn.pharmacity.io/blog/amlodipine-la-thuoc-gi-hinh-1.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAUYXZVMJMURHIYJSN%2F20241122%2Fap-southeast-1%2Fs3%2Faws4_request&X-Amz-Date=20241122T034157Z&X-Amz-SignedHeaders=host&X-Amz-Expires=600&X-Amz-Signature=38f35747a28d9308a130bce312e7608e7ee6a7fb68e05c29d04d761870becaad',
    20: 'https://www.vinmec.com/static/uploads/20201217_075914_217866_Hinh_anh_thuoc_Hydr_max_1800x1800_jpg_c53699693d.jpg',
    21: 'https://cdn.upharma.vn/unsafe/3840x0/filters:quality(90)/san-pham/22641.png',
    22: 'https://duocdienvietnam.com/wp-content/uploads/filemanager/data-images//2022/8/anh_thay/rosuvastatin_stella_20mg_1.jpg',
    23: 'https://tamanhhospital.vn/wp-content/uploads/2024/12/thuoc-chong-dau-giam-viem-celecoxib.jpg',
    24: 'https://glucosamin.com.vn/storage/uploads/noidung/glucosamine-chondroitin-1500mg-220-vien-863.jpg',
    25: 'https://trungtamthuoc.com/images/products/thuoc-methotrexate-25mg-mercury-pharma-2-s7304.jpg',
    26: 'https://cdn.youmed.vn/tin-tuc/wp-content/uploads/2020/06/humira-adalimumab1.jpg',
    27: 'https://cdn.mimsprd.mims.com/drug-resources/PH/packshot/Seretide6001PPS0.JPG',
    28: 'https://baobaopharma.com/wp-content/uploads/2024/06/12Q-1.jpg',
    29: 'https://benhvienthucuc.vn/wp-content/uploads/2024/05/thuoc-prednisone.jpg',
    30: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxQLPoZrSNIGZnkPsQB-267QCH8g6w0LsW4A&s',
    31: 'https://trungtamthuoc.com/images/products/alprazolam-viatris-05mg-d1171.jpg',
    32: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfSC0KIrKgoUX-QVaBs15sMHnKsDzpv5MNbw&s',
    33: 'https://www.vinmec.com/static/uploads/small_20210318_095840_726699_thuoc_escitalopram_max_1800x1800_jpg_0b1af96dd0.jpg',
    34: 'https://benhvienlevanthinh.vn/wp-content/uploads/2022/10/thuoc-augmentin-1g.jpg',
    35: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkQFbsJ5kbtghmNeWRrjuS6oQS8AR0EhWR2Q&s',
    36: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxySoYNu8IxqG7OTv1M9vU6uLooObsLmJkQg&s',
    37: 'https://www.vinmec.com/static/uploads/medium_20210502_121720_234324_tamsulosin_thuoc_max_1800x1800_jpg_b649d1b326.jpg',
    38: 'https://cdn.upharma.vn/unsafe/3840x0/filters:quality(90)/san-pham/10021.png',
    39: 'https://medecify.com/storage/2024/12/B-B-CD-A-C-E-DBC-3000x3086.jpeg',
    40: 'https://www.vinmec.com/static/uploads/20230107_144221_396490_Clotrimazole_max_1800x1800_png_84bb4cc5cb.png',
    41: 'https://duocdienvietnam.com/wp-content/uploads/filemanager/data-images//2022/4/20/terbinafin-stella-cream-1.jpg',
    42: 'https://www.vinmec.com/static/uploads/20220311_075153_478320_thuoc_miconazole_max_1800x1800_jpg_3930913b5c.jpg',
    43: 'https://www.vinmec.com/static/uploads/20220429_064542_235511_sulfadiazine_silver_max_1800x1800_jpg_302f3fa4b5.jpg',
    44: 'https://cdn.britannica.com/73/177473-050-7B7C6918/aloe-vera-plant.jpg',
    45: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTCZSYsy6AHQ-6XnXw67wyMG8cWFHo-MBUsQ&s',
    46: 'https://i5.walmartimages.com/seo/Colgate-Cavity-Protection-Toothpaste-with-Fluoride-Minty-Great-Flavor-2-5-oz-Tube_3fd969aa-b443-4a5d-9bd9-39732bbf5d69.77b808d3dc7ef4e9247ea3b5577f5c86.jpeg',
    47: 'https://i5.walmartimages.com/seo/Equate-3-Hydrogen-Peroxide-Liquid-USP-Antiseptic-32-fl-oz_29990181-6f9e-42e6-98a3-5389c9be63d0_1.7d6fd92f63fca430eddc487138cb605e.jpeg',
    48: 'https://cdn.nhathuoclongchau.com.vn/v1/static/00005613_orlistat_120mg_7302_62a7_large_521161dd7c.jpg',
    49: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp3XRwD8CwQY-2PWi0XSkdb7WGBgBxREjBxg&s',
    50: 'https://cdn.upharma.vn/unsafe/1200x0/san-pham/6623.png',
    51: 'https://bizweb.dktcdn.net/100/407/286/products/3517f521-e6ba-4ea7-886c-ac2c8d2fd95d-a2bcaf9bacbf79f6613d5a55a756158a-jpeg.jpg?v=1681119812400',
    52: 'https://www.vinmec.com/static/uploads/20220709_021838_450643_Valacyclovir_max_1800x1800_jpg_bb59e90886.jpg',
    53: 'https://www.padagis.com/wp-content/uploads/2025/06/PEG3350.png',
    54: 'https://www.vinmec.com/static/uploads/20210223_083439_673203_thuoc_bisacodyl_max_1800x1800_png_ee49e81c96.png',
    55: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgiUQoFCw5xnV05MRHEkfqXV21H5lQ1gLkQg&s',
    56: 'https://www.imexpharm.com/Data/Sites/1/Product/8716/Cephalexin-500mg.png',
    57: 'https://cdn.mimsprd.mims.com/drug-resources/TH/packshot/Dixocillin6002PPS0.JPG',
    58: 'https://www.vinmec.com/static/uploads/20200522_151521_140132_screenshot_15901604_max_1800x1800_png_1255440d3b.png',
    59: 'https://production-cdn.pharmacity.io/digital/828x828/plain/e-com/images/ecommerce/20250415102333-0-P02451_2.png?versionId=F43ejhgQ79w0SZhac.3JWMp3sAtdSWYO',
    60: 'https://product.hstatic.net/1000372707/product/calcium-corbiere_fa38899dab2d46489dab1451dd654702_grande.jpg',
    61: 'https://m.media-amazon.com/images/I/514qIBrZ8IL._AC_UF1000,1000_QL80_.jpg',
    62: 'https://www.vinmec.com/static/uploads/small_20220518_081552_080696_thuoc_biromonol_max_1800x1800_jpg_3d9662c066.jpg',
    63: 'https://sandoz-ca.cms.sandoz.com/sites/default/files/styles/large/public/2023-11/Sandoz-Orphenadrine-359.jpg?itok=7-bQbiTx',
    64: 'https://www.vinmec.com/static/uploads/20220116_031308_228696_diclofenac_max_1800x1800_jpg_8632b9143a.jpg',
    65: 'https://medlatec.vn/media/39095/content/naproxen.jpg',
    66: 'https://nanogenpharma.com/data/upload/Pegnano.jpg',
    67: 'https://www.vinmec.com/static/uploads/20220617_125127_543982_thuoc_tenofovir_300_max_1800x1800_jpg_da78b35558.jpg',
    68: 'https://www.vinmec.com/static/uploads/20220628_064616_888062_entecavir_0_5_mg_max_1800x1800_jpg_ef80a33373.jpg',
    69: 'https://production-cdn.pharmacity.io/digital/828x828/plain/e-com/images/ecommerce/20250715044429-0-P28579_1.jpg?versionId=_lBefSOHF5bJ4QRUi8.UEekqAYis_1rN',
    70: 'https://images-na.ssl-images-amazon.com/images/I/81MTj7-7yML.jpg',
    71: 'https://www.vinmec.com/static/uploads/20220519_084256_954251_cyclosporine_max_1800x1800_jpg_e2d1b22d2e.jpg',
    72: 'https://suckhoe123.vn/uploads/suc-khoe/2021_05/20200216_154927_642571_chlorph999-thuoc-chon.max-800x800.png&w=800&h=800&checkress=558dc55d2b2558c24b74b84c8aa77ac7',
    73: 'https://www.vinmec.com/static/uploads/20220709_235800_893335_Ambroxol_30mg_max_1800x1800_jpg_3b7a54c065.jpg',
    74: 'https://cdn.medigoapp.com/product/acetylcystein_1436b27d31.jpeg'
};

async function updateImages() {
    console.log('🚀 Bắt đầu cập nhật URL ảnh thuốc tây...\n');

    let updated = 0;
    let errors = 0;

    try {
        for (const [id, imageUrl] of Object.entries(medicineImages)) {
            try {
                const result = await pool.query(
                    'UPDATE dim_thuoctay SET image_url = $1 WHERE thuoctay_sk = $2',
                    [imageUrl, parseInt(id)]
                );

                if (result.rowCount > 0) {
                    updated++;
                    console.log(`✅ Đã cập nhật thuốc tây ID ${id}`);
                } else {
                    console.log(`⚠️ Không tìm thấy thuốc tây ID ${id}`);
                }
            } catch (err) {
                errors++;
                console.error(`❌ Lỗi cập nhật ID ${id}:`, err.message);
            }
        }

        console.log('\n========================================');
        console.log(`✅ Hoàn tất! Đã cập nhật: ${updated} thuốc tây`);
        if (errors > 0) console.log(`❌ Lỗi: ${errors}`);
        console.log('========================================\n');

    } catch (error) {
        console.error('❌ Lỗi:', error.message);
    } finally {
        await pool.end();
    }
}

updateImages();
