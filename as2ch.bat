@echo off
set toEnd=`
set toLoopStr=%*
call set "toLoopStr=%toLoopStr%%toEnd%"
set ret=
:loop
if "%toLoopStr%"=="%toEnd%" goto :end
set curChar=%toLoopStr:~0,1%
set rt=%curChar%
call :%curChar% rt 2>nul
call set "ret=%ret%%rt%"
set "toLoopStr=%toLoopStr:~1%"
goto :loop
:end
echo %ret%
exit /b
:A
set %1=a&goto :eof
:A 
set %1=a&goto :eof 
:B 
set %1=b&goto :eof 
:C 
set %1=c&goto :eof 
:D 
set %1=d&goto :eof 
:E 
set %1=e&goto :eof 
:F 
set %1=f&goto :eof 
:G 
set %1=g&goto :eof 
:H 
set %1=h&goto :eof 
:I 
set %1=i&goto :eof 
:J 
set %1=j&goto :eof 
:K 
set %1=k&goto :eof 
:L 
set %1=l&goto :eof 
:M 
set %1=m&goto :eof 
:N 
set %1=n&goto :eof 
:O 
set %1=o&goto :eof 
:P 
set %1=p&goto :eof 
:Q 
set %1=q&goto :eof 
:R 
set %1=r&goto :eof 
:S 
set %1=s&goto :eof 
:T 
set %1=t&goto :eof 
:U 
set %1=u&goto :eof 
:V 
set %1=v&goto :eof 
:W 
set %1=w&goto :eof 
:X 
set %1=x&goto :eof 
:Y 
set %1=y&goto :eof 
:Z 
set %1=z&goto :eof 
