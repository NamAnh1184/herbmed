

const fs = require('fs');
const path = require('path');

// Source and destination directories
const SOURCE_DIR = path.join(__dirname, '..');
const DEST_DIR = path.join(__dirname, '..', 'frontend', 'pages', 'treatments');

// Template header/navigation/footer for treatment pages
const TEMPLATE_HEAD = `<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>{{TITLE}} | HerbMed - Thảo Dược Việt</title>
  <link rel="stylesheet" href="../../css/main.css" />
  <link rel="icon" type="image/x-icon" href="../../assets/images/common/favicon.png">
</head>
<body>
  <header class="header">
    <div class="header-left"><a href="../../index.html"><img src="../../assets/images/common/541994741_24566699099664215_389644405058898715_n.png" alt="logo" class="logo" /></a><div><p>HerbMed</p><p>Thảo Dược Việt</p></div></div>
    <div class="header-center"><div class="header-item"><svg xmlns="http://www.w3.org/2000/svg" width="50" height="15" fill="currentColor"><path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414zM0 4.697v7.104l5.803-3.558zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586zm3.436-.586L16 11.801V4.697z"/></svg>Nhóm 3</div><div class="header-item"><svg xmlns="http://www.w3.org/2000/svg" width="50" height="15" fill="currentColor"><path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5"/></svg>ICT/DS/CS USTH</div></div>
    <div class="header-right"><div class="search-container"><input type="text" id="searchInput" placeholder="Tìm Kiếm..."><button id="searchButton" class="search-btn">Tìm Kiếm</button><div id="suggestions" class="suggest-box"></div></div></div>
  </header>
  <nav class="navbar">
    <ul class="nav-left">
      <li><a href="../../index.html">Trang Chủ</a></li>
      <li class="dropdown"><a class="dropbtn">Bệnh</a><ul class="dropdown-menu"><li><a href="../diseases/ho-hap.html">Tai Mũi Họng và Hô Hấp</a></li><li><a href="../diseases/tieu-hoa.html">Tiêu Hóa</a></li><li><a href="../diseases/mat.html">Mắt</a></li><li><a href="../diseases/noi-tiet.html">Nội Tiết và Chuyển Hóa</a></li><li><a href="../diseases/tim-mach.html">Máu và Tim Mạch</a></li><li><a href="../diseases/tam-ly.html">Tâm Lý Học</a></li><li><a href="../diseases/co-xuong-khop.html">Cơ Xương Khớp</a></li><li><a href="../diseases/sinh-duc.html">Nam Khoa và Phụ Khoa</a></li><li><a href="../diseases/da-lieu.html">Da Liễu</a></li><li><a href="../diseases/rang-ham-mat.html">Răng Hàm Mặt</a></li></ul></li>
      <li class="dropdown"><a class="dropbtn">Thuốc</a><ul class="dropdown-menu"><li><a href="thao-duoc.html">Thảo Dược</a></li><li><a href="thuoc-tay.html">Thuốc Tây</a></li></ul></li>
      <li><a href="../tai-lieu.html">Tài Liệu Tham Khảo</a></li><li><a href="../ve-chung-toi.html">Về Chúng Tôi</a></li>
    </ul>
    <ul class="nav-right"><li><a class="btn white" href="../auth/dang-nhap.html">Đăng Nhập</a></li><li><a class="btn white" href="../auth/dang-ky.html">Đăng Ký</a></li></ul>
  </nav>
`;

const TEMPLATE_FOOTER = `
  <footer class="site-footer"><div class="container footer__inner"><div class="footer__brand">© <span id="year">2025</span> HerbMed - Thảo Dược Việt</div><a class="footer__link" href="../ve-chung-toi.html">Về chúng tôi</a></div></footer>
  <script>document.getElementById('year').textContent = new Date().getFullYear();</script>
  <script src="../../js/search.js"></script>
  <script src="../../js/auth.js"></script>
</body>
</html>`;

// Extract main content from original file
function extractMainContent(html) {
    // Find <main> ... </main>
    const mainMatch = html.match(/<main[^>]*>([\s\S]*?)<\/main>/i);
    if (mainMatch) {
        return mainMatch[0];
    }
    return '<main class="drug-page"><h1>Nội dung đang cập nhật</h1></main>';
}

// Extract title from original file
function extractTitle(html) {
    const titleMatch = html.match(/<title>([^|<]+)/i);
    if (titleMatch) {
        return titleMatch[1].trim();
    }
    return 'Thuốc';
}

// Convert filename from thuoc-xxx.html to xxx.html (slug format)
function convertFilename(originalName) {
    // Remove 'thuoc-' prefix
    let newName = originalName.replace(/^thuoc-/, '');
    return newName;
}

// Main conversion function
function convertFile(sourceFile) {
    const sourcePath = path.join(SOURCE_DIR, sourceFile);
    const destFilename = convertFilename(sourceFile);
    const destPath = path.join(DEST_DIR, destFilename);

    try {
        const html = fs.readFileSync(sourcePath, 'utf8');
        const title = extractTitle(html);
        const mainContent = extractMainContent(html);

        const newHtml = TEMPLATE_HEAD.replace('{{TITLE}}', title) + mainContent + TEMPLATE_FOOTER;

        fs.writeFileSync(destPath, newHtml, 'utf8');
        console.log(`✅ Converted: ${sourceFile} → ${destFilename}`);
        return true;
    } catch (err) {
        console.error(`❌ Error converting ${sourceFile}:`, err.message);
        return false;
    }
}

// Find all thuoc-*.html files
function findTreatmentFiles() {
    const files = fs.readdirSync(SOURCE_DIR);
    return files.filter(f => f.startsWith('thuoc-') && f.endsWith('.html'));
}

// Main execution
console.log('🚀 Bắt đầu chuyển đổi các file thuoc-*.html...\n');

// Ensure destination directory exists
if (!fs.existsSync(DEST_DIR)) {
    fs.mkdirSync(DEST_DIR, { recursive: true });
}

const treatmentFiles = findTreatmentFiles();
console.log(`📁 Tìm thấy ${treatmentFiles.length} files cần chuyển đổi\n`);

let successCount = 0;
let failCount = 0;

for (const file of treatmentFiles) {
    if (convertFile(file)) {
        successCount++;
    } else {
        failCount++;
    }
}

console.log(`\n✨ Hoàn thành!`);
console.log(`   ✅ Thành công: ${successCount}`);
console.log(`   ❌ Lỗi: ${failCount}`);
