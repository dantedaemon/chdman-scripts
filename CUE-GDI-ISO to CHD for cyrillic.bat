@echo off
@chcp 65001 >NUL
SETLOCAL ENABLEDELAYEDEXPANSION
SetLocal
set chdmanDir=%cd%
set from=.cue .gdi .iso
set to=.chd
for /r %%i in (*.cue, *.gdi, *.iso) do (
	set fullfilepath=%%i
	set file=%%~ni%%~xi
	echo !fullfilepath!|findstr /r "!file!$" && call set directory=%%fullfilepath:!file!=%%
	echo "cd !directory!"
	cd "!directory!"
	"%chdmanDir%\chdman.exe" createcd -i "!file!" -o "%%~ni%to%"
)
