const { Pool } = require('pg');
const fs = require('fs');
const path = require('path');

const DATABASE_URL = 'postgresql://postgres:IswzwPHhKLGzgEtePjCvgGJsOMavtttT@switchback.proxy.rlwy.net:40293/railway';

async function importDatabase() {
    const pool = new Pool({
        connectionString: DATABASE_URL,
        ssl: {
            rejectUnauthorized: false
        }
    });

    try {
        console.log('🔗 Connecting to Railway PostgreSQL...');

        // Read SQL file
        const sqlFilePath = path.join(__dirname, 'group_project_backup.sql');
        let sqlContent = fs.readFileSync(sqlFilePath, 'utf8');

        console.log('📄 SQL file loaded. Starting import...');

        // Split by semicolon and execute each statement
        const statements = sqlContent
            .split(';')
            .map(s => s.trim())
            .filter(s => s.length > 0 && !s.startsWith('--'));

        let successCount = 0;
        let errorCount = 0;

        for (const statement of statements) {
            try {
                await pool.query(statement);
                successCount++;
                if (successCount % 50 === 0) {
                    console.log(`✅ Executed ${successCount} statements...`);
                }
            } catch (err) {
                // Skip duplicate key errors and continue
                if (!err.message.includes('already exists') && !err.message.includes('duplicate key')) {
                    console.error(`❌ Error: ${err.message.substring(0, 100)}`);
                    errorCount++;
                }
            }
        }

        console.log(`\n✅ Import completed!`);
        console.log(`   - Successful: ${successCount}`);
        console.log(`   - Errors: ${errorCount}`);

        // Verify tables
        const tables = await pool.query(`
      SELECT table_name FROM information_schema.tables 
      WHERE table_schema = 'public' 
      ORDER BY table_name
    `);

        console.log(`\n📊 Tables in database:`);
        tables.rows.forEach(row => {
            console.log(`   - ${row.table_name}`);
        });

    } catch (error) {
        console.error('❌ Connection error:', error.message);
    } finally {
        await pool.end();
    }
}

importDatabase();
