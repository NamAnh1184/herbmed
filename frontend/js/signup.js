// =====================================================
// SIGNUP.JS - Handle signup form submission
// =====================================================

// API Configuration
const isLocalhost = window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1';
const API_BASE_URL = isLocalhost
    ? 'http://localhost:3000/api'
    : 'https://herbmed-production.up.railway.app/api';

// Toggle password visibility
function togglePwd(id, btn) {
    const el = document.getElementById(id);
    if (!el) return;
    const showing = el.type === 'text';
    el.type = showing ? 'password' : 'text';
}

// Helper to display error messages
function setErr(name, msg = '') {
    const el = document.querySelector(`.error[data-for="${name}"]`);
    if (el) el.textContent = msg;
}

// Get base path for navigation
function getBasePath() {
    return "../../";
}

const form = document.getElementById('signupForm');

form?.addEventListener('submit', async (e) => {
    e.preventDefault();

    // Clear old errors
    ['email', 'phonenumber', 'username', 'age', 'gender', 'height', 'weight', 'location', 'commonDiseases', 'allergies', 'psw', 'psw-retype']
        .forEach(k => setErr(k, ''));

    const email = document.getElementById('email')?.value.trim() || '';
    const phonenumber = document.getElementById('phonenumber')?.value.trim() || '';
    const username = document.getElementById('username')?.value.trim() || '';
    const ageStr = document.getElementById('age')?.value.trim() || '';
    const gender = document.getElementById('gender')?.value || '';
    const heightStr = document.getElementById('height')?.value.trim() || '';
    const weightStr = document.getElementById('weight')?.value.trim() || '';
    const location = document.getElementById('location')?.value || '';
    const commonDiseases = document.getElementById('commonDiseases')?.value.trim() || '';
    const allergies = document.getElementById('allergies')?.value.trim() || '';
    const psw = document.getElementById('psw')?.value || '';
    const pswRetype = document.getElementById('psw-retype')?.value || '';

    let ok = true;

    // ==== VALIDATION ====

    // Email
    if (!email) {
        setErr('email', 'Email là bắt buộc.');
        ok = false;
    } else if (!/^.+@.+\..+$/.test(email)) {
        setErr('email', 'Email không hợp lệ.');
        ok = false;
    }

    // Phone
    if (!phonenumber) {
        setErr('phonenumber', 'Số điện thoại là bắt buộc.');
        ok = false;
    }

    // Username
    if (username.length < 3) {
        setErr('username', 'Tên đăng nhập phải có ít nhất 3 ký tự.');
        ok = false;
    }

    // Age
    const age = Number(ageStr);
    if (!ageStr) {
        setErr('age', 'Tuổi là bắt buộc.');
        ok = false;
    } else if (Number.isNaN(age) || age < 13 || age > 120) {
        setErr('age', 'Tuổi phải từ 13 đến 120.');
        ok = false;
    }

    // Gender
    if (!gender) {
        setErr('gender', 'Vui lòng chọn giới tính.');
        ok = false;
    }

    // Password
    if (psw.length < 8) {
        setErr('psw', 'Mật khẩu phải có ít nhất 8 ký tự.');
        ok = false;
    }
    if (pswRetype.length < 8) {
        setErr('psw-retype', 'Vui lòng xác nhận mật khẩu.');
        ok = false;
    }
    if (psw && pswRetype && psw !== pswRetype) {
        setErr('psw-retype', 'Mật khẩu không khớp.');
        ok = false;
    }

    // Location (Province/City)
    if (!location) {
        setErr('location', 'Vui lòng chọn tỉnh/thành phố.');
        ok = false;
    }

    if (!ok) return;

    // ==== SEND TO BACKEND ====
    try {
        const res = await fetch(`${API_BASE_URL}/signup`, {

            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                email,
                phonenumber,
                username,
                age,
                gender,
                height: heightStr ? Number(heightStr) : null,
                weight: weightStr ? Number(weightStr) : null,
                location,
                psw,
                commonDiseases,
                allergies
            })
        });

        const data = await res.json();

        if (!res.ok) {
            alert('Đăng ký thất bại: ' + (data.message || 'Lỗi không xác định'));
            return;
        }

        alert('Đăng ký thành công! Vui lòng đăng nhập.');
        window.location.href = 'dang-nhap.html';

    } catch (err) {
        console.error('Signup error:', err);
        alert('Không thể kết nối server. Hãy kiểm tra backend đã chạy chưa.');
    }
});
