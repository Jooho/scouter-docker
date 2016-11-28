@echo off
setlocal
set originDir=%cd%
cd /D %~dp0
del *.scouter
cd /D %originDir%
echo "requested to stop Host agent..."
pause