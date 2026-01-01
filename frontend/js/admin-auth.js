// =====================================================
// ADMIN-AUTH.JS - Admin Authorization Check
// Kiểm tra quyền admin trước khi truy cập trang admin
// =====================================================

(function checkAdminAccess() {
    'use strict';

    const userRole = localStorage.getItem('userRole');
    const username = localStorage.getItem('username');

    // If not logged in, redirect to login
    if (!username) {
        localStorage.setItem('redirectAfterLogin', window.location.href);
        window.location.href = '../../pages/auth/dang-nhap.html';
        return;
    }

    // If not admin, redirect to homepage with alert
    if (userRole !== 'admin') {
        alert('⛔ Bạn không có quyền truy cập trang này!\nChỉ admin mới có thể vào trang quản trị.');
        window.location.href = '../../index.html';
        return;
    }
})();
