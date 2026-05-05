@echo off
cd /d "D:\APP6\cmJIEDIAN\output"

:: 清理 GitHub 上所有旧的随机混淆文件
git rm --cached cfg_*.txt rule_*.yaml 2>nul
git commit -m "clean all old random files"
git push origin master

echo ? 清理完成！GitHub 已无旧随机文件
pause