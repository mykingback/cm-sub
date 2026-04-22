@echo off
chcp 65001
cd /d D:\APP6\cm½Úµã³Ø\output

:loop
git add .
git diff --cached --quiet
if %errorlevel% neq 0 (
    git commit -m "auto sync"
    git push
)
timeout /t 10 /nobreak >nul
goto loop