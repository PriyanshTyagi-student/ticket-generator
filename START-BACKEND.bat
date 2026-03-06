@echo off
echo ========================================
echo   Zonex 2026 - Ticket Generator Setup
echo ========================================
echo.

cd /d "%~dp0..\backend"

echo [1/3] Checking if backend folder exists...
if not exist "package.json" (
    echo ERROR: Backend folder not found!
    echo Current directory: %CD%
    pause
    exit /b 1
)

echo [2/3] Installing dependencies (if needed)...
call npm install
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo [3/3] Starting backend server...
echo.
echo Backend will run on: http://localhost:5000
echo.
echo To test the ticket generator:
echo 1. Open: ticket\index.html in your browser
echo 2. Or open: ticket\test-backend.html to test connection
echo.
echo Press Ctrl+C to stop the server
echo ========================================
echo.

call npm start
