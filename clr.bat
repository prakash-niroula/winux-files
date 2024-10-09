@echo off
cls
if "%TERM_PROMPT_PATH_RAW%"=="%cd%" goto :end
call term
:end
:: If in a project, be sure to show the project props. after clearing screen ;)
if "%TERM_PROMPT_PATH:~0,11%"=="~/Projects/" call projProps