#   new one




# ================================================
# MR. MOGLEE BBQ - Auto Start Script
# ================================================

Write-Host ""
Write-Host "========================================" -ForegroundColor Yellow
Write-Host "     MR. MOGLEE BBQ RESTAURANT         " -ForegroundColor Yellow
Write-Host "         Starting System...            " -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Yellow
Write-Host ""

# STEP 1: Get current WiFi IP automatically
try {
    $ip = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias WiFi).IPAddress
    Write-Host "✅ IP Found: $ip" -ForegroundColor Green
} catch {
    $ip = "127.0.0.1"
    Write-Host "⚠️  Using localhost: $ip" -ForegroundColor Yellow
}

# STEP 2: Update .env with current IP
$envPath = "$PSScriptRoot\frontend\.env"
Set-Content -Path $envPath -Value "VITE_API_URL=http://$ip`:8000"
Write-Host "✅ .env updated: http://$ip`:8000" -ForegroundColor Green

# STEP 3: Start Django Backend
Write-Host ""
Write-Host "Starting Django Backend..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\backend'; & venv\Scripts\Activate.ps1; python manage.py runserver 0.0.0.0:8000"

# Wait for Django to start
Write-Host "Waiting for Django..." -ForegroundColor Gray
Start-Sleep -Seconds 4

# STEP 4: Start React Frontend
Write-Host "Starting React Frontend..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\frontend'; npm run dev"

# Wait for React to start
Start-Sleep -Seconds 4

# STEP 5: Show all URLs
Write-Host ""
Write-Host "========================================" -ForegroundColor Yellow
Write-Host "   ✅  SYSTEM READY!                   " -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "ADMIN LOGIN (open this first in browser):" -ForegroundColor White
Write-Host "  → http://$ip`:5173/admin/login" -ForegroundColor Cyan
Write-Host ""
Write-Host "ORDERS PAGE (Kitchen + KOT):" -ForegroundColor White
Write-Host "  → http://$ip`:5173/admin/orders" -ForegroundColor Cyan
Write-Host ""
Write-Host "BILLING PAGE:" -ForegroundColor White
Write-Host "  → http://$ip`:5173/admin/billing" -ForegroundColor Cyan
Write-Host ""
Write-Host "TABLES AND QR CODES:" -ForegroundColor White
Write-Host "  → http://$ip`:5173/admin/tables" -ForegroundColor Cyan
Write-Host ""
Write-Host "CUSTOMER MENU (scan QR or open on phone):" -ForegroundColor White
Write-Host "  → http://$ip`:5173/menu?tableId=1" -ForegroundColor Cyan
Write-Host ""
Write-Host "========================================" -ForegroundColor Yellow
Write-Host " Open ADMIN LOGIN URL in browser now!  " -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "Press any key to exit this window..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")


































































                 # old one





# # ================================================
# # MR. MOGLEE BBQ - Auto Start Script
# # ================================================

# Write-Host ""
# Write-Host "========================================" -ForegroundColor Yellow
# Write-Host "     MR. MOGLEE BBQ RESTAURANT         " -ForegroundColor Yellow
# Write-Host "         Starting System...            " -ForegroundColor Yellow
# Write-Host "========================================" -ForegroundColor Yellow
# Write-Host ""

# # STEP 1: Get current WiFi IP automatically
# try {
#     $ip = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias WiFi).IPAddress
#     Write-Host "IP Found: $ip" -ForegroundColor Green
# } catch {
#     $ip = "127.0.0.1"
#     Write-Host "Using localhost: $ip" -ForegroundColor Yellow
# }

# # STEP 2: Update .env with current IP
# $envPath = "$PSScriptRoot\frontend\.env"
# Set-Content -Path $envPath -Value "VITE_API_URL=http://$ip`:8000"
# Write-Host ".env updated with IP: $ip" -ForegroundColor Green

# # STEP 3: Start Django Backend
# Write-Host ""
# Write-Host "Starting Django Backend..." -ForegroundColor Cyan
# Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\backend'; & venv\Scripts\Activate.ps1; python manage.py runserver 0.0.0.0:8000"

# # Wait for Django to start
# Write-Host "Waiting for Django to start..." -ForegroundColor Gray
# Start-Sleep -Seconds 4

# # STEP 4: Start React Frontend
# Write-Host "Starting React Frontend..." -ForegroundColor Cyan
# Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\frontend'; npm run dev"

# # Wait for React to start
# Start-Sleep -Seconds 4

# # STEP 5: Show all URLs
# Write-Host ""
# Write-Host "========================================" -ForegroundColor Yellow
# Write-Host "   SYSTEM READY!                       " -ForegroundColor Green
# Write-Host "========================================" -ForegroundColor Yellow
# Write-Host ""
# Write-Host "ADMIN LOGIN (open this first):" -ForegroundColor White
# Write-Host "http://$ip`:5173/admin/login" -ForegroundColor Cyan
# Write-Host ""
# Write-Host "KITCHEN SCREEN:" -ForegroundColor White
# Write-Host "http://$ip`:5173/admin/kitchen" -ForegroundColor Cyan
# Write-Host ""
# Write-Host "BILLING SCREEN:" -ForegroundColor White
# Write-Host "http://$ip`:5173/admin/billing" -ForegroundColor Cyan
# Write-Host ""
# Write-Host "TABLES AND QR:" -ForegroundColor White
# Write-Host "http://$ip`:5173/admin/tables" -ForegroundColor Cyan
# Write-Host ""
# Write-Host "CUSTOMER MENU (phone):" -ForegroundColor White
# Write-Host "http://$ip`:5173/menu?tableId=1" -ForegroundColor Cyan
# Write-Host ""
# Write-Host "========================================" -ForegroundColor Yellow
# Write-Host " Open ADMIN LOGIN URL in browser now!  " -ForegroundColor Green
# Write-Host "========================================" -ForegroundColor Yellow
# Write-Host ""
# Write-Host "Press any key to exit..." -ForegroundColor Gray
# $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
