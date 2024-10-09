@echo off
set copyFrom=%1
set copyTo=%2

:: null check
if [%copyFrom%]==[] (
  echo No file specified.
  exit /B
)

:: if no destination, it's current directory
if [%copyTo%]==[] set copyTo=.

:: remove quotes
set copyFrom=%copyFrom:"=%
set copyTo=%copyTo:"=%

:: expand dynamically on '~'
if "%copyFrom:~0,1%"=="~" set copyFrom=%USERPROFILE%%copyFrom:~1%
if "%copyTo:~0,1%"=="~" set copyTo=%USERPROFILE%%copyTo:~1%

:: expand on '/'
if "%copyFrom:~0,1%"=="/" set copyFrom=%SYSTEMDRIVE%%copyFrom%
if "%copyTo:~0,1%"=="/" set copyTo=%SYSTEMDRIVE%%copyTo%

:: replace '/' to '\' cause windows..
set copyFrom=%copyFrom:/=\%
set copyTo=%copyTo:/=\%

:: if it's a folder
if exist "%copyFrom%" if exist "%copyFrom%\*" (

:: if copyTo folder already exists
if exist "%copyTo%" if exist "%copyTo%\*" (

:: extract the lastDirName from copyFrom
for %%i in ("%copyFrom%") do set lastDirName=%%~nxi

:: re-write copyTo to include lastDirName
set copyTo="%copyTo%\%lastDirName%"

)

:: copy everything from the directory to there
robocopy /e "%copyFrom%" "%copyTo%">nul
  
) else (

:: it's a file, copy will take care of it !!
copy "%copyFrom%" "%copyTo%"

)