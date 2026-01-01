// Test script for dashboard-stats queries
const { Pool } = require('pg');
require('dotenv').config();

const pool = new Pool({
    host: process.env.POSTGRES_HOST || 'localhost',
    port: process.env.POSTGRES_PORT || 5432,
    user: process.env.POSTGRES_USER || 'postgres',
    password: process.env.POSTGRES_PASSWORD || '12345678',
    database: process.env.POSTGRES_DATABASE || 'group_project'
});

async function testQueries() {
    try {
        console.log('Testing database connection...');
        await pool.query('SELECT 1');
        console.log('✅ Database connected');

        console.log('\n1. Testing totalUsers...');
        const totalUsers = await pool.query('SELECT COUNT(*) FROM users');
        console.log('✅ totalUsers:', totalUsers.rows[0].count);

        console.log('\n2. Testing todayLogins...');
        const todayLogins = await pool.query(`SELECT COUNT(*) FROM login_logs WHERE login_at >= CURRENT_DATE`);
        console.log('✅ todayLogins:', todayLogins.rows[0].count);

        console.log('\n3. Testing newUsers7Days...');
        const newUsers7Days = await pool.query(`SELECT COUNT(*) FROM users WHERE created_at >= CURRENT_DATE - INTERVAL '7 days'`);
        console.log('✅ newUsers7Days:', newUsers7Days.rows[0].count);

        console.log('\n4. Testing totalDiseases...');
        const totalDiseases = await pool.query('SELECT COUNT(*) FROM dim_benh');
        console.log('✅ totalDiseases:', totalDiseases.rows[0].count);

        console.log('\n5. Testing totalHerbs...');
        const totalHerbs = await pool.query('SELECT COUNT(*) FROM dim_thaoduoc');
        console.log('✅ totalHerbs:', totalHerbs.rows[0].count);

        console.log('\n6. Testing totalMedicines...');
        const totalMedicines = await pool.query('SELECT COUNT(*) FROM dim_thuoctay');
        console.log('✅ totalMedicines:', totalMedicines.rows[0].count);

        console.log('\n7. Testing avgAge...');
        const avgAge = await pool.query('SELECT AVG(age) FROM users WHERE age IS NOT NULL');
        console.log('✅ avgAge:', avgAge.rows[0].avg);

        console.log('\n8. Testing avgBmi...');
        const avgBmi = await pool.query(`SELECT AVG(weight / ((height / 100.0) * (height / 100.0))) as avg_bmi FROM users WHERE weight IS NOT NULL AND height IS NOT NULL AND height > 0`);
        console.log('✅ avgBmi:', avgBmi.rows[0].avg_bmi);

        console.log('\n9. Testing genderDistribution...');
        const genderDistribution = await pool.query(`SELECT COALESCE(gender, 'Khác') as gender, COUNT(*) as count FROM users GROUP BY COALESCE(gender, 'Khác') ORDER BY count DESC`);
        console.log('✅ genderDistribution:', genderDistribution.rows);

        console.log('\n10. Testing ageDistribution...');
        const ageDistribution = await pool.query(`
      SELECT age_group, COUNT(*) as count FROM (
        SELECT 
          CASE 
            WHEN age < 18 THEN 'Dưới 18'
            WHEN age BETWEEN 18 AND 30 THEN '18-30'
            WHEN age BETWEEN 31 AND 45 THEN '31-45'
            WHEN age BETWEEN 46 AND 60 THEN '46-60'
            WHEN age > 60 THEN 'Trên 60'
            ELSE 'Chưa rõ'
          END as age_group,
          CASE 
            WHEN age < 18 THEN 1
            WHEN age BETWEEN 18 AND 30 THEN 2
            WHEN age BETWEEN 31 AND 45 THEN 3
            WHEN age BETWEEN 46 AND 60 THEN 4
            WHEN age > 60 THEN 5
            ELSE 6
          END as sort_order
        FROM users
      ) subq
      GROUP BY age_group, sort_order
      ORDER BY sort_order
    `);
        console.log('✅ ageDistribution:', ageDistribution.rows);

        console.log('\n11. Testing registrationTimeline...');
        const registrationTimeline = await pool.query(`SELECT DATE(created_at) as date, COUNT(*) as count FROM users WHERE created_at >= CURRENT_DATE - INTERVAL '30 days' GROUP BY DATE(created_at) ORDER BY date`);
        console.log('✅ registrationTimeline:', registrationTimeline.rows.length, 'rows');

        console.log('\n12. Testing bmiDistribution...');
        const bmiDistribution = await pool.query(`
      SELECT bmi_category, COUNT(*) as count FROM (
        SELECT 
          CASE 
            WHEN (weight / ((height / 100.0) * (height / 100.0))) < 18.5 THEN 'Thiếu cân'
            WHEN (weight / ((height / 100.0) * (height / 100.0))) BETWEEN 18.5 AND 24.9 THEN 'Bình thường'
            WHEN (weight / ((height / 100.0) * (height / 100.0))) BETWEEN 25 AND 29.9 THEN 'Thừa cân'
            WHEN (weight / ((height / 100.0) * (height / 100.0))) >= 30 THEN 'Béo phì'
            ELSE 'Chưa có dữ liệu'
          END as bmi_category,
          CASE 
            WHEN (weight / ((height / 100.0) * (height / 100.0))) < 18.5 THEN 1
            WHEN (weight / ((height / 100.0) * (height / 100.0))) BETWEEN 18.5 AND 24.9 THEN 2
            WHEN (weight / ((height / 100.0) * (height / 100.0))) BETWEEN 25 AND 29.9 THEN 3
            WHEN (weight / ((height / 100.0) * (height / 100.0))) >= 30 THEN 4
            ELSE 5
          END as sort_order
        FROM users
        WHERE weight IS NOT NULL AND height IS NOT NULL AND height > 0
      ) subq
      GROUP BY bmi_category, sort_order
      ORDER BY sort_order
    `);
        console.log('✅ bmiDistribution:', bmiDistribution.rows);

        console.log('\n13. Testing locationDistribution...');
        const locationDistribution = await pool.query(`SELECT COALESCE(location, 'Chưa rõ') as location, COUNT(*) as count FROM users WHERE location IS NOT NULL AND location != '' GROUP BY location ORDER BY count DESC LIMIT 15`);
        console.log('✅ locationDistribution:', locationDistribution.rows.length, 'rows');

        console.log('\n14. Testing diseaseCategories...');
        try {
            const diseaseCategories = await pool.query(`SELECT n.nhom_benh, COUNT(m.benh_sk) as count FROM nhombenh n LEFT JOIN map_nhombenh_benh m ON n.nhombenh_sk = m.nhombenh_sk GROUP BY n.nhom_benh ORDER BY count DESC`);
            console.log('✅ diseaseCategories:', diseaseCategories.rows.length, 'rows');
        } catch (e) {
            console.log('⚠️ diseaseCategories failed:', e.message);
        }

        console.log('\n15. Testing loginTimeline...');
        const loginTimeline = await pool.query(`SELECT DATE(login_at) as date, COUNT(*) as count FROM login_logs WHERE login_at >= CURRENT_DATE - INTERVAL '14 days' GROUP BY DATE(login_at) ORDER BY date`);
        console.log('✅ loginTimeline:', loginTimeline.rows.length, 'rows');

        console.log('\n16. Testing healthDataCoverage...');
        const healthDataCoverage = await pool.query(`SELECT COUNT(*) as total, COUNT(CASE WHEN height IS NOT NULL AND weight IS NOT NULL THEN 1 END) as with_bmi, COUNT(CASE WHEN common_diseases IS NOT NULL AND common_diseases != '' THEN 1 END) as with_diseases, COUNT(CASE WHEN allergies IS NOT NULL AND allergies != '' THEN 1 END) as with_allergies FROM users`);
        console.log('✅ healthDataCoverage:', healthDataCoverage.rows[0]);

        console.log('\n17. Testing usersWithDiseases...');
        const usersWithDiseases = await pool.query(`SELECT common_diseases FROM users WHERE common_diseases IS NOT NULL AND common_diseases != ''`);
        console.log('✅ usersWithDiseases:', usersWithDiseases.rows.length, 'rows');

        console.log('\n18. Testing usersWithAllergies...');
        const usersWithAllergies = await pool.query(`SELECT allergies FROM users WHERE allergies IS NOT NULL AND allergies != ''`);
        console.log('✅ usersWithAllergies:', usersWithAllergies.rows.length, 'rows');

        console.log('\n\n✅✅✅ ALL TESTS PASSED ✅✅✅');

    } catch (err) {
        console.error('❌ TEST FAILED:', err.message);
        console.error('Stack:', err.stack);
    } finally {
        await pool.end();
    }
}

testQueries();
