/**
 * HerbMed API Configuration
 * Centralized configuration for all API endpoints
 * 
 * Khi deploy:
 * - Backend API: Đặt URL Railway backend vào HERBMED_API_URL
 * - Chatbot API: Đặt URL Railway chatbot vào HERBMED_CHATBOT_URL
 */

(function () {
    'use strict';

    // Detect environment
    const isLocalhost = window.location.hostname === 'localhost' ||
        window.location.hostname === '127.0.0.1';

    // API Configuration
    // QUAN TRỌNG: Thay đổi các URL bên dưới khi deploy lên production
    const config = {
        // Backend API (Node.js/Express on Railway)
        // Local: http://localhost:3000/api
        // Production: https://your-backend.railway.app/api
        API_BASE_URL: isLocalhost
            ? 'http://localhost:3000/api'
            : (window.HERBMED_API_URL || '/api'),

        // Chatbot API (Python/Flask on Railway)  
        // Local: http://localhost:5000/api
        // Production: https://your-chatbot.railway.app/api
        CHATBOT_API_URL: isLocalhost
            ? 'http://localhost:5000/api'
            : (window.HERBMED_CHATBOT_URL || 'https://your-chatbot.railway.app/api'),

        // Debug mode
        DEBUG: isLocalhost
    };

    // Expose to global scope
    window.HerbMedConfig = config;

    // Helper functions
    window.HerbMedConfig.getApiUrl = function (endpoint) {
        return config.API_BASE_URL + endpoint;
    };

    window.HerbMedConfig.getChatbotUrl = function (endpoint) {
        return config.CHATBOT_API_URL + endpoint;
    };

    // Log configuration in debug mode
    if (config.DEBUG) {
        console.log('🌿 HerbMed Config:', {
            API_BASE_URL: config.API_BASE_URL,
            CHATBOT_API_URL: config.CHATBOT_API_URL,
            isLocalhost: isLocalhost
        });
    }
})();
