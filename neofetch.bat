@echo off
for /f "tokens=*" %%d in ('date /t') do set dt=%%d
for /f "tokens=*" %%d in ('time /t') do set tt=%%d
echo ________________________________________________________
echo.
echo.  %TERM_PROMPT_UNAME%@%TERM_PROMPT_PCNAME% : %dt%
echo.
echo.   working in %TERM_PROMPT_PATH% at %tt%
echo ________________________________________________________
