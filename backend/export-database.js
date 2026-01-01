// export-database.js - Script để export toàn bộ database ra file SQL
require('dotenv').config();
const { Pool } = require('pg');
const fs = require('fs');
const path = require('path');

const pool = new Pool({
    host: process.env.POSTGRES_HOST || 'localhost',
    port: process.env.POSTGRES_PORT || 5432,
    user: process.env.POSTGRES_USER || 'postgres',
    password: process.env.POSTGRES_PASSWORD || '12345678',
    database: process.env.POSTGRES_DATABASE || 'group_project'
});

async function exportDatabase() {
    console.log('🚀 Bắt đầu export database...\n');

    const client = await pool.connect();
    let sqlContent = '';

    try {
        // Header
        const now = new Date().toISOString();
        sqlContent += `-- =====================================================\n`;
        sqlContent += `-- HERBMED DATABASE - FULL BACKUP\n`;
        sqlContent += `-- Exported: ${now}\n`;
        sqlContent += `-- Tổng số bảng: 15\n`;
        sqlContent += `-- Hướng dẫn: Mở DataGrip/pgAdmin, chọn database, chạy file này\n`;
        sqlContent += `-- =====================================================\n\n`;
        sqlContent += `-- BƯỚC 1: Tạo database (chạy riêng dòng này trước nếu chưa có database)\n`;
        sqlContent += `-- CREATE DATABASE group_project;\n\n`;
        sqlContent += `-- BƯỚC 2: Chọn database group_project rồi chạy phần còn lại\n\n`;

        // Danh sách các bảng cần export (theo thứ tự phụ thuộc)
        const tables = [
            'dim_benh',
            'dim_thaoduoc',
            'dim_thuoctay',
            'login_logs',
            'map_nhombenh_benh',
            'nhombenh',
            'thaoduoc_cochetacdong',
            'thaoduoc_dacdiemnguongoc',
            'thaoduoc_doctinh',
            'thaoduoc_thoigiantacdung',
            'thuoctay_dacdiemnguongoc',
            'thuoctay_doctinh',
            'thuoctay_thoigiantacdung',
            'trieu_chung',
            'users'
        ];

        for (const tableName of tables) {
            console.log(`📋 Đang export bảng: ${tableName}...`);

            // Lấy cấu trúc bảng
            const columnsResult = await client.query(`
                SELECT column_name, data_type, character_maximum_length, is_nullable, column_default
                FROM information_schema.columns 
                WHERE table_name = $1 AND table_schema = 'public'
                ORDER BY ordinal_position
            `, [tableName]);

            if (columnsResult.rows.length === 0) {
                console.log(`   ⚠️ Bảng ${tableName} không tồn tại, bỏ qua.`);
                continue;
            }

            // Tạo DROP TABLE và CREATE TABLE
            sqlContent += `-- Tạo bảng ${tableName}\n`;
            sqlContent += `DROP TABLE IF EXISTS "${tableName}" CASCADE;\n`;
            sqlContent += `CREATE TABLE "${tableName}" (\n`;

            const columnDefs = columnsResult.rows.map(col => {
                let dataType = col.data_type.toUpperCase();
                if (dataType === 'CHARACTER VARYING') {
                    dataType = `VARCHAR(${col.character_maximum_length || 500})`;
                } else if (dataType === 'INTEGER' && col.column_default && col.column_default.includes('nextval')) {
                    dataType = 'SERIAL';
                }
                return `  "${col.column_name}" ${dataType}`;
            });

            sqlContent += columnDefs.join(',\n');
            sqlContent += `\n);\n\n`;

            // Lấy dữ liệu
            const dataResult = await client.query(`SELECT * FROM "${tableName}"`);

            if (dataResult.rows.length > 0) {
                sqlContent += `-- Dữ liệu bảng ${tableName} (${dataResult.rows.length} dòng)\n`;

                const columns = columnsResult.rows.map(c => c.column_name);

                for (const row of dataResult.rows) {
                    const values = columns.map(col => {
                        const val = row[col];
                        if (val === null || val === undefined) {
                            return 'NULL';
                        } else if (typeof val === 'number') {
                            return val;
                        } else if (val instanceof Date) {
                            return `'${val.toISOString()}'`;
                        } else {
                            // Escape single quotes
                            const escaped = String(val).replace(/'/g, "''");
                            return `'${escaped}'`;
                        }
                    });

                    sqlContent += `INSERT INTO "${tableName}" (${columns.map(c => `"${c}"`).join(', ')}) VALUES (${values.join(', ')});\n`;
                }
            }

            sqlContent += `\n`;
            console.log(`   ✅ ${tableName}: ${dataResult.rows.length} dòng`);
        }

        // Reset sequences
        sqlContent += `\n-- =====================================================\n`;
        sqlContent += `-- RESET SEQUENCES (để auto-increment hoạt động đúng)\n`;
        sqlContent += `-- =====================================================\n`;
        sqlContent += `SELECT setval('login_logs_id_seq', COALESCE((SELECT MAX("id") FROM "login_logs"), 1));\n`;
        sqlContent += `SELECT setval('users_id_seq', COALESCE((SELECT MAX("id") FROM "users"), 1));\n`;

        // Ghi file
        const outputPath = path.join(__dirname, 'group_project_backup.sql');
        fs.writeFileSync(outputPath, sqlContent, 'utf8');

        console.log(`\n========================================`);
        console.log(`✅ Export hoàn tất!`);
        console.log(`📁 File: ${outputPath}`);
        console.log(`📊 Kích thước: ${(Buffer.byteLength(sqlContent, 'utf8') / 1024).toFixed(2)} KB`);
        console.log(`========================================\n`);

    } catch (error) {
        console.error('❌ Lỗi:', error.message);
    } finally {
        client.release();
        await pool.end();
    }
}

exportDatabase();
