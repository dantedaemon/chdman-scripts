@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
SetLocal
set from=.cue .gdi .iso
set to=.chd
for /r %%i in (*.cue, *.gdi, *.iso) do (
	set fullfilepath=%%i
	for %%x in (%from%) do (
	    echo !fullfilepath!|findstr /r "%%x$" && call set fullfilepath=%%fullfilepath:%%x=%to%%%
	)
	chdman createcd -i "%%i" -o "!fullfilepath!"
)
