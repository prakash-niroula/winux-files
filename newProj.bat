@echo off
set pDir=
set projName=%2
set curDir=
if "%1"=="--name" (
  set "projName=%projName:"=%"
  shift
  shift
) else (
  set projName=
)
if "%projName%"=="" (
  for %%x in ("%*") do set projName=%%~nxx
)
:loop
set curDir=%1
if [%curDir%]==[] goto end
set curDir=%curDir:"=%
if "%pDir%"=="" (
  set pDir=%1
) else (
  set pDir=%pDir%/%1
)
shift
goto loop
:end
if exist "%pDir%" (
  call color_cmd -c 91 Error : the directory `~/Projects/%pDir%` already exists.
  call color_cmd -c 91 Quitting...
  exit /b
)
call mdir ~/Projects/%pDir%
call pcd ~/Projects/%pDir%
call git init>nul
for /f "tokens=*" %%x in ('date /t') do set dt=%%x
for /f "tokens=*" %%y in ('time /t') do set tm=%%y
(echo /.vscode & echo /.proj_info & echo /.proj_neofetch & echo /.proj_last_neofetch ) > .gitignore
(echo %dt%;%tm%;%projName%)>.proj_info
call color_cmd ext -c 96 ---------------------------------------;>.proj_neofetch
call color_cmd -c 93 -s -s Project -s -c 92 : `%projName%`;>>.proj_neofetch
call color_cmd ext -c 96 ---------------------------------------;>>.proj_neofetch
call color_cmd -c 93 -s -s Created on : -s -c 92 %dt% -s -c 93 at -c 95 -s %tm%;>>.proj_neofetch
rem call color_cmd ext -c 93 -s -s Updated on : -s -c 92 %dateP% -s -c 93 at -c 95 -s %timeP%;>>.proj_last_neofetch
call color_cmd -c 96 ---------------------------------------;>>.proj_neofetch
call projProps