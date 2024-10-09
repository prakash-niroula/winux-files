
:: lower case macro
set lcaseMacro=for /f "tokens=* USEBACKQ" %%f IN (`lcase %%_str%%`) do (set _str=%%f)

:: computer name
if not "%TERM_PROMPT_PCNAME%"=="" goto skip1
set _str=%COMPUTERNAME: =% & %lcaseMacro%
set TERM_PROMPT_PCNAME=%_str%
:skip1

:: user name
if not "%TERM_PROMPT_UNAME%"=="" goto skip2
set _str=%USERNAME: =% & %lcaseMacro%
set TERM_PROMPT_UNAME=%_str%
:skip2

:: title & prompt
title Terminal
prompt [92m%TERM_PROMPT_UNAME%@%TERM_PROMPT_PCNAME%[0m:[96m%TERM_PROMPT_PATH%[0m$$$S