@echo off
chcp 65001
cd D:\APP6\cm节点池\output

:loop
git add . >nul 2>&1
git diff --cached --quiet >nul 2>&1
if errorlevel 1 (
    git commit -m "auto sync" >nul 2>&1
    git push >nul 2>&1
    echo %date% %time% 同步成功
)
timeout /t 10 /nobreak >nul
goto loop