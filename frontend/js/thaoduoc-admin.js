

const isLocalhost = window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1';
const API_BASE_URL = isLocalhost
    ? 'http://localhost:3000/api'
    : 'https://herbmed-production.up.railway.app/api';
let searchTimeout = null;

// Initialize page
document.addEventListener('DOMContentLoaded', () => {
    loadHerbs();

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
        fullUrl = `../../assets/images/herbs/${url}`;
    }

    previewImg.src = fullUrl;
    previewImg.style.display = 'block';
    previewImg.onerror = () => { previewImg.style.display = 'none'; };
}

// Load herbs
async function loadHerbs() {
    const tbody = document.getElementById('herbTableBody');
    const search = document.getElementById('searchHerb').value;

    tbody.innerHTML = `
        <tr>
            <td colspan="5" class="empty-state">
                <span>⏳</span>
                <p>Đang tải...</p>
            </td>
        </tr>
    `;

    try {
        let url = `${API_BASE_URL}/thaoduoc?limit=100`;
        if (search) url += `&search=${encodeURIComponent(search)}`;

        const res = await fetch(url);
        const data = await res.json();
        const herbs = data.data || [];

        if (herbs.length === 0) {
            tbody.innerHTML = `
                <tr>
                    <td colspan="5" class="empty-state">
                        <span>🌿</span>
                        <p>Chưa có thảo dược nào${search ? ' phù hợp với tìm kiếm' : ''}</p>
                    </td>
                </tr>
            `;
            return;
        }

        tbody.innerHTML = '';
        for (const herb of herbs) {
            const imageUrl = herb.image_url ?
                (herb.image_url.startsWith('http') ? herb.image_url : `../../assets/images/herbs/${herb.image_url}`) :
                '../../assets/images/common/herb-default.png';

            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${herb.thaoduoc_sk}</td>
                <td><img src="${imageUrl}" class="herb-image" onerror="this.src='../../assets/images/common/herb-default.png'"></td>
                <td class="herb-name">${herb.thao_duoc || ''}</td>
                <td>-</td>
                <td>
                    <div class="action-btns">
                        <button class="btn-edit" onclick="openEditModal(${herb.thaoduoc_sk})">✏️ Sửa</button>
                        <button class="btn-delete" onclick="confirmDelete(${herb.thaoduoc_sk}, '${(herb.thao_duoc || '').replace(/'/g, "\\'")}')">🗑️ Xóa</button>
                    </div>
                </td>
            `;
            tbody.appendChild(row);
        }
    } catch (err) {
        console.error('Error loading herbs:', err);
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
    searchTimeout = setTimeout(() => loadHerbs(), 300);
}

// Modal functions
function openAddModal() {
    document.getElementById('modalTitle').textContent = 'Thêm Thảo Dược Mới';
    document.getElementById('herbId').value = '';
    document.getElementById('thaoDuoc').value = '';
    document.getElementById('imageUrl').value = '';
    document.getElementById('previewImg').style.display = 'none';
    document.getElementById('herbModal').classList.add('active');
}

async function openEditModal(id) {
    try {
        const res = await fetch(`${API_BASE_URL}/thaoduoc/${id}`);
        const herb = await res.json();

        document.getElementById('modalTitle').textContent = 'Chỉnh Sửa Thảo Dược';
        document.getElementById('herbId').value = id;
        document.getElementById('thaoDuoc').value = herb.thao_duoc || '';
        document.getElementById('imageUrl').value = herb.image_url || '';
        updateImagePreview(herb.image_url || '');

        document.getElementById('herbModal').classList.add('active');
    } catch (err) {
        showMessage('Lỗi khi tải thông tin thảo dược', 'error');
    }
}

function closeModal() {
    document.getElementById('herbModal').classList.remove('active');
}

// Save herb
async function saveHerb() {
    const herbId = document.getElementById('herbId').value;
    const thao_duoc = document.getElementById('thaoDuoc').value.trim();
    const image_url = document.getElementById('imageUrl').value.trim() || null;

    if (!thao_duoc) {
        showMessage('Vui lòng nhập tên thảo dược', 'error');
        return;
    }

    const data = { thao_duoc, image_url };

    try {
        if (herbId) {
            await fetch(`${API_BASE_URL}/thaoduoc/${herbId}`, {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data)
            });
            showMessage('Cập nhật thảo dược thành công!', 'success');
        } else {
            await fetch(`${API_BASE_URL}/thaoduoc`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data)
            });
            showMessage('Thêm thảo dược mới thành công!', 'success');
        }

        closeModal();
        loadHerbs();
    } catch (err) {
        showMessage(err.message || 'Có lỗi xảy ra', 'error');
    }
}

// Delete
async function confirmDelete(id, name) {
    if (!confirm(`Bạn có chắc muốn xóa thảo dược "${name}"?`)) return;

    try {
        await fetch(`${API_BASE_URL}/thaoduoc/${id}`, { method: 'DELETE' });
        showMessage('Xóa thảo dược thành công!', 'success');
        loadHerbs();
    } catch (err) {
        showMessage(err.message || 'Lỗi khi xóa thảo dược', 'error');
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
