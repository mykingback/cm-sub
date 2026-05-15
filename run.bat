@echo off
cd /d "D:\APP6\cmJIEDIAN\output"

:: 关闭换行符警告
git config core.autocrlf false
git config core.safecrlf false

:: ====================== 固定混淆名称 ======================
set "FILE_TXT=king_fix.txt"
set "FILE_YAML=kingback.yaml"

:loop
cls
echo 正在自动同步 → %FILE_TXT% %FILE_YAML%

:: 1. 从原文件覆盖更新（关键！必须每次更新）
copy /y "base64.txt" "%FILE_TXT%" >nul
copy /y "mihomo.yaml" "%FILE_YAML%" >nul

:: 2. 只添加这两个固定文件（绝对安全）
git add "%FILE_TXT%" "%FILE_YAML%"

:: 3. 检测是否有变化，有变化才提交
git diff --cached --quiet
if %errorlevel% equ 1 (
    git commit -m "auto update"
    git push origin master
    echo ? 同步成功！GitHub 已更新
)

:: 4. 【关键】不删除本地固定文件！让 Git 持续追踪！
:: 这里我删掉了 del 命令，永远不删文件！

:: 5. 6 分钟循环一次
timeout /t 300 /nobreak >nul
goto loop