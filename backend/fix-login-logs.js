const { Pool } = require('pg');

const RAILWAY_URL = 'postgresql://postgres:IswzwPHhKLGzgEtePjCvgGJsOMavtttT@switchback.proxy.rlwy.net:40293/railway';

async function fixLoginLogs() {
    const pool = new Pool({
        connectionString: RAILWAY_URL,
        ssl: { rejectUnauthorized: false }
    });

    try {
        console.log('📊 Check and fix login_logs table...');

        // Check current structure
        const result = await pool.query(`
      SELECT column_name, data_type 
      FROM information_schema.columns 
      WHERE table_name = 'login_logs'
    `);

        console.log('Current columns:', result.rows);

        // Add user_agent column if missing
        try {
            await pool.query(`ALTER TABLE login_logs ADD COLUMN IF NOT EXISTS user_agent TEXT`);
            console.log('✅ Added user_agent column');
        } catch (e) {
            console.log('user_agent column already exists or error:', e.message);
        }

        // Add ip_address column if missing
        try {
            await pool.query(`ALTER TABLE login_logs ADD COLUMN IF NOT EXISTS ip_address VARCHAR(100)`);
            console.log('✅ Added ip_address column');
        } catch (e) {
            console.log('ip_address column already exists or error:', e.message);
        }

        // Check again
        const result2 = await pool.query(`
      SELECT column_name, data_type 
      FROM information_schema.columns 
      WHERE table_name = 'login_logs'
    `);
        console.log('Updated columns:', result2.rows);

        console.log('✅ Done!');

    } catch (error) {
        console.error('❌ Error:', error.message);
    } finally {
        await pool.end();
    }
}

fixLoginLogs();
