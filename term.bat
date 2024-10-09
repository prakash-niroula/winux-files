@echo off
:: dynamic path
if "%TERM_PROMPT_PATH_RAW%"=="%cd%" goto :end
::homepath
set hpath=%USERPROFILE%
set dpath=%cd%
call set dpath=%%cd:%hpath%=~%%
call set "dpath=%%dpath:%SystemDrive%=%%"
set dpath=%dpath:\=/%
call set TERM_PROMPT_PATH_RAW=%cd%
call set TERM_PROMPT_PATH=%dpath%
set TERM_PROMPT_MODE=
:end
@prompter