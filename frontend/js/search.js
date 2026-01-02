// =====================================================
// SEARCH FUNCTIONALITY - PostgreSQL Version with Synonyms
// Tìm kiếm Bệnh, Thảo Dược, Thuốc Tây với hỗ trợ từ đồng nghĩa
// =====================================================

(function () {
  'use strict';

  const SEARCH_API_BASE = window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1'
    ? 'http://localhost:3000/api'
    : 'https://herbmed-production.up.railway.app/api';


  let searchTimeout = null;

  // =====================================================
  // SYNONYM DICTIONARY - Từ đồng nghĩa y tế Việt Nam
  // =====================================================
  const SYNONYMS = {
    // Triệu chứng đau
    'nhức đầu': ['đau đầu', 'đau nửa đầu', 'migraine', 'chóng mặt'],
    'đau đầu': ['nhức đầu', 'đau nửa đầu', 'migraine', 'nhức óc'],
    'đau nửa đầu': ['migraine', 'đau đầu', 'nhức đầu'],
    'nhức mỏi': ['đau mỏi', 'mỏi', 'đau nhức', 'ê ẩm'],
    'đau bụng': ['đau dạ dày', 'đau bao tử', 'đau ruột', 'quặn bụng'],
    'đau dạ dày': ['đau bụng', 'viêm dạ dày', 'đau bao tử', 'trào ngược'],
    'đau lưng': ['nhức lưng', 'đau cột sống', 'căng cơ lưng'],
    'đau khớp': ['viêm khớp', 'nhức khớp', 'sưng khớp', 'thoái hóa khớp'],
    'đau họng': ['viêm họng', 'rát họng', 'đau cổ họng'],
    'đau răng': ['nhức răng', 'sâu răng', 'viêm nướu'],

    // Triệu chứng hô hấp
    'ho': ['ho khan', 'ho có đờm', 'ho dai dẳng', 'sặc'],
    'sổ mũi': ['chảy nước mũi', 'nghẹt mũi', 'viêm mũi'],
    'nghẹt mũi': ['tắc mũi', 'sổ mũi', 'khó thở mũi'],
    'cảm': ['cảm lạnh', 'cảm cúm', 'cúm', 'nhiễm lạnh'],
    'cảm cúm': ['cúm', 'cảm', 'cảm lạnh', 'sốt'],
    'cúm': ['cảm cúm', 'cảm', 'influenza'],
    'sốt': ['nóng', 'sốt cao', 'hâm hấp sốt'],
    'khó thở': ['thở khó', 'hụt hơi', 'hen suyễn', 'khó thở'],
    'hen': ['hen suyễn', 'hen phế quản', 'khó thở', 'suyễn'],
    'viêm xoang': ['xoang', 'đau xoang', 'viêm mũi xoang'],

    // Triệu chứng tiêu hóa
    'tiêu chảy': ['đi ngoài', 'ỉa chảy', 'rối loạn tiêu hóa'],
    'táo bón': ['bón', 'khó đi ngoài', 'đi cầu khó'],
    'ợ chua': ['trào ngược', 'ợ hơi', 'dạ dày', 'reflux'],
    'buồn nôn': ['nôn', 'lợm giọng', 'muốn ói'],
    'đầy hơi': ['chướng bụng', 'đầy bụng', 'khó tiêu'],

    // Triệu chứng da liễu
    'mụn': ['mụn trứng cá', 'mụn nhọt', 'nổi mụn', 'acne'],
    'ngứa': ['ngứa da', 'dị ứng da', 'chàm', 'nổi mẩn'],
    'nổi mẩn': ['nổi mề đay', 'dị ứng', 'phát ban', 'nổi đỏ'],
    'khô da': ['da khô', 'bong da', 'nứt nẻ da'],
    'nấm': ['nấm da', 'hắc lào', 'lang ben'],
    'gàu': ['gàu đầu', 'da đầu khô', 'bong da đầu'],

    // Triệu chứng tâm lý
    'mất ngủ': ['khó ngủ', 'không ngủ được', 'thức đêm', 'insomnia'],
    'lo âu': ['lo lắng', 'căng thẳng', 'stress', 'bồn chồn'],
    'căng thẳng': ['stress', 'lo âu', 'áp lực', 'mệt mỏi'],
    'trầm cảm': ['buồn', 'chán nản', 'depression'],
    'mệt mỏi': ['kiệt sức', 'yếu', 'uể oải', 'thiếu năng lượng'],

    // Bệnh mãn tính
    'tiểu đường': ['đái tháo đường', 'đường huyết cao', 'diabetes'],
    'huyết áp cao': ['tăng huyết áp', 'cao huyết áp', 'hypertension'],
    'béo phì': ['thừa cân', 'quá béo', 'obesity'],
    'gout': ['gút', 'thống phong', 'đau nhức khớp'],

    // Thảo dược
    'nghệ': ['curcumin', 'nghệ vàng', 'uất kim'],
    'gừng': ['sinh khương', 'can khương'],
    'tỏi': ['đại toán', 'tỏi tây'],
    'mật ong': ['mật ong rừng', 'honey'],
    'chanh': ['chanh tươi', 'lemon', 'chanh vàng'],
    'bạc hà': ['mint', 'húng bạc hà'],
    'atiso': ['artichoke', 'atisô'],
    'đinh lăng': ['sâm việt nam', 'nhân sâm'],
    'linh chi': ['nấm linh chi', 'reishi'],

    // Thuốc phổ biến
    'paracetamol': ['panadol', 'efferalgan', 'tylenol', 'hạ sốt'],
    'ibuprofen': ['advil', 'nurofen', 'giảm đau'],
    'omeprazole': ['omez', 'nexium', 'thuốc dạ dày'],
    'amoxicillin': ['kháng sinh', 'augmentin'],

    // Các từ viết tắt / variation
    'HA': ['huyết áp', 'tăng huyết áp'],
    'ĐTĐ': ['đái tháo đường', 'tiểu đường'],
    'VDD': ['viêm dạ dày'],
    'VPQ': ['viêm phế quản'],
    'GERD': ['trào ngược dạ dày', 'trào ngược'],
  };

  // Normalize Vietnamese text (remove diacritics for fuzzy matching)
  function normalizeText(text) {
    return text.toLowerCase()
      .normalize('NFD')
      .replace(/[\u0300-\u036f]/g, '')
      .replace(/đ/g, 'd')
      .replace(/Đ/g, 'D');
  }

  // Find synonyms for a search term
  function findSynonyms(term) {
    const normalizedTerm = term.toLowerCase().trim();
    const synonyms = new Set([normalizedTerm]);

    // Direct match
    if (SYNONYMS[normalizedTerm]) {
      SYNONYMS[normalizedTerm].forEach(syn => synonyms.add(syn.toLowerCase()));
    }

    // Reverse match (find keys that have this term as value)
    for (const [key, values] of Object.entries(SYNONYMS)) {
      if (values.some(v => v.toLowerCase() === normalizedTerm)) {
        synonyms.add(key.toLowerCase());
        values.forEach(v => synonyms.add(v.toLowerCase()));
      }
    }

    // Partial match for longer terms
    for (const [key, values] of Object.entries(SYNONYMS)) {
      if (normalizedTerm.includes(key.toLowerCase()) || key.toLowerCase().includes(normalizedTerm)) {
        synonyms.add(key.toLowerCase());
        values.forEach(v => synonyms.add(v.toLowerCase()));
      }
    }

    return Array.from(synonyms);
  }

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

  // Main search function with synonym support
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
      // Get synonyms for the search term
      const synonyms = findSynonyms(term);

      // Search for all synonyms and combine results
      const allResults = {
        benh: [],
        thaoduoc: [],
        thuoctay: []
      };

      const seenIds = {
        benh: new Set(),
        thaoduoc: new Set(),
        thuoctay: new Set()
      };

      // Search for each synonym
      for (const searchTerm of synonyms) {
        try {
          const response = await fetch(`${SEARCH_API_BASE}/search?q=${encodeURIComponent(searchTerm)}&limit=8`);
          const data = await response.json();

          // Add unique results
          if (data.benh) {
            data.benh.forEach(item => {
              if (!seenIds.benh.has(item.id)) {
                seenIds.benh.add(item.id);
                allResults.benh.push(item);
              }
            });
          }
          if (data.thaoduoc) {
            data.thaoduoc.forEach(item => {
              if (!seenIds.thaoduoc.has(item.id)) {
                seenIds.thaoduoc.add(item.id);
                allResults.thaoduoc.push(item);
              }
            });
          }
          if (data.thuoctay) {
            data.thuoctay.forEach(item => {
              if (!seenIds.thuoctay.has(item.id)) {
                seenIds.thuoctay.add(item.id);
                allResults.thuoctay.push(item);
              }
            });
          }
        } catch (e) {
          // Continue with other synonyms if one fails
        }
      }

      // Limit results
      allResults.benh = allResults.benh.slice(0, 5);
      allResults.thaoduoc = allResults.thaoduoc.slice(0, 5);
      allResults.thuoctay = allResults.thuoctay.slice(0, 5);

      displayResults(allResults, term, synonyms);
    } catch (err) {
      console.error('Search error:', err);
      suggestBox.innerHTML = '<div class="search-error">❌ Không thể tìm kiếm. Vui lòng thử lại.</div>';
    }
  }

  // Display search results
  function displayResults(data, keyword, synonyms = []) {
    const suggestBox = document.getElementById('suggestions');
    const basePath = getBasePath();

    const { benh, thaoduoc, thuoctay } = data;
    const total = (benh?.length || 0) + (thaoduoc?.length || 0) + (thuoctay?.length || 0);

    if (total === 0) {
      suggestBox.innerHTML = `
      <div class="search-no-results">
        <span>😔</span>
        <p>Không tìm thấy kết quả cho "<strong>${escapeHtml(keyword)}</strong>"</p>
        ${synonyms.length > 1 ? `<p class="search-hint">Đã tìm thêm: ${synonyms.slice(1, 4).map(s => escapeHtml(s)).join(', ')}</p>` : ''}
      </div>
    `;
      return;
    }

    let html = '';

    // Show synonym info if found related terms
    if (synonyms.length > 1) {
      html += `<div class="search-synonym-info">💡 Cũng tìm: ${synonyms.slice(1, 4).map(s => `<span>${escapeHtml(s)}</span>`).join(', ')}</div>`;
    }

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
