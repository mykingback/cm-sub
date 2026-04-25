@echo off
cd /d D:\APP6\cmJIEDIAN\output

:loop
git add . 2>nul
git diff --cached --quiet 2>nul
if errorlevel 1 (
    git commit -m "auto sync" 2>nul
    git push 2>nul
)
timeout /t 10 /nobreak >nul
goto loop