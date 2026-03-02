
// API Base URL
const API_BASE = window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1'
    ? 'http://localhost:3000/api'
    : 'https://herbmed-production.up.railway.app/api';


// Get disease ID from URL
const urlParams = new URLSearchParams(window.location.search);
const diseaseId = urlParams.get('id');

// DOM Elements
const pageContent = document.getElementById('pageContent');

// Initialize
document.addEventListener('DOMContentLoaded', async () => {
    if (!diseaseId) {
        showError('Không tìm thấy ID bệnh trong URL');
        return;
    }

    await loadDiseaseDetail();
});

// Load disease detail
async function loadDiseaseDetail() {
    try {
        // Fetch disease info
        const diseaseRes = await fetch(`${API_BASE}/benh/${diseaseId}`);
        if (!diseaseRes.ok) {
            throw new Error('Không tìm thấy bệnh');
        }
        const disease = await diseaseRes.json();

        // Fetch related herbs
        const herbsRes = await fetch(`${API_BASE}/benh/${diseaseId}/thaoduoc`);
        const herbsData = await herbsRes.json();
        const herbs = herbsData.data || [];

        // Fetch related medicines
        const medsRes = await fetch(`${API_BASE}/benh/${diseaseId}/thuoctay`);
        const medsData = await medsRes.json();
        const medicines = medsData.data || [];

        // Update page title
        document.title = `${disease.ten_benh} | Hôm Nay Bệnh Gì`;

        // Render content
        renderDiseaseDetail(disease, herbs, medicines);
    } catch (error) {
        console.error('Error loading disease:', error);
        showError(error.message || 'Không thể tải thông tin bệnh');
    }
}

// Helper function to format text with bullet points to HTML
function formatBulletText(text) {
    if (!text) return '';
    // Split by bullet points and format
    const lines = text.split('\n').filter(line => line.trim());
    return lines.map(line => {
        const cleanLine = line.replace(/^[•\-\*]\s*/, '').trim();
        return cleanLine ? `<li>${escapeHtml(cleanLine)}</li>` : '';
    }).join('');
}

// Render disease detail
function renderDiseaseDetail(disease, herbs, medicines) {
    const symptoms = disease.trieu_chung || [];

    const html = `
        <!-- DISEASE HEADER -->
        <section class="disease-header">
            <div class="container">
                <div class="disease-icon">🏥</div>
                <div class="disease-info">
                    <h1>${escapeHtml(disease.ten_benh)}</h1>
                    <span class="disease-category">
                        📁 ${disease.nhom_benh || 'Chưa phân loại'}
                    </span>
                </div>
            </div>
        </section>

        <main class="container">
            <!-- BREADCRUMB -->
            <nav class="breadcrumb">
                <a href="../index.html">Trang chủ</a> &gt;
                <a href="benh.html">Danh sách bệnh</a> &gt;
                <span>${escapeHtml(disease.ten_benh)}</span>
            </nav>

            <a href="benh.html" class="back-btn">← Quay lại danh sách</a>

            <div class="content-layout">
                <!-- MAIN CONTENT -->
                <div class="main-content">
                    
                    <!-- MÔ TẢ BỆNH -->
                    ${disease.mo_ta ? `
                    <div class="section-card">
                        <h2>
                            <span class="section-icon">📖</span>
                            Tổng Quan Về Bệnh
                        </h2>
                        <p style="color: #334155; line-height: 1.8; font-size: 1rem;">${escapeHtml(disease.mo_ta)}</p>
                    </div>
                    ` : ''}

                    <!-- NGUYÊN NHÂN -->
                    ${disease.nguyen_nhan ? `
                    <div class="section-card">
                        <h2>
                            <span class="section-icon">🔬</span>
                            Nguyên Nhân
                        </h2>
                        <ul class="info-list">${formatBulletText(disease.nguyen_nhan)}</ul>
                    </div>
                    ` : ''}

                    <!-- TRIỆU CHỨNG CHÍNH -->
                    ${disease.trieu_chung_chinh ? `
                    <div class="section-card">
                        <h2>
                            <span class="section-icon">🩺</span>
                            Triệu Chứng Thường Gặp
                        </h2>
                        <ul class="info-list">${formatBulletText(disease.trieu_chung_chinh)}</ul>
                    </div>
                    ` : ''}

                    <!-- HERBAL TREATMENTS - Di chuyển lên sau triệu chứng -->
                    <div class="section-card">
                        <h2>
                            <span class="section-icon">🌿</span>
                            Điều Trị Bằng Thảo Dược (${herbs.length})
                        </h2>
                        ${herbs.length > 0 ? `
                            <div class="treatment-grid">
                                ${herbs.map(herb => `
                                    <a href="treatments/thao-duoc-chi-tiet.html?id=${herb.thaoduoc_sk}" class="treatment-card herb">
                                        <div class="treatment-header">
                                            <span class="treatment-badge herb">🌿 Thảo dược</span>
                                        </div>
                                        <div class="treatment-name">${escapeHtml(herb.thao_duoc)}</div>
                                        <p class="treatment-desc">
                                            ${truncateText(herb.tong_hop_thao_duoc || 'Xem chi tiết về cách sử dụng và công dụng', 100)}
                                        </p>
                                    </a>
                                `).join('')}
                            </div>
                        ` : `
                            <p style="color: #64748b;">Chưa có thông tin về thảo dược điều trị</p>
                        `}
                    </div>

                    <!-- WESTERN MEDICINE -->
                    <div class="section-card">
                        <h2>
                            <span class="section-icon">💊</span>
                            Điều Trị Bằng Thuốc Tây (${medicines.length})
                        </h2>
                        ${medicines.length > 0 ? `
                            <div class="treatment-grid">
                                ${medicines.map(med => `
                                    <a href="treatments/thuoc-tay-chi-tiet.html?id=${med.thuoctay_sk}" class="treatment-card medicine">
                                        <div class="treatment-header">
                                            <span class="treatment-badge medicine">💊 Thuốc tây</span>
                                        </div>
                                        <div class="treatment-name">${escapeHtml(med.thuoc_tay)}</div>
                                        <p class="treatment-desc">
                                            ${truncateText(med.hoat_chat || 'Xem chi tiết về thành phần và cách dùng', 100)}
                                        </p>
                                    </a>
                                `).join('')}
                            </div>
                        ` : `
                            <p style="color: #64748b;">Chưa có thông tin về thuốc tây điều trị</p>
                        `}
                    </div>

                    <!-- ĐỐI TƯỢNG NGUY CƠ -->
                    ${disease.doi_tuong_nguy_co ? `
                    <div class="section-card">
                        <h2>
                            <span class="section-icon">👥</span>
                            Đối Tượng Nguy Cơ
                        </h2>
                        <ul class="info-list">${formatBulletText(disease.doi_tuong_nguy_co)}</ul>
                    </div>
                    ` : ''}

                    <!-- PHÒNG NGỪA -->
                    ${disease.phong_ngua ? `
                    <div class="section-card">
                        <h2>
                            <span class="section-icon">🛡️</span>
                            Cách Phòng Ngừa
                        </h2>
                        <ul class="info-list">${formatBulletText(disease.phong_ngua)}</ul>
                    </div>
                    ` : ''}

                    <!-- KHI NÀO CẦN KHÁM -->
                    ${disease.khi_nao_can_kham ? `
                    <div class="section-card" style="border-left: 4px solid #f59e0b;">
                        <h2>
                            <span class="section-icon" style="background: linear-gradient(135deg, #f59e0b, #fbbf24);">🚨</span>
                            Khi Nào Cần Đi Khám
                        </h2>
                        <ul class="info-list warning-list">${formatBulletText(disease.khi_nao_can_kham)}</ul>
                    </div>
                    ` : ''}

                    <!-- BIẾN CHỨNG -->
                    ${disease.bien_chung ? `
                    <div class="section-card" style="border-left: 4px solid #ef4444;">
                        <h2>
                            <span class="section-icon" style="background: linear-gradient(135deg, #ef4444, #f87171);">⚠️</span>
                            Biến Chứng Có Thể Xảy Ra
                        </h2>
                        <ul class="info-list danger-list">${formatBulletText(disease.bien_chung)}</ul>
                    </div>
                    ` : ''}

                    <!-- LƯU Ý -->
                    ${disease.luu_y ? `
                    <div class="section-card" style="background: linear-gradient(135deg, #eff6ff, #dbeafe);">
                        <h2>
                            <span class="section-icon" style="background: linear-gradient(135deg, #3b82f6, #60a5fa);">💡</span>
                            Lưu Ý Quan Trọng
                        </h2>
                        <ul class="info-list">${formatBulletText(disease.luu_y)}</ul>
                    </div>
                    ` : ''}
                </div>

                <!-- SIDEBAR -->
                <aside class="sidebar">
                    <div class="sidebar-card">
                        <h3>📊 Thông tin tổng quan</h3>
                        <ul class="quick-links">
                            <li>
                                <a href="#symptoms">
                                    <span>🩺</span>
                                    <span>${symptoms.length} triệu chứng</span>
                                </a>
                            </li>
                            <li>
                                <a href="#herbs">
                                    <span>🌿</span>
                                    <span>${herbs.length} thảo dược</span>
                                </a>
                            </li>
                            <li>
                                <a href="#medicines">
                                    <span>💊</span>
                                    <span>${medicines.length} thuốc tây</span>
                                </a>
                            </li>
                        </ul>
                    </div>

                    <div class="sidebar-card">
                        <h3>🔗 Liên kết nhanh</h3>
                        <ul class="quick-links">
                            <li>
                                <a href="benh.html">
                                    <span>📋</span>
                                    <span>Tất cả bệnh</span>
                                </a>
                            </li>
                            <li>
                                <a href="treatments/thao-duoc.html">
                                    <span>🌿</span>
                                    <span>Tất cả thảo dược</span>
                                </a>
                            </li>
                            <li>
                                <a href="treatments/thuoc-tay.html">
                                    <span>💊</span>
                                    <span>Tất cả thuốc tây</span>
                                </a>
                            </li>
                        </ul>
                    </div>

                    <div class="warning-box">
                        <h4>⚠️ Lưu ý quan trọng</h4>
                        <p>Thông tin trên website chỉ mang tính chất tham khảo. Vui lòng tham khảo ý kiến bác sĩ hoặc chuyên gia y tế trước khi sử dụng bất kỳ phương pháp điều trị nào.</p>
                    </div>
                </aside>
            </div>
        </main>
    `;

    pageContent.innerHTML = html;
}

// Show error
function showError(message) {
    pageContent.innerHTML = `
        <div class="container" style="padding: 100px 20px; text-align: center;">
            <div style="font-size: 4rem; margin-bottom: 20px;">😔</div>
            <h2 style="color: #1e293b; margin-bottom: 10px;">Không thể tải thông tin</h2>
            <p style="color: #64748b; margin-bottom: 30px;">${message}</p>
            <a href="benh.html" style="display: inline-flex; align-items: center; gap: 8px; padding: 12px 24px; background: #0a991d; color: white; text-decoration: none; border-radius: 10px; font-weight: 500;">
                ← Quay lại danh sách bệnh
            </a>
        </div>
    `;
}

// Utility functions
function escapeHtml(text) {
    if (!text) return '';
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}

function truncateText(text, maxLength) {
    if (!text) return '';
    if (text.length <= maxLength) return escapeHtml(text);
    return escapeHtml(text.substring(0, maxLength)) + '...';
}
