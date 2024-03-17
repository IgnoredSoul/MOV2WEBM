@echo off

REM Unicode uwu (https://stackoverflow.com/a/47843552)
chcp 65001
cls

REM Check if any arguments are passed
if "%~1"=="" (
    echo No files dropped. Exiting...
    pause
    exit /b
)

REM Loop through all dropped files
for %%i in (%*) do (
    REM Check if the dropped file has the .mov extension
    if /I "%%~xi"==".mov" (
        echo Converting: "%%~nxi" to "%%~ni.webm"
        echo ----------------------------------------------
        ffmpeg -i "%%~fi" -c:v libvpx-vp9 -b:v 0 -crf 15 "%%~dpni.webm" -hide_banner -v error -stats 2>&1 | findstr /r /c:"frame=\|time="
        echo Conversion of "%%~nxi" completed successfully.
        echo ----------------------------------------------
    ) else (
        echo Skipping non-MOV file: "%%~nxi"
    )
)

echo All conversions completed. [S♥UL] 
pause
