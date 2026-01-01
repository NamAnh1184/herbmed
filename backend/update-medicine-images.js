// Script to update medicine images in dim_thuoctay table
const { Pool } = require('pg');
require('dotenv').config();

const pool = new Pool({
    host: process.env.POSTGRES_HOST || 'localhost',
    port: process.env.POSTGRES_PORT || 5432,
    user: process.env.POSTGRES_USER || 'postgres',
    password: process.env.POSTGRES_PASSWORD || '12345678',
    database: process.env.POSTGRES_DATABASE || 'group_project'
});

// Medicine images mapping - using pharmaceutical/medical images
const medicineImages = {
    3: 'https://www.drugs.com/images/pills/nlm/004024102.jpg', // Diphenhydramine - Benadryl
    4: 'https://www.drugs.com/images/pills/nlm/002590200.jpg', // Guaifenesin - Mucinex
    5: 'https://www.drugs.com/images/pills/nlm/551540169.jpg', // Omeprazole - Prilosec
    6: 'https://www.drugs.com/images/pills/nlm/005910150.jpg', // Ranitidine - Zantac
    7: 'https://www.drugs.com/images/pills/nlm/005910020.jpg', // Famotidine - Pepcid
    8: 'https://www.drugs.com/images/pills/nlm/001860040.jpg', // Esomeprazole - Nexium
    9: 'https://www.drugs.com/images/pills/nlm/006030015.jpg', // Lansoprazole - Prevacid
    10: 'https://www.drugs.com/images/pills/nlm/006030020.jpg', // Dicyclomine - Bentyl
    11: 'https://www.drugs.com/images/pills/nlm/500900671.jpg', // Loperamide - Imodium
    12: 'https://www.drugs.com/images/pills/nlm/006240122.jpg', // Rifaximin - Xifaxan
    13: 'https://www.drugs.com/images/pills/nlm/000310780.jpg', // Dextromethorphan - Robitussin
    14: 'https://www.drugs.com/images/pills/nlm/597620690.jpg', // Albuterol - Ventolin
    15: 'https://www.drugs.com/images/pills/nlm/000870060.jpg', // Metformin - Glucophage
    16: 'https://www.drugs.com/images/pills/nlm/000090017.jpg', // Glipizide - Glucotrol
    17: 'https://www.drugs.com/images/pills/custom/insulin-vial.png', // Insulin
    18: 'https://www.drugs.com/images/pills/nlm/000710145.jpg', // Amlodipine - Norvasc
    19: 'https://www.drugs.com/images/pills/nlm/000060227.jpg', // Lisinopril - Prinivil
    20: 'https://www.drugs.com/images/pills/nlm/591480130.jpg', // Hydrochlorothiazide
    21: 'https://www.drugs.com/images/pills/nlm/000710155.jpg', // Atorvastatin - Lipitor
    22: 'https://www.drugs.com/images/pills/nlm/000780391.jpg', // Rosuvastatin - Crestor
    23: 'https://www.drugs.com/images/pills/nlm/000250524.jpg', // Celecoxib - Celebrex
    24: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400', // Glucosamine
    25: 'https://www.drugs.com/images/pills/nlm/000030191.jpg', // Methotrexate
    26: 'https://images.unsplash.com/photo-1585435557343-3b092031a831?w=400', // Adalimumab - Humira
    27: 'https://images.unsplash.com/photo-1584017911766-d451b3d0e843?w=400', // Salmeterol/Fluticasone
    28: 'https://images.unsplash.com/photo-1584017911766-d451b3d0e843?w=400', // Tiotropium - Spiriva
    29: 'https://www.drugs.com/images/pills/nlm/000090073.jpg', // Prednisone
    30: 'https://www.drugs.com/images/pills/nlm/005000490.jpg', // Acetaminophen - Tylenol
    31: 'https://www.drugs.com/images/pills/nlm/000090019.jpg', // Alprazolam - Xanax
    32: 'https://www.drugs.com/images/pills/nlm/000490106.jpg', // Sertraline - Zoloft
    33: 'https://www.drugs.com/images/pills/nlm/004560518.jpg', // Escitalopram - Lexapro
    34: 'https://www.drugs.com/images/pills/nlm/435980031.jpg', // Amoxicillin-Clavulanate - Augmentin
    35: 'https://images.unsplash.com/photo-1584017911766-d451b3d0e843?w=400', // Mometasone - Nasonex
    36: 'https://www.drugs.com/images/pills/nlm/000540475.jpg', // Ferrous Sulfate
    37: 'https://www.drugs.com/images/pills/nlm/000970232.jpg', // Tamsulosin - Flomax
    38: 'https://www.drugs.com/images/pills/nlm/656490517.jpg', // Amoxicillin
    39: 'https://www.drugs.com/images/pills/nlm/000930082.jpg', // Azithromycin - Zithromax
    40: 'https://images.unsplash.com/photo-1587854692152-cbe660dbde88?w=400', // Clotrimazole - Lotrimin
    41: 'https://www.drugs.com/images/pills/nlm/000780242.jpg', // Terbinafine - Lamisil
    42: 'https://images.unsplash.com/photo-1587854692152-cbe660dbde88?w=400', // Miconazole
    43: 'https://images.unsplash.com/photo-1583947581924-860bda6a26df?w=400', // Silver Sulfadiazine
    44: 'https://images.unsplash.com/photo-1596178065887-1198b6148b2b?w=400', // Aloe Vera
    45: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400', // Chlorhexidine
    46: 'https://images.unsplash.com/photo-1609840114035-3c981b782dfe?w=400', // Fluoride Toothpaste
    47: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400', // Hydrogen Peroxide
    48: 'https://www.drugs.com/images/pills/nlm/000040257.jpg', // Orlistat - Xenical
    49: 'https://www.drugs.com/images/pills/nlm/005270375.jpg', // Phentermine - Adipex
    50: 'https://www.drugs.com/images/pills/nlm/000930090.jpg', // Acyclovir - Zovirax
    51: 'https://images.unsplash.com/photo-1587854692152-cbe660dbde88?w=400', // Docosanol - Abreva
    52: 'https://www.drugs.com/images/pills/nlm/000930156.jpg', // Valacyclovir - Valtrex
    53: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400', // Polyethylene Glycol - MiraLAX
    54: 'https://www.drugs.com/images/pills/nlm/000140601.jpg', // Bisacodyl - Dulcolax
    55: 'https://images.unsplash.com/photo-1587854692152-cbe660dbde88?w=400', // Hydrocortisone
    56: 'https://www.drugs.com/images/pills/nlm/000930069.jpg', // Cephalexin - Keflex
    57: 'https://www.drugs.com/images/pills/nlm/000930070.jpg', // Dicloxacillin
    58: 'https://www.drugs.com/images/pills/nlm/000410001.jpg', // Bismuth Subsalicylate - Pepto
    59: 'https://www.drugs.com/images/pills/nlm/000060021.jpg', // Alendronate - Fosamax
    60: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400', // Calcium Carbonate
    61: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400', // Vitamin D
    62: 'https://www.drugs.com/images/pills/nlm/000200101.jpg', // Carisoprodol - Soma
    63: 'https://www.drugs.com/images/pills/nlm/003030103.jpg', // Orphenadrine - Norflex
    64: 'https://www.drugs.com/images/pills/nlm/000900095.jpg', // Diclofenac - Voltaren
    65: 'https://www.drugs.com/images/pills/nlm/000930537.jpg', // Naproxen - Aleve
    66: 'https://images.unsplash.com/photo-1585435557343-3b092031a831?w=400', // Peginterferon alfa
    67: 'https://www.drugs.com/images/pills/nlm/617580401.jpg', // Tenofovir - Viread
    68: 'https://www.drugs.com/images/pills/nlm/000870059.jpg', // Entecavir - Baraclude
    69: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400', // Simethicone - Gas-X
    70: 'https://images.unsplash.com/photo-1559757175-0eb30cd8c063?w=400', // Artificial Tears
    71: 'https://images.unsplash.com/photo-1559757175-0eb30cd8c063?w=400', // Cyclosporine - Restasis
    72: 'https://www.drugs.com/images/pills/nlm/002440340.jpg', // Chlorpheniramine - CTM
    73: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400', // Ambroxol
    74: 'https://www.drugs.com/images/pills/nlm/000870213.jpg', // Acetylcysteine - Mucomyst
    75: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400', // Test Medicine
};

async function updateMedicineImages() {
    console.log('Starting to update medicine images...\n');

    let updated = 0;
    let errors = 0;

    for (const [thuoctay_sk, image_url] of Object.entries(medicineImages)) {
        try {
            const result = await pool.query(
                'UPDATE dim_thuoctay SET image_url = $1 WHERE thuoctay_sk = $2 AND image_url IS NULL',
                [image_url, parseInt(thuoctay_sk)]
            );

            if (result.rowCount > 0) {
                updated++;
                console.log(`✅ Updated thuoctay_sk ${thuoctay_sk}`);
            } else {
                console.log(`⏭️ Skipped thuoctay_sk ${thuoctay_sk} (already has image)`);
            }
        } catch (err) {
            errors++;
            console.error(`❌ Error updating thuoctay_sk ${thuoctay_sk}:`, err.message);
        }
    }

    console.log(`\n========== SUMMARY ==========`);
    console.log(`Updated: ${updated}`);
    console.log(`Errors: ${errors}`);
    console.log(`==============================`);

    await pool.end();
}

updateMedicineImages();
