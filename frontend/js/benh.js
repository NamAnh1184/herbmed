

// API Base URL
const API_BASE = window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1'
    ? 'http://localhost:3000/api'
    : 'https://herbmed-production.up.railway.app/api';


// State
let diseases = [];
let categories = [];
let currentPage = 1;
const itemsPerPage = 12;
let filteredDiseases = [];

// Icon mapping cho các nhóm bệnh (fallback)
const categoryIcons = {
    'Hô hấp': '🫁',
    'Tiêu hóa': '🍽️',
    'Mắt': '👁️',
    'Nội tiết': '🧬',
    'Tim mạch': '❤️',
    'Tâm lý': '🧠',
    'Cơ xương khớp': '🦴',
    'Sinh dục': '👫',
    'Da liễu': '🧴',
    'Răng hàm mặt': '🦷',
    'default': '🏥'
};

// Image mapping for diseases - based on disease name (lowercase, no accents for comparison)
const diseaseImages = {
    'cảm lạnh': '20200824_Cam-lanh-1.jpg',
    'cúm': 'benh_cum_nguyen_nhan_trieu_chung_dien_hinh_va_cach_dieu_tri_1_d61a184486.webp',
    'viêm xoang': 'viem-xoang-cap-tinh-khien-ban-met-moi.jpg',
    'viêm phế quản cấp': 'viem-phe-quan-cap-168749236860531427038.jpg',
    'viêm phổi': 'hinh-anh-viem-phoi.jpg',
    'viêm mũi dị ứng': 'tan-di-1.jpg',
    'viêm dạ dày': 'viem-da-day-ta-trang-1-800x450-1.jpg',
    'trào ngược dạ dày thực quản': '141309-viem-loet-da-day-min.jpg',
    'tiêu chảy': 'tieu-chay-9-1650786380993341820289.webp',
    'táo bón': '20211026_tieu-hoa-kem-2.jpg',
    'tiêu hóa kém': '20211026_tieu-hoa-kem-5.png',
    'hội chứng ruột kích thích': 'hoi-chung-ruot-kich-thich-1-800x450.jpg',
    'viêm kết mạc': 'viem_ket_mac.webp',
    'khô mắt': '548_kho_mat_4863_62bf_large_7346d063ef.png',
    'đái tháo đường': 'tong-quan-ve-benh-tieu-duong-loai-2.jpg',
    'béo phì': '20190808_030135_986366_beo_phi_max_1800x1800_jpg_ccd654e690.jpg',
    'rối loạn lipid máu': 'dieu-tri-roi-loan-lipid-mau-3.avif',
    'tăng huyết áp': 'tang-huyet-ap-la-yeu-to-nguy-co-tim-mach.jpg',
    'thiếu máu': 'thieu-mau-1-1728564287705943091287.webp',
    'trầm cảm': 'met-moi-do-tram-cam-1-16838079237991549096700.webp',
    'lo âu': 'roi-loan-lo-au-1-16338721044352141303645-0-0-403-645-crop-1633872110279329906487.webp',
    'mất ngủ': 'mat-ngu-la-benh-ly-gi.jpeg',
    'căng thẳng': 'Căng thẳng.jpg',
    'đau nửa đầu': 'dau-nua-dau.jpg',
    'thoái hóa khớp': 'thoai-hoa-xuong-khop-1678702535211462256895.webp',
    'viêm khớp dạng thấp': '20220307_233942_263041_5_max_1800x1800_jpg_f10cfa8763.jpg',
    'loãng xương': 'loang-xuong-1.jpg.webp',
    'gout': 'cach_chua_benh_gut_o_chan_1_c27694535a.webp',
    'đau lưng căng cơ': 'cang_co_lung_1_8c103b3e55.jpg',
    'hội chứng buồng trứng đa nang': '2V6wpk6P-buong-trung-da-nang-1.jpg',
    'vô sinh': 'vô sinh.jpg',
    'phì đại tuyến tiền liệt': 'phi-dai-tien-liet-tuyen-1-min-1712626128541-17126261289361363815795.webp',
    'mụn trứng cá': '20200113_093629_396219_mun_trung_ca_max_1800x1800_jpg_00652a6581.jpg',
    'dị ứng da': 'benh-di-ung-da-1.jpg',
    'nấm da': 'benh_nam_da_1_fe48c0e3e7.webp',
    'zona': 'zona_than_kinh_co_phai_la_benh_di_truyen_01_84a1ec14b3.jpg',
    'viêm lợi': '20201001_viem-loi-1.jpg',
    'đau răng': '20220415_cach-tri-nhuc-rang-1.jpg',
    'hôi miệng': 'benh-hoi-mieng-va-nhung-dieu-can-biet-1.jpg',
    'gàu': 'gau-1726819772320295330309.webp',
    'bỏng': 'bong-1.webp',
    'buồn nôn': '11-buon-non-shutterstock-16983835995071395011673.webp',
    'sỏi thận': 'scBFnxDl-soi-than-1.jpg',
    'say tàu xe': 'say-tau-xe-1703838249267170577528.webp',
    'đau bụng kinh': 'nuvuong211.webp',
    'hỗ trợ miễn dịch': 'Miễn Dịch.webp'
};

// Default disease image
const defaultDiseaseImage = '../assets/images/diseases/08108432-traditional-medicinesok-9379-1588043544.jpg';

// DOM Elements
const diseaseContainer = document.getElementById('diseaseContainer');
const resultCount = document.getElementById('resultCount');
const searchInput = document.getElementById('diseaseSearch');
const categoryFilter = document.getElementById('categoryFilter');
const paginationContainer = document.getElementById('pagination');

// Get URL parameters
function getUrlParams() {
    const params = new URLSearchParams(window.location.search);
    return {
        nhombenh_sk: params.get('nhombenh_sk'),
        search: params.get('search')
    };
}

// Initialize
document.addEventListener('DOMContentLoaded', async () => {
    await loadCategories();

    // Check for URL parameters and apply filters
    const urlParams = getUrlParams();

    // If category filter from URL, set it
    if (urlParams.nhombenh_sk) {
        categoryFilter.value = urlParams.nhombenh_sk;
    }

    // If search term from URL, set it
    if (urlParams.search) {
        searchInput.value = urlParams.search;
    }

    await loadDiseases();

    // If we have URL params, apply filter immediately after loading
    if (urlParams.nhombenh_sk || urlParams.search) {
        await filterDiseases();
    }

    setupEventListeners();
});

// Load nhóm bệnh
async function loadCategories() {
    try {
        const response = await fetch(`${API_BASE}/nhombenh`);
        const data = await response.json();
        categories = data.data || [];

        // Populate dropdown
        categories.forEach(cat => {
            const option = document.createElement('option');
            option.value = cat.nhombenh_sk;
            option.textContent = cat.nhom_benh;
            categoryFilter.appendChild(option);
        });
    } catch (error) {
        console.error('Error loading categories:', error);
    }
}

// Load disease list
async function loadDiseases() {
    try {
        showLoading();

        const response = await fetch(`${API_BASE}/benh?limit=1000`);
        const data = await response.json();
        diseases = data.data || [];
        filteredDiseases = [...diseases];

        renderDiseases();
    } catch (error) {
        console.error('Error loading diseases:', error);
        showError('Không thể tải dữ liệu. Vui lòng kiểm tra kết nối server.');
    }
}

// Setup event listeners
function setupEventListeners() {
    // Search
    searchInput.addEventListener('input', debounce(() => {
        filterDiseases();
    }, 300));

    // Category filter
    categoryFilter.addEventListener('change', () => {
        filterDiseases();
    });

    // View toggle
    document.querySelectorAll('.view-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            document.querySelectorAll('.view-btn').forEach(b => b.classList.remove('active'));
            btn.classList.add('active');

            const grid = document.querySelector('.disease-grid');
            if (grid) {
                if (btn.dataset.view === 'list') {
                    grid.style.gridTemplateColumns = '1fr';
                } else {
                    grid.style.gridTemplateColumns = 'repeat(auto-fill, minmax(320px, 1fr))';
                }
            }
        });
    });
}

// Filter diseases
async function filterDiseases() {
    const searchTerm = searchInput.value.toLowerCase().trim();
    const categoryId = categoryFilter.value;

    currentPage = 1;

    // If category selected, fetch from API with filter
    if (categoryId) {
        try {
            showLoading();
            const response = await fetch(`${API_BASE}/benh?nhombenh_sk=${categoryId}&limit=1000`);
            const data = await response.json();
            filteredDiseases = data.data || [];
        } catch (error) {
            console.error('Error filtering:', error);
            filteredDiseases = [];
        }
    } else {
        filteredDiseases = [...diseases];
    }

    // Apply search filter
    if (searchTerm) {
        filteredDiseases = filteredDiseases.filter(disease =>
            disease.ten_benh.toLowerCase().includes(searchTerm)
        );
    }

    renderDiseases();
}

// Render diseases
function renderDiseases() {
    const start = (currentPage - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const pageItems = filteredDiseases.slice(start, end);

    resultCount.textContent = filteredDiseases.length;

    if (pageItems.length === 0) {
        showEmpty();
        return;
    }

    const html = `
        <div class="disease-grid">
            ${pageItems.map(disease => createDiseaseCard(disease)).join('')}
        </div>
    `;

    diseaseContainer.innerHTML = html;
    renderPagination();
}

// Create disease card HTML
function createDiseaseCard(disease) {
    const imageUrl = getImageForDisease(disease);
    const categoryName = getCategoryName(disease);

    return `
        <a href="benh-chi-tiet.html?id=${disease.benh_sk}" class="disease-card">
            <div class="card-header">
                <div class="card-icon">
                    <img src="${imageUrl}" alt="${escapeHtml(disease.ten_benh)}" onerror="this.src='${defaultDiseaseImage}'">
                </div>
                <div class="card-title">
                    <h3>${escapeHtml(disease.ten_benh)}</h3>
                    <span class="category">
                        <span>📁</span> ${categoryName}
                    </span>
                </div>
                <span class="card-arrow">→</span>
            </div>
            <div class="card-body">
                <p>Xem thông tin chi tiết về ${escapeHtml(disease.ten_benh)}, triệu chứng và phương pháp điều trị.</p>
                <div class="card-meta">
                    <span class="meta-item">🌿 Thảo dược</span>
                    <span class="meta-item">💊 Thuốc tây</span>
                </div>
            </div>
        </a>
    `;
}

// Get image for disease based on name or image_url from database
function getImageForDisease(disease) {
    // First check if disease has image_url from database
    if (disease.image_url) {
        // If it's a full URL, use it directly
        if (disease.image_url.startsWith('http')) {
            return disease.image_url;
        }
        // If it's just a filename, prepend the assets path
        return `../assets/images/diseases/${disease.image_url}`;
    }

    // Fallback to mapping by disease name
    const diseaseName = disease.ten_benh.toLowerCase().trim();

    // Direct match
    if (diseaseImages[diseaseName]) {
        return `../assets/images/diseases/${diseaseImages[diseaseName]}`;
    }

    // Partial match - try to find a key that contains or is contained in the disease name
    for (const [key, imagePath] of Object.entries(diseaseImages)) {
        if (diseaseName.includes(key) || key.includes(diseaseName)) {
            return `../assets/images/diseases/${imagePath}`;
        }
    }

    // Return default image
    return defaultDiseaseImage;
}

// Get icon for disease based on category (fallback for emoji)
function getIconForDisease(disease) {
    // Try to match by category name
    for (const cat of categories) {
        if (cat.nhombenh_sk === disease.nhombenh_sk) {
            for (const [key, icon] of Object.entries(categoryIcons)) {
                if (cat.nhom_benh.toLowerCase().includes(key.toLowerCase())) {
                    return icon;
                }
            }
        }
    }
    return categoryIcons.default;
}

// Get category name
function getCategoryName(disease) {
    const category = categories.find(c => c.nhombenh_sk === disease.nhombenh_sk);
    return category ? category.nhom_benh : 'Chưa phân loại';
}

// Render pagination
function renderPagination() {
    const totalPages = Math.ceil(filteredDiseases.length / itemsPerPage);

    if (totalPages <= 1) {
        paginationContainer.innerHTML = '';
        return;
    }

    let html = '';

    // Previous button
    html += `<button class="page-btn" ${currentPage === 1 ? 'disabled' : ''} onclick="goToPage(${currentPage - 1})">← Trước</button>`;

    // Page numbers
    const maxVisible = 5;
    let startPage = Math.max(1, currentPage - Math.floor(maxVisible / 2));
    let endPage = Math.min(totalPages, startPage + maxVisible - 1);

    if (endPage - startPage < maxVisible - 1) {
        startPage = Math.max(1, endPage - maxVisible + 1);
    }

    if (startPage > 1) {
        html += `<button class="page-btn" onclick="goToPage(1)">1</button>`;
        if (startPage > 2) {
            html += `<span class="page-btn" disabled>...</span>`;
        }
    }

    for (let i = startPage; i <= endPage; i++) {
        html += `<button class="page-btn ${i === currentPage ? 'active' : ''}" onclick="goToPage(${i})">${i}</button>`;
    }

    if (endPage < totalPages) {
        if (endPage < totalPages - 1) {
            html += `<span class="page-btn" disabled>...</span>`;
        }
        html += `<button class="page-btn" onclick="goToPage(${totalPages})">${totalPages}</button>`;
    }

    // Next button
    html += `<button class="page-btn" ${currentPage === totalPages ? 'disabled' : ''} onclick="goToPage(${currentPage + 1})">Sau →</button>`;

    paginationContainer.innerHTML = html;
}

// Go to page
function goToPage(page) {
    currentPage = page;
    renderDiseases();
    window.scrollTo({ top: 400, behavior: 'smooth' });
}

// Show loading
function showLoading() {
    diseaseContainer.innerHTML = `
        <div class="loading">
            <div class="loading-spinner"></div>
            <p>Đang tải dữ liệu...</p>
        </div>
    `;
    paginationContainer.innerHTML = '';
}

// Show empty state
function showEmpty() {
    diseaseContainer.innerHTML = `
        <div class="empty-state">
            <div class="icon">🔍</div>
            <h3>Không tìm thấy kết quả</h3>
            <p>Thử tìm kiếm với từ khóa khác hoặc xóa bộ lọc</p>
        </div>
    `;
    paginationContainer.innerHTML = '';
}

// Show error
function showError(message) {
    diseaseContainer.innerHTML = `
        <div class="empty-state">
            <div class="icon">⚠️</div>
            <h3>Lỗi kết nối</h3>
            <p>${message}</p>
            <button onclick="loadDiseases()" style="margin-top: 20px; padding: 12px 24px; background: #0a991d; color: white; border: none; border-radius: 8px; cursor: pointer;">
                Thử lại
            </button>
        </div>
    `;
}

// Utility functions
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

function escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}

// Make goToPage globally accessible
window.goToPage = goToPage;
