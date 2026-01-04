// =====================================================
// AUTH.JS - Authentication Logic
// =====================================================

// Helper: escape HTML to prevent XSS
function escapeHTML(str = "") {
  return str.replace(/[&<>"']/g, (m) => ({
    "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#039;"
  }[m]));
}

// Get current page filename from path
function getCurrentPage() {
  const path = window.location.pathname;
  const parts = path.split("/");
  return parts[parts.length - 1] || "index.html";
}

// Determine base path based on current location
function getBasePath() {
  const path = window.location.pathname;

  // Count directory depth from frontend root
  if (path.includes("/pages/auth/")) {
    return "../../";
  } else if (path.includes("/pages/diseases/") || path.includes("/pages/treatments/")) {
    return "../../";
  } else if (path.includes("/pages/")) {
    return "../";
  }
  return "";
}

// 1) ENFORCE LOGIN (except public pages)
(function enforceLogin() {
  const currentPage = getCurrentPage();

  // Public pages that don't require login (only homepage and auth)
  const publicPages = [
    "index.html",
    "dang-nhap.html",
    "dang-ky.html",
    ""
  ];

  if (!publicPages.includes(currentPage)) {
    const userId = localStorage.getItem("userId");
    if (!userId) {
      const basePath = getBasePath();
      localStorage.setItem("redirectAfterLogin", window.location.href);
      window.location.href = basePath + "pages/auth/dang-nhap.html";
    }
  }
})();

// 2) DISPLAY USERNAME + LOGOUT (hide Login/Signup buttons)
document.addEventListener("DOMContentLoaded", () => {
  const username = localStorage.getItem("username") || "";
  const userRole = localStorage.getItem("userRole") || "user";
  const navRight = document.querySelector(".nav-right");
  const navLeft = document.querySelector(".nav-left");

  if (!navRight) return;

  const basePath = getBasePath();

  const loginLi = navRight.querySelector('a[href$="dang-nhap.html"]')?.closest("li") ||
    navRight.querySelector('a[href*="dang-nhap"]')?.closest("li");
  const signupLi = navRight.querySelector('a[href$="dang-ky.html"]')?.closest("li") ||
    navRight.querySelector('a[href*="dang-ky"]')?.closest("li");

  // If NOT logged in: show login/signup buttons
  if (!username) {
    if (loginLi) loginLi.style.display = "";
    if (signupLi) signupLi.style.display = "";
    navRight.querySelector(".user-box")?.remove();
    return;
  }

  // If logged in: hide login/signup buttons
  if (loginLi) loginLi.style.display = "none";
  if (signupLi) signupLi.style.display = "none";

  // Add Admin menu for admin users
  if (userRole === 'admin' && navLeft) {
    // Check if admin menu already exists
    if (!navLeft.querySelector('.admin-dropdown')) {
      const adminLi = document.createElement("li");
      adminLi.className = "dropdown admin-dropdown";
      adminLi.innerHTML = `
        <a class="dropbtn" style="color: #dc2626; font-weight: 600;">🔐 Quản Trị</a>
        <ul class="dropdown-menu">
          <li><a href="${basePath}pages/admin/dashboard.html">📊 Dashboard</a></li>
          <li><a href="${basePath}pages/admin/quan-ly-benh.html">🏥 Quản lý Bệnh</a></li>
          <li><a href="${basePath}pages/admin/quan-ly-thao-duoc.html">🌿 Quản lý Thảo Dược</a></li>
          <li><a href="${basePath}pages/admin/quan-ly-thuoc-tay.html">💊 Quản lý Thuốc Tây</a></li>
        </ul>
      `;
      navLeft.appendChild(adminLi);
    }
  }

  // Avoid multiple appends
  if (navRight.querySelector(".user-box")) return;

  const li = document.createElement("li");
  li.innerHTML = `
    <div class="user-box">
      <span class="welcome-text">Hello, <strong>${escapeHTML(username)}</strong>${userRole === 'admin' ? ' <span style="color:#dc2626;font-size:0.8em;">(Admin)</span>' : ''}</span>
      <a href="${basePath}pages/auth/ho-so.html" class="profile-btn">Hồ Sơ</a>
      <button type="button" class="logout-btn">Đăng xuất</button>
    </div>
  `;
  navRight.appendChild(li);

  li.querySelector(".logout-btn")?.addEventListener("click", () => {
    localStorage.removeItem("userId");
    localStorage.removeItem("username");
    localStorage.removeItem("userRole");
    localStorage.removeItem("redirectAfterLogin");
    window.location.href = basePath + "index.html";
  });
});
