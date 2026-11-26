@echo off
title Route राही - AI Disaster Logistics Platform (SIH 2026)
color 0A

:: Dynamically detect active Wi-Fi IP
set "DETECTED_IP=192.168.1.4"
for /f "tokens=*" %%i in ('powershell -NoProfile -Command "(Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias 'Wi-Fi*' -ErrorAction SilentlyContinue | Select-Object -First 1).IPAddress"') do (
    if not "%%i"=="" set "DETECTED_IP=%%i"
)

echo ======================================================================
echo    Route राही - AI Disaster Logistics & Autonomous Rerouting Platform
echo ======================================================================
echo.
echo [1/2] Backend Server:  http://0.0.0.0:8000 (FastAPI REST + WebSocket)
echo [2/2] Frontend Server: https://0.0.0.0:5173 (Vite Command Center + HUD)
echo.
echo ----------------------------------------------------------------------
echo  * Laptop Command Center:       https://localhost:5173
echo  * Phone Driver HUD (Wi-Fi):    https://%DETECTED_IP%:5173/driver
echo  * Phone Driver HUD (Hotspot):  https://192.168.137.1:5173/driver
echo ----------------------------------------------------------------------
echo  * QR Code Sync: Click 'Multi-Device Driver QR Sync' on the Dashboard
echo  * Remote 4G/5G: Use 'Launch 4G/5G Tunnel' directly inside the QR Modal
echo ======================================================================
echo.

npm run dev

pause
