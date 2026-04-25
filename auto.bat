@echo off
:: 强制进入正确目录
cd /d "D:\APP6\cmJIEDIAN\output"

:loop
:: 检测变更
git add .
git diff --cached --quiet
if %errorlevel% EQU 1 (
    git commit -m "auto sync update"
    git push
    echo.
    echo ========== Sync Success ==========
)
:: 设置间隔，这里设20秒
timeout /t 360 /nobreak >nul
goto loop