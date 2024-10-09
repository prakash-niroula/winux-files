@echo off
set moveFrom=%1
set moveTo=%2

:: null check
if [%moveFrom%]==[] (
  echo No file specified.
  exit /B
)

:: if no destination, it's current directory
if [%moveTo%]==[] set moveTo=.

:: remove quotes
set moveFrom=%moveFrom:"=%
set moveTo=%moveTo:"=%

:: expand dynamically on '~'
if "%moveFrom:~0,1%"=="~" set moveFrom=%USERPROFILE%%moveFrom:~1%
if "%moveTo:~0,1%"=="~" set moveTo=%USERPROFILE%%moveTo:~1%

:: expand on '/'
if "%moveFrom:~0,1%"=="/" set moveFrom=%SYSTEMDRIVE%%moveFrom%
if "%moveTo:~0,1%"=="/" set moveTo=%SYSTEMDRIVE%%moveTo%

:: replace '/' to '\' cause windows..
set moveFrom=%moveFrom:/=\%
set moveTo=%moveTo:/=\%

:: move works for both folders & files hehe
move "%moveFrom%" "%moveTo%"