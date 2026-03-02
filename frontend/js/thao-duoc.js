

const API_BASE = window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1'
    ? 'http://localhost:3000/api'
    : 'https://herbmed-production.up.railway.app/api';


let herbs = [];
let filteredHerbs = [];
let currentPage = 1;
const itemsPerPage = 12;

// Image mapping for herbs - tên thảo dược (lowercase) -> file ảnh
const herbImages = {
    'atiso': 'atiso.jpg',
    'bạc hà': 'lá bạc hà.jpg',
    'bạch bộ': 'cay-bach-bo-la-gi-nhung-cong-dung-tuyet-voi-cua-cay-bach-bo-202205120841437985.jpg',
    'bồ công anh': 'Bo_cong_anh_1_0a4555542e.webp',
    'cam thảo': 'cam thảo bắc.jpg',
    'cam thảo bắc': 'cam thảo bắc.jpg',
    'cúc hoa': 'cúc hoa.jpg',
    'diếp cá': 'diếp cá.jpg',
    'dây gắm': 'dây gắm.jpg',
    'dây thìa canh': 'dây thìa canh.jpg',
    'đinh hương': 'đinh hương.jpg',
    'đương quy': 'đương quy.jpg',
    'đỗ trọng': 'đỗ trọng.jpg',
    'giảo cổ lam': 'giảo cổ lam.jpg',
    'gừng': 'ảnh gừng tươi.webp',
    'hoa hòe': 'hoa hòe.webp',
    'hoàng kỳ': 'hoàng kỳ.jpg',
    'huyết giác': 'huyết giác.jpg',
    'huyền sâm': 'huyền sâm.jpg',
    'kim ngân hoa': 'kim ngân hoa.jpg',
    'kim tiền thảo': 'kim tiền thảo.jpg',
    'ké đầu ngựa': 'ké đầu ngựa.jpg',
    'linh chi': 'linh chi.jpg',
    'lá ổi': 'lá ổi non.jpg',
    'lạc tiên': 'lạc tiên.jpg',
    'mạch nha': 'mach-nha-2.jpg',
    'mè đen': 'mè đen.jpg',
    'mộc hương': 'mộc hương.webp',
    'nghệ': 'nghệ vàng.jpg',
    'nghệ vàng': 'nghệ vàng.jpg',
    'ngưu tất': 'ngưu tất.jpg',
    'ngải cứu': 'ngải cứu.jpg',
    'nha đam': 'nha đam.jpeg',
    'nhân sâm': 'nhân sâm.jpg',
    'rau sam': 'rau sam.jpg',
    'riềng': 'riềng tươi.jpg',
    'sơn tra': 'sơn tra.jpg',
    'tân di hoa': 'Tân di hoa.jpg',
    'tràm': 'tinh dầu tràm.jpg',
    'trạch tả': 'trạch tả.jpg',
    'tỳ bà diệp': 'tỳ bà diệp.jpg'
};

// Default herb image
const defaultHerbImage = '../../assets/images/herbs/lá bạc hà.jpg';

// Get image for herb
function getImageForHerb(herbName) {
    const name = herbName.toLowerCase().trim();

    // Direct match
    if (herbImages[name]) {
        return `../../assets/images/herbs/${herbImages[name]}`;
    }

    // Partial match
    for (const [key, imagePath] of Object.entries(herbImages)) {
        if (name.includes(key) || key.includes(name)) {
            return `../../assets/images/herbs/${imagePath}`;
        }
    }

    return defaultHerbImage;
}

const herbContainer = document.getElementById('herbContainer');
const resultCount = document.getElementById('resultCount');
const searchInput = document.getElementById('herbSearch');
const paginationContainer = document.getElementById('pagination');

document.addEventListener('DOMContentLoaded', async () => {
    await loadHerbs();
    setupEventListeners();
});

async function loadHerbs() {
    try {
        showLoading();
        const response = await fetch(`${API_BASE}/thaoduoc?limit=1000`);
        const data = await response.json();
        herbs = data.data || [];
        filteredHerbs = [...herbs];
        renderHerbs();
    } catch (error) {
        console.error('Error loading herbs:', error);
        showError('Không thể tải dữ liệu');
    }
}

function setupEventListeners() {
    searchInput.addEventListener('input', debounce(() => {
        const searchTerm = searchInput.value.toLowerCase().trim();
        filteredHerbs = herbs.filter(herb =>
            herb.thao_duoc.toLowerCase().includes(searchTerm)
        );
        currentPage = 1;
        renderHerbs();
    }, 300));
}

function renderHerbs() {
    const start = (currentPage - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const pageItems = filteredHerbs.slice(start, end);

    resultCount.textContent = filteredHerbs.length;

    if (pageItems.length === 0) {
        showEmpty();
        return;
    }

    const html = `
        <div class="herb-grid">
            ${pageItems.map(herb => {
        // Prioritize image_url from database, then fallback to mapping
        let imageUrl;
        if (herb.image_url) {
            imageUrl = herb.image_url.startsWith('http') ? herb.image_url : `../../assets/images/herbs/${herb.image_url}`;
        } else {
            imageUrl = getImageForHerb(herb.thao_duoc);
        }
        return `
                <a href="thao-duoc-chi-tiet.html?id=${herb.thaoduoc_sk}" class="herb-card">
                    <div class="herb-card-header">
                        <div class="herb-icon">
                            <img src="${imageUrl}" alt="${escapeHtml(herb.thao_duoc)}" onerror="this.src='${defaultHerbImage}'">
                        </div>
                        <div class="herb-title">
                            <h3>${escapeHtml(herb.thao_duoc)}</h3>
                        </div>
                    </div>
                    <div class="herb-card-body">
                        <p>${escapeHtml(herb.tong_hop_thao_duoc || 'Xem chi tiết về công dụng và cách sử dụng')}</p>
                        <div class="herb-tags">
                            <span class="herb-tag">Y học cổ truyền</span>
                            ${herb.khuyen_cao ? '<span class="herb-tag">Có khuyến cáo</span>' : ''}
                        </div>
                    </div>
                </a>
            `}).join('')}
        </div>
    `;

    herbContainer.innerHTML = html;
    renderPagination();
}

function renderPagination() {
    const totalPages = Math.ceil(filteredHerbs.length / itemsPerPage);

    if (totalPages <= 1) {
        paginationContainer.innerHTML = '';
        return;
    }

    let html = `<button class="page-btn" ${currentPage === 1 ? 'disabled' : ''} onclick="goToPage(${currentPage - 1})">← Trước</button>`;

    for (let i = 1; i <= Math.min(totalPages, 7); i++) {
        html += `<button class="page-btn ${i === currentPage ? 'active' : ''}" onclick="goToPage(${i})">${i}</button>`;
    }

    html += `<button class="page-btn" ${currentPage === totalPages ? 'disabled' : ''} onclick="goToPage(${currentPage + 1})">Sau →</button>`;

    paginationContainer.innerHTML = html;
}

function goToPage(page) {
    currentPage = page;
    renderHerbs();
    window.scrollTo({ top: 400, behavior: 'smooth' });
}

function showLoading() {
    herbContainer.innerHTML = `
        <div class="loading">
            <div class="loading-spinner"></div>
            <p>Đang tải dữ liệu...</p>
        </div>
    `;
}

function showEmpty() {
    herbContainer.innerHTML = `
        <div class="empty-state">
            <div class="icon">🌿</div>
            <h3>Không tìm thấy kết quả</h3>
            <p>Thử tìm kiếm với từ khóa khác</p>
        </div>
    `;
    paginationContainer.innerHTML = '';
}

function showError(message) {
    herbContainer.innerHTML = `
        <div class="empty-state">
            <div class="icon">⚠️</div>
            <h3>Lỗi kết nối</h3>
            <p>${message}</p>
        </div>
    `;
}

function debounce(func, wait) {
    let timeout;
    return function (...args) {
        clearTimeout(timeout);
        timeout = setTimeout(() => func(...args), wait);
    };
}

function escapeHtml(text) {
    if (!text) return '';
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}

window.goToPage = goToPage;
