const { Pool } = require('pg');

const RAILWAY_URL = 'postgresql://postgres:IswzwPHhKLGzgEtePjCvgGJsOMavtttT@switchback.proxy.rlwy.net:40293/railway';

async function fixSequence() {
    const pool = new Pool({
        connectionString: RAILWAY_URL,
        ssl: { rejectUnauthorized: false }
    });

    try {
        console.log('📊 Fixing login_logs primary key sequence...');

        // Get current max ID
        const maxResult = await pool.query('SELECT MAX(id) as max_id FROM login_logs');
        const maxId = maxResult.rows[0].max_id || 0;
        console.log('Current max ID:', maxId);

        // Reset sequence to max + 1
        const newSeq = maxId + 1;
        await pool.query(`ALTER SEQUENCE login_logs_id_seq RESTART WITH ${newSeq}`);
        console.log(`✅ Reset sequence to ${newSeq}`);

        // Verify 
        const seqResult = await pool.query("SELECT last_value FROM login_logs_id_seq");
        console.log('New sequence value:', seqResult.rows[0].last_value);

        console.log('✅ Done!');

    } catch (error) {
        console.error('❌ Error:', error.message);
    } finally {
        await pool.end();
    }
}

fixSequence();
