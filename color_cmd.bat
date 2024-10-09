@echo off
set colorCode=[
set toEcho=
set color=
set colorClose=%colorCode%0m
if "%1"=="ext" (
  set colorClose=
  shift
)
:loop
if "%1"=="" goto end
if "%1"=="-c" (
  set "toEcho=%toEcho%%colorCode%%2m"
  set color=y
  shift
) else (
  if "%1%"=="-s" (
    set "toEcho=%toEcho% "
  ) else (
  if "%color%"=="y" (
    set "toEcho=%toEcho%%1"
    set color=
  ) else (
    if "%toEcho%"=="" (set "toEcho=%1") else (set "toEcho=%toEcho% %1")
  ))
)
shift
goto loop
:end
if "%toEcho%"=="" goto close
set toEcho=%toEcho:--c=-c%
set toEcho=%toEcho:--s=-s%

:close
echo %toEcho%%colorClose%