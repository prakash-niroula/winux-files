@echo off
::homepath
set hpath=%USERPROFILE%

:: dynamic path
call set dpath=%%cd:%hpath%=~%%
set dpath=%dpath:\=/%
call set dpath=%%dpath:%SystemDrive%:/=/%%

echo %dpath%