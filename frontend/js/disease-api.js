

const isLocalhost = window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1';
const API_BASE_URL = isLocalhost
    ? 'http://localhost:3000/api'
    : 'https://herbmed-production.up.railway.app/api';

// ====== DISEASE APIs ======

/**
 * Disease List
 * @param {Object} options - { nhombenh_sk, search, limit, skip }
 */
async function getDiseases(options = {}) {
    try {
        const params = new URLSearchParams();
        if (options.nhombenh_sk) params.append('nhombenh_sk', options.nhombenh_sk);
        if (options.search) params.append('search', options.search);
        if (options.limit) params.append('limit', options.limit);
        if (options.skip) params.append('skip', options.skip);

        const url = `${API_BASE_URL}/benh${params.toString() ? '?' + params.toString() : ''}`;
        const res = await fetch(url);
        const data = await res.json();

        if (!res.ok) {
            throw new Error(data.message || 'Lỗi khi lấy danh sách bệnh');
        }

        return data;
    } catch (err) {
        console.error('getDiseases error:', err);
        throw err;
    }
}

/**
 * Disease ID or benh_sk
 * @param {string|number} id - MongoDB _id or benh_sk
 */
async function getDiseaseById(id) {
    try {
        const res = await fetch(`${API_BASE_URL}/benh/${id}`);
        const data = await res.json();

        if (!res.ok) {
            throw new Error(data.message || 'Lỗi khi lấy thông tin bệnh');
        }

        return data;
    } catch (err) {
        console.error('getDiseaseById error:', err);
        throw err;
    }
}

/**
 * Create new disease
 * @param {Object} diseaseData - { ten_benh, nhombenh_sk, trieu_chung }
 */
async function createDisease(diseaseData) {
    try {
        const res = await fetch(`${API_BASE_URL}/benh`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(diseaseData)
        });

        const data = await res.json();

        if (!res.ok) {
            throw new Error(data.message || 'Lỗi khi tạo bệnh');
        }

        return data;
    } catch (err) {
        console.error('createDisease error:', err);
        throw err;
    }
}

/**
 * Update disease
 * @param {string|number} id - MongoDB _id or benh_sk
 * @param {Object} diseaseData - { ten_benh, nhombenh_sk, trieu_chung }
 */
async function updateDisease(id, diseaseData) {
    try {
        const res = await fetch(`${API_BASE_URL}/benh/${id}`, {
            method: 'PUT',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(diseaseData)
        });

        const data = await res.json();

        if (!res.ok) {
            throw new Error(data.message || 'Lỗi khi cập nhật bệnh');
        }

        return data;
    } catch (err) {
        console.error('updateDisease error:', err);
        throw err;
    }
}

/**
 * Delete disease
 * @param {string|number} id - MongoDB _id or benh_sk
 */
async function deleteDisease(id) {
    try {
        const res = await fetch(`${API_BASE_URL}/benh/${id}`, {
            method: 'DELETE'
        });

        const data = await res.json();

        if (!res.ok) {
            throw new Error(data.message || 'Lỗi khi xóa bệnh');
        }

        return data;
    } catch (err) {
        console.error('deleteDisease error:', err);
        throw err;
    }
}

// ====== DISEASE GROUP APIs ======

/**
 * Disease group list
 */
async function getDiseaseGroups() {
    try {
        const res = await fetch(`${API_BASE_URL}/nhombenh`);
        const data = await res.json();

        if (!res.ok) {
            throw new Error(data.message || 'Lỗi khi lấy danh sách nhóm bệnh');
        }

        return data;
    } catch (err) {
        console.error('getDiseaseGroups error:', err);
        throw err;
    }
}

/**
 * Create new group disease
 * @param {string} nhom_benh - Group disease name
 */
async function createDiseaseGroup(nhom_benh) {
    try {
        const res = await fetch(`${API_BASE_URL}/nhombenh`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ nhom_benh })
        });

        const data = await res.json();

        if (!res.ok) {
            throw new Error(data.message || 'Lỗi khi tạo nhóm bệnh');
        }

        return data;
    } catch (err) {
        console.error('createDiseaseGroup error:', err);
        throw err;
    }
}

// ====== EXPORT for use in other files ======
// If use module: export { getDiseases, getDiseaseById, createDisease, updateDisease, deleteDisease, getDiseaseGroups, createDiseaseGroup };

// Example usage:
/*
// Disease List
const diseases = await getDiseases({ search: 'cảm cúm', limit: 10 });
console.log(diseases);

// New Disease
const newDisease = await createDisease({
    ten_benh: 'Cảm cúm',
    nhombenh_sk: 1,
    trieu_chung: ['Sốt', 'Ho', 'Nhức đầu']
});
console.log(newDisease);

// Update Disease
const updated = await updateDisease(1, {
    ten_benh: 'Cảm cúm thông thường',
    trieu_chung: ['Sốt nhẹ', 'Ho khan', 'Nhức đầu', 'Mệt mỏi']
});
console.log(updated);

// Delete Disease
await deleteDisease(1);
*/
