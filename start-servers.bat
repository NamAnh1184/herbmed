@echo off
echo ============================================
echo   HNBG - Starting All Servers
echo ============================================
echo.

:: Check if Python is installed
where python >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python is not installed or not in PATH
    pause
    exit /b 1
)

:: Check if Node.js is installed
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed or not in PATH
    pause
    exit /b 1
)

echo [1/2] Starting Flask Chatbot API Server (port 5000)...
cd /d "%~dp0chatbot\ThanhHai"
start "Chatbot API Server" cmd /k "python chatbot_api.py"

:: Wait a bit for Flask to start
timeout /t 3 /nobreak >nul

echo [2/2] Starting Node.js Backend Server (port 3000)...
cd /d "%~dp0backend"
start "Node.js Server" cmd /k "node server.js"

echo.
echo ============================================
echo   All servers started!
echo ============================================
echo.
echo   - Chatbot API: http://localhost:5000
echo   - Backend API: http://localhost:3000
echo   - Frontend: Open frontend/index.html in browser
echo.
echo   Press any key to close this window...
echo   (Servers will continue running in separate windows)
echo ============================================
pause >nul
