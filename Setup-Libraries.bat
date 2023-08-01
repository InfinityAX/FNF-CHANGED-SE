@echo off
echo Installing libraries...
haxelib install hmm
haxelib run hmm install
echo Installed.
echo Opening PECG guide...
start https://gamebanana.com/tuts/15301
echo Press any key to exit.
pause >nul
