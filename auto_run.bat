@echo off
cd /d "D:\APP6\cmJIEDIAN\output"

:: 关闭换行符警告（彻底消除 LF/CRLF）
git config core.autocrlf false
git config core.safecrlf false

:: ===== 固定混淆名（你自己的名字）=====
set "SAFE_TXT=myking.txt"
set "SAFE_YAML=mykingback.yaml"

:loop
:: 生成固定混淆文件
copy "base64.txt" "%SAFE_TXT%" >nul
copy "mihomo.yaml" "%SAFE_YAML%" >nul

:: 只上传固定名，绝对安全
git add "%SAFE_TXT%" "%SAFE_YAML%"
git diff --cached --quiet
if %errorlevel% equ 1 (
    git commit -m "auto sync fixed"
    git push -q origin master
    echo 同步成功：%SAFE_TXT% %SAFE_YAML%
)

:: 删除临时文件
del "%SAFE_TXT%" 2>nul
del "%SAFE_YAML%" 2>nul

:: 修复 timeout 兼容问题（60秒 = 1分钟，可自己改）
timeout 60 >nul

goto loop