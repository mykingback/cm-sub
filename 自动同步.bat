@echo off
echo =============================================
echo  自动监听文件夹变化 + 实时同步到 GitHub
echo  一旦文件修改/新增/删除，立即自动上传
echo  窗口不要关，最小化即可
echo  https://github.com/mykingback/cm-sub
echo  同步目录：D:\APP6\cm节点池\output
echo =============================================
echo.

:loop
git add .
git commit -m "自动同步更新"
git push

echo.
echo 等待 5 秒后再次检查...
echo.
timeout /t 5 /nobreak >nul
goto loop