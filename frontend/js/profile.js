// =====================================================
// PROFILE.JS - Handle user profile view and update
// =====================================================

// Get base path for navigation
function getBasePath() {
    const path = window.location.pathname;
    if (path.includes("/pages/auth/")) {
        return "../../";
    } else if (path.includes("/pages/")) {
        return "../";
    }
    return "";
}

// Show message to user
function showMessage(text, type = 'success') {
    const msgBox = document.getElementById('messageBox');
    if (!msgBox) return;

    msgBox.textContent = text;
    msgBox.className = `message ${type}`;
    msgBox.style.display = 'block';

    // Auto hide after 5 seconds
    setTimeout(() => {
        msgBox.style.display = 'none';
    }, 5000);
}

// Load user profile data
async function loadProfile() {
    const userId = localStorage.getItem('userId');
    const loadingEl = document.getElementById('loadingMessage');
    const formEl = document.getElementById('profileForm');

    if (!userId) {
        showMessage('Vui lòng đăng nhập để xem hồ sơ', 'error');
        if (loadingEl) loadingEl.style.display = 'none';
        return;
    }

    try {
        const res = await fetch(`http://localhost:3000/api/profile/${userId}`);
        const data = await res.json();

        if (!res.ok) {
            showMessage(data.message || 'Không thể tải thông tin', 'error');
            if (loadingEl) loadingEl.style.display = 'none';
            return;
        }

        // Fill form with user data
        document.getElementById('email').value = data.email || '';
        document.getElementById('username').value = data.username || '';
        document.getElementById('phonenumber').value = data.phoneNumber || '';
        document.getElementById('age').value = data.age || '';
        document.getElementById('gender').value = data.gender || '';
        document.getElementById('height').value = data.height || '';
        document.getElementById('weight').value = data.weight || '';
        document.getElementById('location').value = data.location || '';
        document.getElementById('commonDiseases').value = data.commonDiseases || '';
        document.getElementById('allergies').value = data.allergies || '';

        // Show form, hide loading
        if (loadingEl) loadingEl.style.display = 'none';
        if (formEl) formEl.style.display = 'block';

        // Calculate initial BMI
        if (typeof calculateBMI === 'function') calculateBMI();

    } catch (err) {
        console.error('Profile load error:', err);
        showMessage('Không thể kết nối server. Hãy kiểm tra backend đã chạy chưa.', 'error');
        if (loadingEl) loadingEl.style.display = 'none';
    }
}

// Handle form submission
async function handleSubmit(e) {
    e.preventDefault();

    const userId = localStorage.getItem('userId');
    if (!userId) {
        showMessage('Vui lòng đăng nhập lại', 'error');
        return;
    }

    const saveBtn = document.getElementById('saveBtn');
    if (saveBtn) {
        saveBtn.disabled = true;
        saveBtn.innerHTML = '<span class="btn-icon">⏳</span> Đang lưu...';
    }

    // Collect form data (only editable fields)
    const profileData = {
        phonenumber: document.getElementById('phonenumber')?.value || '',
        age: parseInt(document.getElementById('age')?.value) || null,
        gender: document.getElementById('gender')?.value || '',
        height: parseInt(document.getElementById('height')?.value) || null,
        weight: parseInt(document.getElementById('weight')?.value) || null,
        location: document.getElementById('location')?.value || '',
        commonDiseases: document.getElementById('commonDiseases')?.value || '',
        allergies: document.getElementById('allergies')?.value || ''
    };

    try {
        const res = await fetch(`http://localhost:3000/api/profile/${userId}`, {
            method: 'PUT',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(profileData)
        });

        const data = await res.json();

        if (!res.ok) {
            showMessage(data.message || 'Cập nhật thất bại', 'error');
        } else {
            showMessage('Cập nhật thông tin thành công!', 'success');
        }

    } catch (err) {
        console.error('Profile update error:', err);
        showMessage('Không thể kết nối server', 'error');
    } finally {
        if (saveBtn) {
            saveBtn.disabled = false;
            saveBtn.innerHTML = '<span class="btn-icon">💾</span> Lưu thay đổi';
        }
    }
}

// Initialize when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
    loadProfile();

    const form = document.getElementById('profileForm');
    if (form) {
        form.addEventListener('submit', handleSubmit);
    }

    // Add BMI calculation on height/weight change
    const heightInput = document.getElementById('height');
    const weightInput = document.getElementById('weight');

    if (heightInput && weightInput) {
        heightInput.addEventListener('input', calculateBMI);
        weightInput.addEventListener('input', calculateBMI);
    }
});

// Calculate and display BMI
function calculateBMI() {
    const height = parseFloat(document.getElementById('height')?.value) || 0;
    const weight = parseFloat(document.getElementById('weight')?.value) || 0;
    const bmiDisplay = document.getElementById('bmiDisplay');
    const bmiValue = document.getElementById('bmiValue');

    if (!bmiDisplay || !bmiValue) return;

    if (height > 0 && weight > 0) {
        const heightM = height / 100;
        const bmi = weight / (heightM * heightM);

        let status = '';
        if (bmi < 18.5) status = ' (Thiếu cân)';
        else if (bmi < 25) status = ' (Bình thường)';
        else if (bmi < 30) status = ' (Thừa cân)';
        else status = ' (Béo phì)';

        bmiValue.textContent = bmi.toFixed(1) + status;
        bmiDisplay.style.display = 'flex';
    } else {
        bmiDisplay.style.display = 'none';
    }
}
