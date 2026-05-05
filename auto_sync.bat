@echo off
chdir /d "D:\APP6\cmJIEDIAN\output"

:: 生成随机串 用于文件名混淆
set "r1=%random%%random%%random%"
set "r2=%random%%random%%random%"

:: 临时随机文件名
set "f1=cfg_%r1%.txt"
set "f2=rule_%r2%.yaml"

:: 复制原文件为随机名（本地原名不变）
copy "base64.txt" "%f1%" >nul
copy "mihomo.yaml" "%f2%" >nul

:: Git 提交推送
git add .
git commit -m "Auto Sync Confuse FileName %date% %time%"
git push origin master

:: 删除本地临时随机文件 不留痕迹
del "%f1%" 2>nul
del "%f2%" 2>nul