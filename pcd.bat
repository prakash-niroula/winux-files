@echo off
set toCd=%*
if "%toCd%"=="" (
  set toCd=~
)
set toCd=%toCd:/=\%
if "%toCd:~0,1%"=="~" set toCd=%USERPROFILE%%toCd:~1%
if "%toCd:~0,1%"=="/" set toCd=%SYSTEMDRIVE%%toCd:~1%
cd /d %toCd%
@term