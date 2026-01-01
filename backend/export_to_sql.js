// =====================================================
// EXPORT DATABASE TO SQL FILE - FULL VERSION
// Chạy: node export_to_sql.js
// Kết quả: file group_project_backup.sql
// =====================================================

const { Pool } = require('pg');
const fs = require('fs');
const path = require('path');
require('dotenv').config();

// Kết nối database
const pool = new Pool({
    host: process.env.POSTGRES_HOST || 'localhost',
    port: process.env.POSTGRES_PORT || 5432,
    user: process.env.POSTGRES_USER || 'postgres',
    password: process.env.POSTGRES_PASSWORD || '12345678',
    database: process.env.POSTGRES_DATABASE || 'group_project'
});

// Escape giá trị cho SQL
function escapeValue(val) {
    if (val === null || val === undefined) return 'NULL';
    if (typeof val === 'number') return val;
    if (typeof val === 'boolean') return val ? 'TRUE' : 'FALSE';
    if (val instanceof Date) return `'${val.toISOString()}'`;
    // Escape single quotes
    const escaped = String(val).replace(/'/g, "''");
    return `'${escaped}'`;
}

// Lấy tất cả bảng trong database
async function getAllTables() {
    const result = await pool.query(`
    SELECT table_name 
    FROM information_schema.tables 
    WHERE table_schema = 'public' 
    AND table_type = 'BASE TABLE'
    ORDER BY table_name
  `);
    return result.rows.map(r => r.table_name);
}

async function getTableSchema(tableName) {
    const result = await pool.query(`
    SELECT column_name, data_type, is_nullable, column_default
    FROM information_schema.columns
    WHERE table_name = $1
    ORDER BY ordinal_position
  `, [tableName]);
    return result.rows;
}

async function getTableData(tableName) {
    try {
        const result = await pool.query(`SELECT * FROM "${tableName}"`);
        return result.rows;
    } catch (err) {
        console.log(`⚠️ Lỗi khi đọc bảng ${tableName}: ${err.message}`);
        return [];
    }
}

async function generateCreateTable(tableName, schema) {
    if (schema.length === 0) return '';

    let sql = `-- Tạo bảng ${tableName}\n`;
    sql += `DROP TABLE IF EXISTS "${tableName}" CASCADE;\n`;
    sql += `CREATE TABLE "${tableName}" (\n`;

    const columns = schema.map(col => {
        let dataType = col.data_type.toUpperCase();

        // Handle serial types
        if (col.column_default && col.column_default.includes('nextval')) {
            dataType = 'SERIAL';
        }

        // Handle specific data types
        if (dataType === 'CHARACTER VARYING') dataType = 'VARCHAR(500)';
        if (dataType === 'TIMESTAMP WITHOUT TIME ZONE') dataType = 'TIMESTAMP';
        if (dataType === 'INTEGER' && col.column_default?.includes('nextval')) dataType = 'SERIAL';

        return `  "${col.column_name}" ${dataType}`;
    });

    sql += columns.join(',\n');
    sql += '\n);\n\n';

    return sql;
}

async function generateInserts(tableName, data) {
    if (data.length === 0) return '';

    let sql = `-- Dữ liệu bảng ${tableName} (${data.length} dòng)\n`;

    for (const row of data) {
        const columns = Object.keys(row);
        const values = columns.map(col => escapeValue(row[col]));
        sql += `INSERT INTO "${tableName}" (${columns.map(c => `"${c}"`).join(', ')}) VALUES (${values.join(', ')});\n`;
    }

    sql += '\n';
    return sql;
}

async function main() {
    console.log('============================================');
    console.log('   EXPORT DATABASE TO SQL FILE');
    console.log('============================================\n');

    // Lấy tất cả bảng
    const allTables = await getAllTables();
    console.log(`📋 Tìm thấy ${allTables.length} bảng trong database:\n`);
    allTables.forEach((t, i) => console.log(`   ${i + 1}. ${t}`));
    console.log('');

    let sqlContent = '';

    // Header
    sqlContent += '-- =====================================================\n';
    sqlContent += '-- HERBMED DATABASE - FULL BACKUP\n';
    sqlContent += `-- Exported: ${new Date().toISOString()}\n`;
    sqlContent += `-- Tổng số bảng: ${allTables.length}\n`;
    sqlContent += '-- Hướng dẫn: Mở DataGrip, chọn database, chạy file này\n';
    sqlContent += '-- =====================================================\n\n';

    // Tạo database instruction
    sqlContent += '-- BƯỚC 1: Tạo database (chạy riêng dòng này trước nếu chưa có database)\n';
    sqlContent += '-- CREATE DATABASE group_project;\n\n';
    sqlContent += '-- BƯỚC 2: Chọn database group_project rồi chạy phần còn lại\n\n';

    let totalRows = 0;

    for (const tableName of allTables) {
        console.log(`📦 Đang export bảng: ${tableName}...`);

        const schema = await getTableSchema(tableName);
        const data = await getTableData(tableName);

        sqlContent += await generateCreateTable(tableName, schema);
        sqlContent += await generateInserts(tableName, data);
        totalRows += data.length;
        console.log(`   ✅ ${data.length} dòng`);
    }

    // Reset sequences
    sqlContent += '\n-- =====================================================\n';
    sqlContent += '-- RESET SEQUENCES (để auto-increment hoạt động đúng)\n';
    sqlContent += '-- =====================================================\n';

    for (const tableName of allTables) {
        const schema = await getTableSchema(tableName);
        for (const col of schema) {
            if (col.column_default && col.column_default.includes('nextval')) {
                const seqMatch = col.column_default.match(/'([^']+)'/);
                if (seqMatch) {
                    sqlContent += `SELECT setval('${seqMatch[1]}', COALESCE((SELECT MAX("${col.column_name}") FROM "${tableName}"), 1));\n`;
                }
            }
        }
    }

    // Ghi file
    const outputPath = path.join(__dirname, 'group_project_backup.sql');
    fs.writeFileSync(outputPath, sqlContent, 'utf8');

    console.log('\n============================================');
    console.log('✅ EXPORT THÀNH CÔNG!');
    console.log('============================================');
    console.log(`📄 File: ${outputPath}`);
    console.log(`📊 Tổng số bảng: ${allTables.length}`);
    console.log(`📊 Tổng số dòng dữ liệu: ${totalRows}`);
    console.log('\nGửi file group_project_backup.sql cho bạn của bạn!');

    await pool.end();
}

main().catch(err => {
    console.error('❌ Lỗi:', err.message);
    pool.end();
});
