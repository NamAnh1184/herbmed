// =====================================================
// DISEASE-ADMIN.JS - Disease Management Page Logic
// =====================================================

let diseaseGroups = [];
let searchTimeout = null;

// Initialize page
document.addEventListener('DOMContentLoaded', () => {
    loadDiseaseGroups();
    loadDiseases();

    // Image preview on input
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

    // If it's just a filename, prepend the assets path
    let fullUrl = url;
    if (!url.startsWith('http') && !url.startsWith('/') && !url.startsWith('../')) {
        fullUrl = `../../assets/images/diseases/${url}`;
    }

    previewImg.src = fullUrl;
    previewImg.style.display = 'block';
    previewImg.onerror = () => {
        previewImg.style.display = 'none';
    };
}

// ====== LOAD DATA ======

async function loadDiseaseGroups() {
    try {
        const result = await getDiseaseGroups();
        diseaseGroups = result.data || [];

        // Populate filter dropdown
        const filterSelect = document.getElementById('filterGroup');
        const modalSelect = document.getElementById('nhomBenhSelect');

        diseaseGroups.forEach(group => {
            const option1 = new Option(group.nhom_benh, group.nhombenh_sk);
            const option2 = new Option(group.nhom_benh, group.nhombenh_sk);
            filterSelect.appendChild(option1);
            modalSelect.appendChild(option2);
        });
    } catch (err) {
        console.error('Error loading disease groups:', err);
    }
}

async function loadDiseases() {
    const tbody = document.getElementById('diseaseTableBody');
    const search = document.getElementById('searchDisease').value;
    const nhombenh_sk = document.getElementById('filterGroup').value;

    tbody.innerHTML = `
        <tr>
            <td colspan="5" class="empty-state">
                <span>⏳</span>
                <p>Đang tải...</p>
            </td>
        </tr>
    `;

    try {
        const result = await getDiseases({ search, nhombenh_sk, limit: 100 });
        const diseases = result.data || [];

        if (diseases.length === 0) {
            tbody.innerHTML = `
                <tr>
                    <td colspan="5" class="empty-state">
                        <span>📋</span>
                        <p>Chưa có bệnh nào${search ? ' phù hợp với tìm kiếm' : ''}</p>
                    </td>
                </tr>
            `;
            return;
        }

        tbody.innerHTML = '';

        for (const disease of diseases) {
            // Get disease details with symptoms
            let symptoms = [];
            let groupName = '';

            try {
                const detail = await getDiseaseById(disease.benh_sk);
                symptoms = detail.trieu_chung || [];
                groupName = detail.nhom_benh || '';
            } catch (e) {
                // Fallback
                const group = diseaseGroups.find(g => g.nhombenh_sk === disease.nhombenh_sk);
                groupName = group?.nhom_benh || '';
            }

            const symptomsHtml = symptoms.slice(0, 3).map(s =>
                `<span class="symptom-tag">${s.trieu_chung || s}</span>`
            ).join('') + (symptoms.length > 3 ? `<span class="symptom-tag">+${symptoms.length - 3}</span>` : '');

            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${disease.benh_sk}</td>
                <td class="disease-name">${disease.ten_benh}</td>
                <td>
                    <div class="symptoms-list">
                        ${symptomsHtml || '<span style="color:#999">Chưa có</span>'}
                    </div>
                </td>
                <td>
                    ${groupName ? `<span class="disease-group">${groupName}</span>` : '<span style="color:#999">--</span>'}
                </td>
                <td>
                    <div class="action-btns">
                        <button class="btn-edit" onclick="openEditModal(${disease.benh_sk})">✏️ Sửa</button>
                        <button class="btn-delete" onclick="confirmDelete(${disease.benh_sk}, '${disease.ten_benh.replace(/'/g, "\\'")}')">🗑️ Xóa</button>
                    </div>
                </td>
            `;
            tbody.appendChild(row);
        }
    } catch (err) {
        console.error('Error loading diseases:', err);
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

// ====== SEARCH ======

function debounceSearch() {
    clearTimeout(searchTimeout);
    searchTimeout = setTimeout(() => {
        loadDiseases();
    }, 300);
}

// ====== MODAL ======

function openAddModal() {
    document.getElementById('modalTitle').textContent = 'Thêm Bệnh Mới';
    document.getElementById('diseaseId').value = '';
    document.getElementById('tenBenh').value = '';
    document.getElementById('nhomBenhSelect').value = '';
    document.getElementById('trieuChung').value = '';
    document.getElementById('nguyenNhan').value = '';
    document.getElementById('phongNgua').value = '';
    document.getElementById('imageUrl').value = '';
    document.getElementById('previewImg').style.display = 'none';
    document.getElementById('diseaseModal').classList.add('active');
}

async function openEditModal(benhSk) {
    try {
        const disease = await getDiseaseById(benhSk);

        document.getElementById('modalTitle').textContent = 'Chỉnh Sửa Bệnh';
        document.getElementById('diseaseId').value = benhSk;
        document.getElementById('tenBenh').value = disease.ten_benh || '';
        document.getElementById('nhomBenhSelect').value = disease.nhombenh_sk || '';

        // Convert symptoms to text
        const symptoms = disease.trieu_chung || [];
        const symptomsText = symptoms.map(s => s.trieu_chung || s).join('\n');
        document.getElementById('trieuChung').value = symptomsText;

        // Load nguyen_nhan and phong_ngua
        document.getElementById('nguyenNhan').value = disease.nguyen_nhan || '';
        document.getElementById('phongNgua').value = disease.phong_ngua || '';

        // Load image URL
        const imageUrl = disease.image_url || '';
        document.getElementById('imageUrl').value = imageUrl;
        updateImagePreview(imageUrl);

        document.getElementById('diseaseModal').classList.add('active');
    } catch (err) {
        showMessage('Lỗi khi tải thông tin bệnh', 'error');
    }
}

function closeModal() {
    document.getElementById('diseaseModal').classList.remove('active');
}

// ====== SAVE ======

async function saveDisease() {
    const diseaseId = document.getElementById('diseaseId').value;
    const tenBenh = document.getElementById('tenBenh').value.trim();
    const nhomBenhSk = document.getElementById('nhomBenhSelect').value;
    const trieuChungText = document.getElementById('trieuChung').value.trim();

    if (!tenBenh) {
        showMessage('Vui lòng nhập tên bệnh', 'error');
        return;
    }

    // Parse symptoms (one per line)
    const trieuChung = trieuChungText
        .split('\n')
        .map(s => s.trim())
        .filter(s => s.length > 0);

    const data = {
        ten_benh: tenBenh,
        nhombenh_sk: nhomBenhSk ? parseInt(nhomBenhSk) : null,
        trieu_chung: trieuChung,
        image_url: document.getElementById('imageUrl').value.trim() || null,
        nguyen_nhan: document.getElementById('nguyenNhan').value.trim() || null,
        phong_ngua: document.getElementById('phongNgua').value.trim() || null
    };

    // Save scroll position before saving
    const scrollPosition = window.scrollY;

    try {
        if (diseaseId) {
            // Update
            await updateDisease(diseaseId, data);
            showMessage('Cập nhật bệnh thành công!', 'success');
        } else {
            // Create
            await createDisease(data);
            showMessage('Thêm bệnh mới thành công!', 'success');
        }

        closeModal();
        await loadDiseases();

        // Restore scroll position after reload
        setTimeout(() => {
            window.scrollTo(0, scrollPosition);
        }, 100);
    } catch (err) {
        showMessage(err.message || 'Có lỗi xảy ra', 'error');
    }
}

// ====== DELETE ======

async function confirmDelete(benhSk, tenBenh) {
    if (!confirm(`Bạn có chắc muốn xóa bệnh "${tenBenh}"?`)) {
        return;
    }

    try {
        await deleteDisease(benhSk);
        showMessage('Xóa bệnh thành công!', 'success');
        loadDiseases();
    } catch (err) {
        showMessage(err.message || 'Lỗi khi xóa bệnh', 'error');
    }
}

// ====== MESSAGE ======

function showMessage(text, type = 'success') {
    const msgBox = document.getElementById('messageBox');
    msgBox.textContent = text;
    msgBox.className = `message ${type}`;
    msgBox.style.display = 'block';

    setTimeout(() => {
        msgBox.style.display = 'none';
    }, 4000);
}
