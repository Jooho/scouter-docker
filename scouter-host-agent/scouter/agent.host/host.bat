@echo off
setlocal
set originDir=%cd%
cd /D %~dp0
java -classpath ./scouter.host.jar   scouter.boot.Boot ./lib
cd /D %originDir%
echo "Host Agent Stopped..."
pause
