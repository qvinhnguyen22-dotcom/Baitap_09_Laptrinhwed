# Script tao User tu dong qua REST API
$headers = @{ "Content-Type" = "application/json; charset=utf-8" }

Write-Host "Dang tao user ADMIN (trung)..." -ForegroundColor Cyan
$adminBody = '{"name":"trung","password":"123","email":"trungnh@hcmute.edu.vn","roles":"ROLE_ADMIN"}'
$res1 = Invoke-RestMethod -Uri "http://localhost:8080/user/new" -Method Post -ContentType "application/json" -Body $adminBody
Write-Host "Ket qua: $res1" -ForegroundColor Green

Write-Host "`nDang tao user USER (user)..." -ForegroundColor Cyan
$userBody = '{"name":"user","password":"123","email":"user@gmail.com","roles":"ROLE_USER"}'
$res2 = Invoke-RestMethod -Uri "http://localhost:8080/user/new" -Method Post -ContentType "application/json" -Body $userBody
Write-Host "Ket qua: $res2" -ForegroundColor Green

Write-Host "`n=== Kiem tra dang nhap & phan quyen ===" -ForegroundColor Yellow
$adminAuth = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("trung:123"))
$userAuth = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("user:123"))

Write-Host "`n1. Goi GET /customer/all voi tai khoan ADMIN (trung):" -ForegroundColor Cyan
$adminResult = Invoke-RestMethod -Uri "http://localhost:8080/customer/all" -Method Get -Headers @{Authorization=("Basic " + $adminAuth)}
$adminResult | Format-Table

Write-Host "`n2. Goi GET /customer/001 voi tai khoan USER (user):" -ForegroundColor Cyan
$userResult = Invoke-RestMethod -Uri "http://localhost:8080/customer/001" -Method Get -Headers @{Authorization=("Basic " + $userAuth)}
$userResult | Format-List
