// =====================================================
// THUOCTAY-ADMIN.JS - Medicine Management Page Logic
// =====================================================

const isLocalhost = window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1';
const API_BASE_URL = isLocalhost
    ? 'http://localhost:3000/api'
    : 'https://herbmed-production.up.railway.app/api';
let searchTimeout = null;

// Initialize page
document.addEventListener('DOMContentLoaded', () => {
    loadMedicines();

    // Image preview
    document.getElementById('imageUrl').addEventListener('input', (e) => {
        updateImagePreview(e.target.value);
    });
});

// Update image preview
function updateImagePreview(url) {
    const previewImg = document.getElementById('previewImg');
    if (!url || url.trim() === '') {
        previewImg.style.display = 'none';
        return;
    }

    let fullUrl = url;
    if (!url.startsWith('http') && !url.startsWith('/') && !url.startsWith('../')) {
        fullUrl = `../../assets/images/medicines/${url}`;
    }

    previewImg.src = fullUrl;
    previewImg.style.display = 'block';
    previewImg.onerror = () => { previewImg.style.display = 'none'; };
}

// Load medicines
async function loadMedicines() {
    const tbody = document.getElementById('medicineTableBody');
    const search = document.getElementById('searchMedicine').value;

    tbody.innerHTML = `
        <tr>
            <td colspan="5" class="empty-state">
                <span>⏳</span>
                <p>Đang tải...</p>
            </td>
        </tr>
    `;

    try {
        let url = `${API_BASE_URL}/thuoctay?limit=100`;
        if (search) url += `&search=${encodeURIComponent(search)}`;

        const res = await fetch(url);
        const data = await res.json();
        const medicines = data.data || [];

        if (medicines.length === 0) {
            tbody.innerHTML = `
                <tr>
                    <td colspan="5" class="empty-state">
                        <span>💊</span>
                        <p>Chưa có thuốc tây nào${search ? ' phù hợp với tìm kiếm' : ''}</p>
                    </td>
                </tr>
            `;
            return;
        }

        tbody.innerHTML = '';
        for (const med of medicines) {
            const imageUrl = med.image_url ?
                (med.image_url.startsWith('http') ? med.image_url : `../../assets/images/medicines/${med.image_url}`) :
                '../../assets/images/common/medicine-default.png';

            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${med.thuoctay_sk}</td>
                <td><img src="${imageUrl}" class="medicine-image" onerror="this.src='../../assets/images/common/medicine-default.png'"></td>
                <td class="medicine-name">${med.thuoc_tay || ''}</td>
                <td>${(med.hoat_chat || '').substring(0, 100)}${(med.hoat_chat || '').length > 100 ? '...' : ''}</td>
                <td>
                    <div class="action-btns">
                        <button class="btn-edit" onclick="openEditModal(${med.thuoctay_sk})">✏️ Sửa</button>
                        <button class="btn-delete" onclick="confirmDelete(${med.thuoctay_sk}, '${(med.thuoc_tay || '').replace(/'/g, "\\'")}')">🗑️ Xóa</button>
                    </div>
                </td>
            `;
            tbody.appendChild(row);
        }
    } catch (err) {
        console.error('Error loading medicines:', err);
        tbody.innerHTML = `
            <tr>
                <td colspan="5" class="empty-state">
                    <span>❌</span>
                    <p>Lỗi tải dữ liệu. Kiểm tra backend đã chạy chưa.</p>
                </td>
            </tr>
        `;
    }
}

// Debounce search
function debounceSearch() {
    clearTimeout(searchTimeout);
    searchTimeout = setTimeout(() => loadMedicines(), 300);
}

// Modal functions
function openAddModal() {
    document.getElementById('modalTitle').textContent = 'Thêm Thuốc Tây Mới';
    document.getElementById('medicineId').value = '';
    document.getElementById('thuocTay').value = '';
    document.getElementById('hoatChat').value = '';
    document.getElementById('bietDuoc').value = '';
    document.getElementById('cacThanhPhan').value = '';
    document.getElementById('canhBaoChongChiDinh').value = '';
    document.getElementById('imageUrl').value = '';
    document.getElementById('previewImg').style.display = 'none';
    document.getElementById('medicineModal').classList.add('active');
}

async function openEditModal(id) {
    try {
        const res = await fetch(`${API_BASE_URL}/thuoctay/${id}`);
        const med = await res.json();

        document.getElementById('modalTitle').textContent = 'Chỉnh Sửa Thuốc Tây';
        document.getElementById('medicineId').value = id;
        document.getElementById('thuocTay').value = med.thuoc_tay || '';
        document.getElementById('hoatChat').value = med.hoat_chat || '';
        document.getElementById('bietDuoc').value = med.biet_duoc || '';
        document.getElementById('cacThanhPhan').value = med.cac_thanh_phan_trong_thuoc || '';
        document.getElementById('canhBaoChongChiDinh').value = med.canh_bao_va_chong_chi_dinh || '';
        document.getElementById('imageUrl').value = med.image_url || '';
        updateImagePreview(med.image_url || '');

        document.getElementById('medicineModal').classList.add('active');
    } catch (err) {
        showMessage('Lỗi khi tải thông tin thuốc tây', 'error');
    }
}

function closeModal() {
    document.getElementById('medicineModal').classList.remove('active');
}

// Save medicine
async function saveMedicine() {
    const medicineId = document.getElementById('medicineId').value;
    const thuoc_tay = document.getElementById('thuocTay').value.trim();
    const hoat_chat = document.getElementById('hoatChat').value.trim();
    const biet_duoc = document.getElementById('bietDuoc').value.trim() || null;
    const cac_thanh_phan_trong_thuoc = document.getElementById('cacThanhPhan').value.trim() || null;
    const canh_bao_va_chong_chi_dinh = document.getElementById('canhBaoChongChiDinh').value.trim() || null;
    const image_url = document.getElementById('imageUrl').value.trim() || null;

    if (!thuoc_tay) {
        showMessage('Vui lòng nhập tên thuốc tây', 'error');
        return;
    }

    const data = { thuoc_tay, hoat_chat, biet_duoc, cac_thanh_phan_trong_thuoc, canh_bao_va_chong_chi_dinh, image_url };

    // Save scroll position before saving
    const scrollPosition = window.scrollY;

    try {
        if (medicineId) {
            await fetch(`${API_BASE_URL}/thuoctay/${medicineId}`, {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data)
            });
            showMessage('Cập nhật thuốc tây thành công!', 'success');
        } else {
            await fetch(`${API_BASE_URL}/thuoctay`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data)
            });
            showMessage('Thêm thuốc tây mới thành công!', 'success');
        }

        closeModal();
        await loadMedicines();

        // Restore scroll position after reload
        setTimeout(() => {
            window.scrollTo(0, scrollPosition);
        }, 100);
    } catch (err) {
        showMessage(err.message || 'Có lỗi xảy ra', 'error');
    }
}

// Delete
async function confirmDelete(id, name) {
    if (!confirm(`Bạn có chắc muốn xóa thuốc tây "${name}"?`)) return;

    try {
        await fetch(`${API_BASE_URL}/thuoctay/${id}`, { method: 'DELETE' });
        showMessage('Xóa thuốc tây thành công!', 'success');
        loadMedicines();
    } catch (err) {
        showMessage(err.message || 'Lỗi khi xóa thuốc tây', 'error');
    }
}

// Message
function showMessage(text, type = 'success') {
    const msgBox = document.getElementById('messageBox');
    msgBox.textContent = text;
    msgBox.className = `message ${type}`;
    msgBox.style.display = 'block';
    setTimeout(() => { msgBox.style.display = 'none'; }, 4000);
}
