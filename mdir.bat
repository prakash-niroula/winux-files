@echo off
if [%*]==[] (
  echo Syntax : mdir ^<path_name^>
  exit /b
)
:loop
set origPath=%1
if [%origPath%]==[] (
  exit /b
)
set origPath=%origPath:"=%
set origPath=%origPath:/=\%
set givPath=%origPath%
if "%givPath:~0,1%"=="~" set givPath=%USERPROFILE%%givPath:~1%
if "%givPath:~0,1%"=="/" set givPath=%SYSTEMDRIVE%%givPath%

if exist "%givPath%\*" (
  echo Directory already exists --^> skipping...
) else (
  if "%origPath%"=="%givPath%" (
    echo Creating Path ./%origPath:\=/%/
  ) else (
    echo Creating Path %origPath:\=/%
  )
  set givPath=%givPath:/=\%
  mkdir "%givPath%"
)
shift /1
goto loop