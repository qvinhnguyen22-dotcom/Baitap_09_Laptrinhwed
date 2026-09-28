@echo off
set "JAVA_HOME=C:\Program Files\Java\jdk-17"
set "PATH=%JAVA_HOME%\bin;%PATH%"

echo ====================================================
echo Starting Spring Boot 3 & Spring Security 6 Application
echo Using Java: %JAVA_HOME%
echo ====================================================

call mvnw.cmd spring-boot:run
pause
