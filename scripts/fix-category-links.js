/**
 * Script fix links trong các disease category pages
 * Chạy: node scripts/fix-category-links.js
 */

const fs = require('fs');
const path = require('path');

const DISEASES_DIR = path.join(__dirname, '..', 'frontend', 'pages', 'diseases');

// Fix links in a single file
function fixFile(filePath) {
    let content = fs.readFileSync(filePath, 'utf8');

    // Replace ../treatments/xxx.html with benh-xxx.html for disease cards
    // Pattern: href="../treatments/cam-lanh.html" -> href="benh-cam-lanh.html"
    const originalContent = content;

    content = content.replace(/href="\.\.\/treatments\/([^"]+)\.html"/g, (match, name) => {
        // Convert treatment name to disease name
        return `href="benh-${name}.html"`;
    });

    if (content !== originalContent) {
        fs.writeFileSync(filePath, content, 'utf8');
        console.log(`✅ Fixed: ${path.basename(filePath)}`);
        return true;
    }

    console.log(`⏭️  No changes: ${path.basename(filePath)}`);
    return false;
}

// Main
console.log('🔧 Fixing links in disease category pages...\n');

const files = fs.readdirSync(DISEASES_DIR).filter(f => f.endsWith('.html') && !f.startsWith('benh-'));
let fixedCount = 0;

for (const file of files) {
    const filePath = path.join(DISEASES_DIR, file);
    if (fixFile(filePath)) {
        fixedCount++;
    }
}

console.log(`\n✨ Done! Fixed ${fixedCount} files.`);
