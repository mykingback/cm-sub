@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

git config --global http.postBuffer 524288000
git config --global http.lowSpeedLimit 0
git config --global http.lowSpeedTime 999999

cd /d "D:\APP6\cmJIEDIAN\output"

git config core.autocrlf false
git config core.safecrlf false
git config credential.helper manager

set "FILE_TXT=king_fix.txt"
set "FILE_YAML=kingback.yaml"
set "RETRY_NUM=3"

:loop
cls
echo ==============================================
echo          Auto Sync (5min loop)
echo          Sync Files: %FILE_TXT% %FILE_YAML%
echo ==============================================

:: 强制刷新文件
copy /y "base64.txt" "%FILE_TXT%" >nul
copy /y "mihomo.yaml" "%FILE_YAML%" >nul

:: 先添加所有改动（强制检测）
git add -A

:: 判断是否有变化
git diff --cached --quiet
if errorlevel 1 (
    echo.
    echo File changed, starting sync...
    git commit -m "auto update"
    echo.
    echo Uploading to GitHub...
    
    set "PUSH_OK=0"
    for /l %%i in (1,1,%RETRY_NUM%) do (
        echo Try %%i / %RETRY_NUM% ...
        git push origin master
        if !errorlevel! equ 0 (
            set "PUSH_OK=1"
            goto push_done
        )
        echo Push failed, retry after 3s...
        timeout /t 3 /nobreak >nul
    )
:push_done
    if !PUSH_OK! equ 1 (
        echo.
        echo Sync SUCCESSFUL!
    ) else (
        echo.
        echo Sync FAILED!
    )
) else (
    echo.
    echo No change, waiting for next loop...
)

echo.
echo Wait 5 minutes for next check...
timeout /t 300 /nobreak >nul
goto loop