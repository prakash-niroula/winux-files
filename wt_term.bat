@echo off
::homepath
set hpath=%USERPROFILE%

:: dynamic path
call set dpath=%%cd:%hpath%=~%%
set dpath=%dpath:\=/%
call set dpath=%%dpath:%SystemDrive%:/=/%%

:: lower case macro
set lcaseMacro=for /f "tokens=* USEBACKQ" %%f IN (`lcase %%_str%%`) do (set _str=%%f)

:: computer name
set _str=%COMPUTERNAME: =% & %lcaseMacro%
set pcname=%_str%

:: user name
set _str=%USERNAME: =% & %lcaseMacro%
set uname=%_str%

:: title & prompt
title Terminal
prompt [92m%uname%@%pcname%[0m:[96m%dpath%[0m$$$S
echo.
cmd /k