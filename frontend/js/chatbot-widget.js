/**
 * Chatbot Widget JavaScript
 * Handles UI interactions and API calls for the medical chatbot
 * REQUIRES LOGIN: User must be logged in to use chatbot
 */

(function () {
    'use strict';

    // ============================================================
    // CONFIGURATION
    // ============================================================
    const CONFIG = {
        apiUrl: 'http://localhost:5000/api/chat',
        healthUrl: 'http://localhost:5000/api/health',
        maxRetries: 2,
        retryDelay: 1000,
        requireLogin: true  // Set to false to disable login requirement
    };

    // ============================================================
    // STATE
    // ============================================================
    let isOpen = false;
    let isLoading = false;
    let messages = [];

    // ============================================================
    // AUTH FUNCTIONS
    // ============================================================
    function isUserLoggedIn() {
        return !!localStorage.getItem('userId');
    }

    function getUsername() {
        return localStorage.getItem('username') || 'Người dùng';
    }

    function getLoginUrl() {
        const path = window.location.pathname;
        let basePath = '';

        if (path.includes('/pages/auth/')) {
            basePath = '../../';
        } else if (path.includes('/pages/diseases/') || path.includes('/pages/treatments/')) {
            basePath = '../../';
        } else if (path.includes('/pages/')) {
            basePath = '../';
        }

        return basePath + 'pages/auth/dang-nhap.html';
    }

    // ============================================================
    // CREATE WIDGET HTML
    // ============================================================
    function createWidgetHTML() {
        const isLoggedIn = isUserLoggedIn();
        const username = getUsername();

        // Different content based on login status
        let welcomeContent;
        if (CONFIG.requireLogin && !isLoggedIn) {
            welcomeContent = `
                <div class="welcome-message" id="welcome-message">
                    <div class="welcome-icon">🔒</div>
                    <h4 class="welcome-title">Vui lòng đăng nhập</h4>
                    <p class="welcome-subtitle">Bạn cần đăng nhập để sử dụng trợ lý AI tư vấn sức khỏe.</p>
                    <div class="suggestion-chips">
                        <button class="suggestion-chip login-btn" id="chatbot-login-btn">🔐 Đăng nhập ngay</button>
                    </div>
                </div>
            `;
        } else {
            welcomeContent = `
                <div class="welcome-message" id="welcome-message">
                    <div class="welcome-icon">🌿</div>
                    <h4 class="welcome-title">Xin chào, ${escapeHtml(username)}!</h4>
                    <p class="welcome-subtitle">Mình là trợ lý AI tư vấn thông tin về các bệnh và phương thuốc. Bạn muốn hỏi gì?</p>
                    <div class="suggestion-chips">
                        <button class="suggestion-chip" data-message="Triệu chứng viêm dạ dày?">🩺 Triệu chứng</button>
                        <button class="suggestion-chip" data-message="Nghệ có tác dụng gì?">🌿 Thảo dược</button>
                        <button class="suggestion-chip" data-message="Thuốc Omeprazole dùng thế nào?">💊 Thuốc</button>
                    </div>
                </div>
            `;
        }

        // Disable input if not logged in
        const inputDisabled = (CONFIG.requireLogin && !isLoggedIn) ? 'disabled' : '';
        const inputPlaceholder = (CONFIG.requireLogin && !isLoggedIn)
            ? 'Vui lòng đăng nhập để chat...'
            : 'Nhập câu hỏi của bạn...';

        // Greeting popup for logged in users
        const greetingPopup = isLoggedIn ? `
            <div class="chatbot-greeting" id="chatbot-greeting">
                <span>👋 Xin chào, ${escapeHtml(username)}!</span>
                <button class="greeting-close" id="greeting-close">×</button>
            </div>
        ` : '';

        const widgetHTML = `
            <!-- Floating Toggle Button -->
            <button class="chatbot-toggle" id="chatbot-toggle" aria-label="Mở chatbot">
                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M20 2H4c-1.1 0-2 .9-2 2v18l4-4h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm0 14H6l-2 2V4h16v12z"/>
                </svg>
            </button>
            
            <!-- Greeting popup -->
            ${greetingPopup}

            <!-- Chat Window -->
            <div class="chatbot-window" id="chatbot-window">
                <!-- Header -->
                <div class="chatbot-header">
                    <div class="chatbot-avatar">🏥</div>
                    <div class="chatbot-info">
                        <h3 class="chatbot-name">Trợ lý Y tế AI</h3>
                        <div class="chatbot-status">${isLoggedIn ? 'Sẵn sàng hỗ trợ' : '🔒 Yêu cầu đăng nhập'}</div>
                    </div>
                    <button class="chatbot-close" id="chatbot-close" aria-label="Đóng chatbot">
                        <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"/>
                        </svg>
                    </button>
                </div>

                <!-- Messages Area -->
                <div class="chatbot-messages" id="chatbot-messages">
                    ${welcomeContent}
                </div>

                <!-- Input Area -->
                <div class="chatbot-input-area">
                    <textarea 
                        class="chatbot-input" 
                        id="chatbot-input" 
                        placeholder="${inputPlaceholder}"
                        rows="1"
                        ${inputDisabled}
                    ></textarea>
                    <button class="chatbot-send" id="chatbot-send" aria-label="Gửi tin nhắn" ${inputDisabled}>
                        <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M2.01 21L23 12 2.01 3 2 10l15 2-15 2z"/>
                        </svg>
                    </button>
                </div>
            </div>
        `;

        // Create container
        const container = document.createElement('div');
        container.id = 'chatbot-widget';
        container.innerHTML = widgetHTML;
        document.body.appendChild(container);
    }

    // ============================================================
    // UI FUNCTIONS
    // ============================================================
    function toggleChat() {
        const chatWindow = document.getElementById('chatbot-window');
        const toggle = document.getElementById('chatbot-toggle');
        const greeting = document.getElementById('chatbot-greeting');

        isOpen = !isOpen;

        if (isOpen) {
            chatWindow.classList.add('open');
            toggle.classList.add('active');

            // Hide greeting popup when chat opens
            if (greeting) greeting.remove();

            // Only focus input if logged in
            if (!CONFIG.requireLogin || isUserLoggedIn()) {
                document.getElementById('chatbot-input').focus();
            }
        } else {
            chatWindow.classList.remove('open');
            toggle.classList.remove('active');
        }
    }

    function addMessage(text, type, intent = null) {
        const messagesContainer = document.getElementById('chatbot-messages');
        const welcomeMessage = document.getElementById('welcome-message');

        // Hide welcome message after first message
        if (welcomeMessage) {
            welcomeMessage.style.display = 'none';
        }

        const messageDiv = document.createElement('div');
        messageDiv.className = `chat-message ${type}`;

        const time = new Date().toLocaleTimeString('vi-VN', {
            hour: '2-digit',
            minute: '2-digit'
        });

        let intentBadge = '';
        if (intent && type === 'bot') {
            const intentEmojis = {
                'symptoms': '🩺 Triệu chứng',
                'herb': '🌿 Thảo dược',
                'drug': '💊 Thuốc',
                'interaction': '⚠️ Tương tác',
                'symptom_to_disease': '🔍 Chẩn đoán',
                'general': 'ℹ️ Thông tin',
                'smalltalk': '💬 Chào hỏi'
            };
            const intentLabel = intentEmojis[intent] || intent;
            intentBadge = `<span class="message-intent">${intentLabel}</span>`;
        }

        // Convert markdown-like formatting for bot messages
        let formattedText = text;
        if (type === 'bot') {
            formattedText = formatMessage(text);
        } else {
            formattedText = escapeHtml(text);
        }

        messageDiv.innerHTML = `
            ${intentBadge}
            <div class="message-content">${formattedText}</div>
            <span class="message-time">${time}</span>
        `;

        messagesContainer.appendChild(messageDiv);
        scrollToBottom();

        messages.push({ text, type, time, intent });
    }

    function formatMessage(text) {
        // Escape HTML first
        let formatted = escapeHtml(text);

        // Convert **bold** to <strong>
        formatted = formatted.replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>');

        // Convert bullet points
        formatted = formatted.replace(/^- (.+)$/gm, '<li>$1</li>');
        formatted = formatted.replace(/(<li>.*<\/li>\n?)+/g, '<ul>$&</ul>');

        // Convert line breaks to paragraphs
        formatted = formatted.split('\n\n').map(p => `<p>${p}</p>`).join('');
        formatted = formatted.replace(/\n/g, '<br>');

        return formatted;
    }

    function escapeHtml(text) {
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    }

    function showTyping() {
        const messagesContainer = document.getElementById('chatbot-messages');

        const typingDiv = document.createElement('div');
        typingDiv.className = 'chat-message bot';
        typingDiv.id = 'typing-indicator';
        typingDiv.innerHTML = `
            <div class="typing-indicator">
                <span></span>
                <span></span>
                <span></span>
            </div>
        `;

        messagesContainer.appendChild(typingDiv);
        scrollToBottom();
    }

    function hideTyping() {
        const typing = document.getElementById('typing-indicator');
        if (typing) {
            typing.remove();
        }
    }

    function showError(message) {
        const messagesContainer = document.getElementById('chatbot-messages');

        const errorDiv = document.createElement('div');
        errorDiv.className = 'error-message';
        errorDiv.textContent = message;

        messagesContainer.appendChild(errorDiv);
        scrollToBottom();

        // Auto-remove after 5 seconds
        setTimeout(() => {
            errorDiv.remove();
        }, 5000);
    }

    function scrollToBottom() {
        const messagesContainer = document.getElementById('chatbot-messages');
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }

    function setLoading(loading) {
        isLoading = loading;
        const sendButton = document.getElementById('chatbot-send');
        const input = document.getElementById('chatbot-input');

        sendButton.disabled = loading;
        input.disabled = loading;
    }

    // ============================================================
    // API FUNCTIONS
    // ============================================================
    async function sendMessage(message) {
        // Check login requirement
        if (CONFIG.requireLogin && !isUserLoggedIn()) {
            showError('Vui lòng đăng nhập để sử dụng chatbot.');
            return;
        }

        if (!message.trim() || isLoading) return;

        // Add user message
        addMessage(message, 'user');

        // Clear input
        const input = document.getElementById('chatbot-input');
        input.value = '';
        autoResizeInput();

        // Show loading
        setLoading(true);
        showTyping();

        try {
            const response = await fetchWithRetry(CONFIG.apiUrl, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    message,
                    userId: localStorage.getItem('userId'),
                    username: localStorage.getItem('username')
                })
            });

            hideTyping();

            if (response.success) {
                addMessage(response.response, 'bot', response.intent);
            } else {
                addMessage(response.error || 'Có lỗi xảy ra. Vui lòng thử lại.', 'bot');
            }
        } catch (error) {
            hideTyping();
            console.error('Chat error:', error);
            showError('Không thể kết nối đến server. Vui lòng kiểm tra chatbot server đang chạy.');
        } finally {
            setLoading(false);
        }
    }

    async function fetchWithRetry(url, options, retries = CONFIG.maxRetries) {
        try {
            const response = await fetch(url, options);
            return await response.json();
        } catch (error) {
            if (retries > 0) {
                await new Promise(resolve => setTimeout(resolve, CONFIG.retryDelay));
                return fetchWithRetry(url, options, retries - 1);
            }
            throw error;
        }
    }

    async function checkHealth() {
        try {
            const response = await fetch(CONFIG.healthUrl);
            const data = await response.json();
            return data.status === 'ok' && data.chatbot_loaded;
        } catch {
            return false;
        }
    }

    // ============================================================
    // INPUT HANDLING
    // ============================================================
    function autoResizeInput() {
        const input = document.getElementById('chatbot-input');
        input.style.height = 'auto';
        input.style.height = Math.min(input.scrollHeight, 100) + 'px';
    }

    function handleKeyDown(e) {
        if (e.key === 'Enter' && !e.shiftKey) {
            e.preventDefault();
            const input = document.getElementById('chatbot-input');
            sendMessage(input.value);
        }
    }

    // ============================================================
    // EVENT LISTENERS
    // ============================================================
    function initEventListeners() {
        // Toggle button
        document.getElementById('chatbot-toggle').addEventListener('click', toggleChat);

        // Close button
        document.getElementById('chatbot-close').addEventListener('click', toggleChat);

        // Send button
        document.getElementById('chatbot-send').addEventListener('click', () => {
            const input = document.getElementById('chatbot-input');
            sendMessage(input.value);
        });

        // Input events
        const input = document.getElementById('chatbot-input');
        input.addEventListener('keydown', handleKeyDown);
        input.addEventListener('input', autoResizeInput);

        // Suggestion chips (only for logged in users)
        document.querySelectorAll('.suggestion-chip:not(.login-btn)').forEach(chip => {
            chip.addEventListener('click', () => {
                if (CONFIG.requireLogin && !isUserLoggedIn()) {
                    showError('Vui lòng đăng nhập để sử dụng chatbot.');
                    return;
                }
                const message = chip.dataset.message;
                sendMessage(message);
            });
        });

        // Login button in chatbot
        const loginBtn = document.getElementById('chatbot-login-btn');
        if (loginBtn) {
            loginBtn.addEventListener('click', () => {
                // Save current page to redirect back after login
                localStorage.setItem('redirectAfterLogin', window.location.href);
                window.location.href = getLoginUrl();
            });
        }

        // Greeting popup close button
        const greetingClose = document.getElementById('greeting-close');
        if (greetingClose) {
            greetingClose.addEventListener('click', () => {
                const greeting = document.getElementById('chatbot-greeting');
                if (greeting) greeting.remove();
            });
        }

        // Auto-hide greeting after 10 seconds
        const greeting = document.getElementById('chatbot-greeting');
        if (greeting) {
            setTimeout(() => {
                greeting.style.opacity = '0';
                greeting.style.transform = 'translateX(20px)';
                greeting.style.transition = 'all 0.3s ease';
                setTimeout(() => greeting.remove(), 300);
            }, 10000);
        }

        // Close on escape key
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && isOpen) {
                toggleChat();
            }
        });
    }

    // ============================================================
    // INITIALIZATION
    // ============================================================
    function init() {
        // Create widget HTML
        createWidgetHTML();

        // Initialize event listeners
        initEventListeners();

        // Log status
        if (CONFIG.requireLogin) {
            if (isUserLoggedIn()) {
                console.log('✅ Chatbot widget sẵn sàng! User:', getUsername());

                // Auto-open chatbot after fresh login
                const justLoggedIn = localStorage.getItem('justLoggedIn');
                if (justLoggedIn === 'true') {
                    // Clear the flag
                    localStorage.removeItem('justLoggedIn');
                    // Open chatbot after a short delay
                    setTimeout(() => {
                        toggleChat();
                    }, 500);
                }
            } else {
                console.log('🔒 Chatbot yêu cầu đăng nhập.');
            }
        }

        // Check server health
        checkHealth().then(healthy => {
            if (!healthy) {
                console.warn('⚠️ Chatbot server không khả dụng. Hãy chắc chắn Flask server đang chạy ở port 5000.');
            }
        });
    }

    // Wait for DOM ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
