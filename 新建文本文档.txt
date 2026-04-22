@echo off
chcp 65001
cd /d "D:\APP6\cm节点池\output"

:loop
:: 检测文件变化
git add .
:: 只在有改动时提交，避免空提交报错
git diff --cached --quiet
if not %errorlevel% equ 0 (
    git commit -m "自动同步：本地文件更新"
    git push
    echo 【%date% %time%】已同步更新到GitHub
)
timeout /t 8 /nobreak >nul
goto loop