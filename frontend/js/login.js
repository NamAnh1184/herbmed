// =====================================================
// LOGIN.JS - Handle login form submission
// =====================================================

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

const form = document.getElementById('loginForm');

form?.addEventListener('submit', async (e) => {
    e.preventDefault();

    ['username', 'password'].forEach(k => setErr(k, ''));

    const username = document.getElementById('username')?.value.trim() || '';
    const password = document.getElementById('password')?.value || '';

    let ok = true;

    if (username.length < 3) {
        setErr('username', 'Tên đăng nhập phải có ít nhất 3 ký tự.');
        ok = false;
    }
    if (password.length < 8) {
        setErr('password', 'Mật khẩu phải có ít nhất 8 ký tự.');
        ok = false;
    }

    if (!ok) return;

    try {
        const res = await fetch('http://localhost:3000/api/login', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ username, password })
        });

        const data = await res.json();

        if (!res.ok) {
            alert('Đăng nhập thất bại: ' + (data.message || 'Lỗi không xác định'));
            return;
        }

        // Save user info to localStorage
        localStorage.setItem('userId', data.userId);
        localStorage.setItem('username', data.username);
        localStorage.setItem('userRole', data.role || 'user');
        localStorage.setItem('justLoggedIn', 'true'); // Flag to auto-open chatbot

        alert('Đăng nhập thành công!');

        // Redirect to saved page or homepage
        const redirect = localStorage.getItem('redirectAfterLogin') || getBasePath() + 'index.html';
        localStorage.removeItem('redirectAfterLogin');
        window.location.href = redirect;

    } catch (err) {
        console.error('Login error:', err);
        alert('Không thể kết nối server. Hãy kiểm tra backend đã chạy chưa.');
    }
});
