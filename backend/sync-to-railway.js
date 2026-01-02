const { Pool } = require('pg');
require('dotenv').config();

const RAILWAY_URL = 'postgresql://postgres:IswzwPHhKLGzgEtePjCvgGJsOMavtttT@switchback.proxy.rlwy.net:40293/railway';

// Local database config
const localPool = new Pool({
    host: process.env.POSTGRES_HOST || 'localhost',
    port: process.env.POSTGRES_PORT || 5432,
    user: process.env.POSTGRES_USER || 'postgres',
    password: process.env.POSTGRES_PASSWORD || '12345678',
    database: process.env.POSTGRES_DATABASE || 'group_project'
});

// Railway database config
const railwayPool = new Pool({
    connectionString: RAILWAY_URL,
    ssl: { rejectUnauthorized: false }
});

async function syncTable(tableName, primaryKey = null) {
    console.log(`\n🔄 Syncing ${tableName}...`);

    try {
        // Get all data from local
        const localData = await localPool.query(`SELECT * FROM ${tableName}`);
        console.log(`   📥 Local: ${localData.rows.length} records`);

        if (localData.rows.length === 0) {
            console.log(`   ⏭️ Skipped (no data)`);
            return;
        }

        // Get columns from first row
        const columns = Object.keys(localData.rows[0]);

        // Clear existing data on Railway and insert fresh
        await railwayPool.query(`DELETE FROM ${tableName}`);
        console.log(`   🗑️ Cleared Railway table`);

        // Insert data row by row with parameterized queries
        let insertCount = 0;
        for (const row of localData.rows) {
            const values = columns.map(col => row[col]);
            const placeholders = columns.map((_, i) => `$${i + 1}`).join(', ');
            const columnsStr = columns.map(c => `"${c}"`).join(', ');

            try {
                await railwayPool.query(
                    `INSERT INTO ${tableName} (${columnsStr}) VALUES (${placeholders})`,
                    values
                );
                insertCount++;
            } catch (err) {
                console.log(`   ⚠️ Row error: ${err.message.substring(0, 60)}`);
            }
        }

        console.log(`   ✅ Inserted: ${insertCount}/${localData.rows.length} records`);

    } catch (error) {
        console.log(`   ❌ Error: ${error.message}`);
    }
}

async function main() {
    console.log('🚀 Starting database sync: LOCAL → RAILWAY\n');
    console.log('='.repeat(50));

    // Tables to sync (in order to respect foreign keys)
    const tables = [
        'nhombenh',
        'dim_benh',
        'dim_thaoduoc',
        'dim_thuoctay',
        'map_nhombenh_benh',
        'trieu_chung',
        'thaoduoc_cochetacdong',
        'thaoduoc_dacdiemnguongoc',
        'thaoduoc_doctinh',
        'thaoduoc_thoigiantacdung',
        'thuoctay_dacdiemnguongoc',
        'thuoctay_doctinh',
        'thuoctay_thoigiantacdung',
        'users',
        'login_logs'
    ];

    for (const table of tables) {
        await syncTable(table);
    }

    console.log('\n' + '='.repeat(50));
    console.log('✅ SYNC COMPLETED!');
    console.log('='.repeat(50));

    // Verify counts
    console.log('\n📊 Verification:');
    for (const table of tables) {
        try {
            const result = await railwayPool.query(`SELECT COUNT(*) FROM ${table}`);
            console.log(`   ${table}: ${result.rows[0].count} records`);
        } catch (err) {
            console.log(`   ${table}: ❌ Error`);
        }
    }

    await localPool.end();
    await railwayPool.end();
}

main().catch(console.error);
