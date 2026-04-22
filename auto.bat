@echo off
chcp 65001
cd /d "D:\APP6\cm节点池\output"

:loop
git add .
git diff --cached --quiet
if errorlevel 1 (
    git commit -m "auto sync"
    git push
    echo ? 同步成功
)
echo 等待下一次检查...
timeout /t 10 /nobreak >nul
goto loop