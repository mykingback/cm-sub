@echo off
chcp 65001
cd /d "D:\APP6\cm½Úµã³Ø\output" >nul 2>&1

:loop
git add . >nul 2>&1
git diff --cached --quiet >nul 2>&1
if errorlevel 1 (
    git commit -m "auto sync" >nul 2>&1
    git push >nul 2>&1
)
timeout /t 10 /nobreak >nul
goto loop