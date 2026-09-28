$env:JAVA_HOME = "C:\Program Files\Java\jdk-17"
$env:Path = "$env:JAVA_HOME\bin;" + $env:Path

Write-Host "====================================================" -ForegroundColor Cyan
Write-Host "Khoi dong Spring Boot 3 & Spring Security 6 App" -ForegroundColor Cyan
Write-Host "Su dung Java 17 tai: $env:JAVA_HOME" -ForegroundColor Yellow
Write-Host "====================================================" -ForegroundColor Cyan

.\mvnw.cmd spring-boot:run
