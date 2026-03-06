@echo off
echo ========================================
echo   Starting Ticket Generator
echo ========================================
echo.
echo Opening ticket generator in your default browser...
echo Backend must be running on http://localhost:5000
echo.

cd /d "%~dp0"

REM Start a simple HTTP server using Python (if available)
python --version >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo Starting local web server on http://localhost:8080
    echo.
    echo Open in browser: http://localhost:8080/index.html
    echo.
    start http://localhost:8080/index.html
    python -m http.server 8080
) else (
    REM If Python not available, try Node.js http-server
    where npx >nul 2>&1
    if %ERRORLEVEL% EQU 0 (
        echo Starting local web server on http://localhost:8080
        echo.
        echo Open in browser: http://localhost:8080/index.html
        echo.
        start http://localhost:8080/index.html
        npx http-server -p 8080
    ) else (
        REM Fall back to opening file directly (may have CORS issues)
        echo WARNING: No local server found. Opening file directly...
        echo This may cause CORS issues with backend connection.
        echo.
        echo Install Python or Node.js for better compatibility.
        echo.
        start index.html
    )
)
