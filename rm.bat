@echo off
setlocal enabledelayedexpansion

if [%1]==[] goto :syntax

set checkOpt=+
:checkOpt

:: check for options
set curOpt=%1

if [%curOpt%]==[] goto :syntax
set curOpt=%curOpt:"=%
if [%curOpt:~0,1%]==[-] (
  set checkOpt=%checkOpt% %curOpt%
  shift /1
  goto checkOpt
) else (
  set curOpt=
)

:loop
set rmOpt=
:: remove quotes from toRemove
set toRemove=%1
if [%toRemove%]==[] exit /B

set toRemove=%toRemove:"=%
if "%toRemove:~0,1%"=="~" set toRemove=%USERPROFILE%%toRemove:~1%
if "%toRemove:~0,1%"=="/" set toRemove=%SYSTEMDRIVE%%toRemove:~1%
set toRemove=%toRemove:/=\%

:: check if it doesn't exist
if not exist "%toRemove%" (
  echo Does not exist..
  exit /b 1
)

:: check if file or folder
if exist "%toRemove%" if exist "%toRemove%\*" (

:: it's a folder so use rmdir
set rmOpt=rmdir
:: check for options -r -f -rf ( -l = legacy )
if not "x%checkOpt:r=%"=="x%checkOpt%" set rmOpt=!rmOpt! /s
if not "x%checkOpt:f=%"=="x%checkOpt%" set rmOpt=!rmOpt! /q
if not "x%checkOpt:l=%"=="x%checkOpt%" (
  set rmOpt=!rmOpt! %1
  shift /1
)
  
) else (

:: it's a file so use del
set rmOpt=del /q

:: check for options -s -f -rf where -l = legacy, not using -r but -s ( muscle memory rm -rf can cause problems here ;)
if not "x%checkOpt:s=%"=="x%checkOpt%" set rmOpt=!rmOpt! /s
if not "x%checkOpt:f=%"=="x%checkOpt%" set rmOpt=!rmOpt! /f
if not "x%checkOpt:l=%"=="x%checkOpt%" (
  set rmOpt=!rmOpt! %1
  shift /1
)
)

%rmOpt% "%toRemove%"

shift /1
goto loop

:syntax
echo Syntax : %0 [-r/-f/-rf/-s] (file/folder) & exit /b
exit /b 1