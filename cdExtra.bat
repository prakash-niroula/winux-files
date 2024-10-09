@echo off

set totalCd=
:top
set toCd=%1

if [%toCd%]==[] goto :end

:: remove quotes
set toCd=%toCd:"=%

:: set to cd to that dir
if "%totalCd%"=="" (
  set totalCd=%toCd%
) else (
  set totalCd=%totalCd%/%toCd%
)
shift
goto top

:end
pcd %totalCd%