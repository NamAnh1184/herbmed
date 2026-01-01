// =====================================================
// SEARCH FUNCTIONALITY - PostgreSQL Version
// Tìm kiếm Bệnh, Thảo Dược, Thuốc Tây
// =====================================================

(function () {
  'use strict';

  const SEARCH_API_BASE = window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1'
    ? 'http://localhost:3000/api'
    : '/api';

  let searchTimeout = null;

  // Get base path for correct routing
  function getBasePath() {
    const path = window.location.pathname;
    if (path.includes('/pages/')) {
      // Count how many levels deep we are
      const parts = path.split('/pages/')[1];
      const depth = (parts.match(/\//g) || []).length;
      return '../'.repeat(depth + 1);
    }
    return '';
  }

  // Initialize search on page load
  document.addEventListener('DOMContentLoaded', function () {
    const searchInput = document.getElementById('searchInput');
    const searchButton = document.getElementById('searchButton');

    if (!searchInput) return;

    // Create suggestions container if not exists
    let suggestBox = document.getElementById('suggestions');
    if (!suggestBox) {
      suggestBox = document.createElement('div');
      suggestBox.id = 'suggestions';
      suggestBox.className = 'suggest-box';
      searchInput.parentNode.appendChild(suggestBox);
    }

    // Live search on input
    searchInput.addEventListener('input', function () {
      clearTimeout(searchTimeout);
      searchTimeout = setTimeout(() => liveSearch(this.value), 300);
    });

    // Search on Enter
    searchInput.addEventListener('keydown', function (e) {
      if (e.key === 'Enter') {
        e.preventDefault();
        liveSearch(this.value);
      }
    });

    // Search button click
    if (searchButton) {
      searchButton.addEventListener('click', function () {
        liveSearch(searchInput.value);
      });
    }

    // Hide suggestions when clicking outside
    document.addEventListener('click', function (e) {
      if (!searchInput.parentNode.contains(e.target)) {
        suggestBox.style.display = 'none';
      }
    });
  });

  // Main search function
  async function liveSearch(query) {
    const suggestBox = document.getElementById('suggestions');
    const term = query.trim();

    if (term.length < 2) {
      suggestBox.style.display = 'none';
      return;
    }

    suggestBox.innerHTML = '<div class="search-loading">🔍 Đang tìm kiếm...</div>';
    suggestBox.style.display = 'block';

    try {
      const response = await fetch(`${SEARCH_API_BASE}/search?q=${encodeURIComponent(term)}&limit=8`);
      const data = await response.json();

      displayResults(data, term);
    } catch (err) {
      console.error('Search error:', err);
      suggestBox.innerHTML = '<div class="search-error">❌ Không thể tìm kiếm. Vui lòng thử lại.</div>';
    }
  }

  // Display search results
  function displayResults(data, keyword) {
    const suggestBox = document.getElementById('suggestions');
    const basePath = getBasePath();

    const { benh, thaoduoc, thuoctay } = data;
    const total = (benh?.length || 0) + (thaoduoc?.length || 0) + (thuoctay?.length || 0);

    if (total === 0) {
      suggestBox.innerHTML = `
      <div class="search-no-results">
        <span>😔</span>
        <p>Không tìm thấy kết quả cho "<strong>${escapeHtml(keyword)}</strong>"</p>
      </div>
    `;
      return;
    }

    let html = '';

    // Bệnh section
    if (benh && benh.length > 0) {
      html += `<div class="search-group">
      <div class="search-group-header">🏥 Bệnh</div>
      ${benh.map(item => `
        <a class="search-item" href="${basePath}pages/benh-chi-tiet.html?id=${item.id}">
          <span class="search-item-icon">🩺</span>
          <span class="search-item-name">${highlightText(item.name, keyword)}</span>
        </a>
      `).join('')}
    </div>`;
    }

    // Thảo dược section
    if (thaoduoc && thaoduoc.length > 0) {
      html += `<div class="search-group">
      <div class="search-group-header">🌿 Thảo Dược</div>
      ${thaoduoc.map(item => `
        <a class="search-item" href="${basePath}pages/treatments/thao-duoc-chi-tiet.html?id=${item.id}">
          <span class="search-item-icon">🌱</span>
          <span class="search-item-name">${highlightText(item.name, keyword)}</span>
        </a>
      `).join('')}
    </div>`;
    }

    // Thuốc tây section
    if (thuoctay && thuoctay.length > 0) {
      html += `<div class="search-group">
      <div class="search-group-header">💊 Thuốc Tây</div>
      ${thuoctay.map(item => `
        <a class="search-item" href="${basePath}pages/treatments/thuoc-tay-chi-tiet.html?id=${item.id}">
          <span class="search-item-icon">💉</span>
          <span class="search-item-name">${highlightText(item.name, keyword)}</span>
        </a>
      `).join('')}
    </div>`;
    }

    // Footer with total count
    html += `<div class="search-footer">Tìm thấy ${total} kết quả</div>`;

    suggestBox.innerHTML = html;
  }

  // Highlight matching text
  function highlightText(text, keyword) {
    if (!text || !keyword) return text || '';
    const escapedKeyword = keyword.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    const regex = new RegExp(`(${escapedKeyword})`, 'gi');
    return escapeHtml(text).replace(regex, '<mark>$1</mark>');
  }

  // Escape HTML to prevent XSS
  function escapeHtml(text) {
    if (!text) return '';
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
  }
})();
