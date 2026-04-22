@echo off
chcp 65001
cd /d "D:\APP6\cm节点池\output"

:loop
git add .
git diff --cached --quiet
if not %errorlevel% equ 0 (
    git commit -m "自动同步更新"
    git push
    echo 同步成功
)
timeout /t 1000 /nobreak >nul
goto loop