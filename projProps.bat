@echo off
set projFpath=%1
if "%projFpath%"=="" set projFpath=.
set projFpath=%projFpath:"=%
if "%projFpath:~0,1%"=="~" set projFpath=%USERPROFILE%%projFpath:~1%
if "%projFpath:~0,1%"=="/" set projFpath=%SYSTEMDRIVE%%projFpath%
set projFpath=%projFpath:/=\%
set projFpathRaw=%projFpath%
set projFpath=%projFpath%\.proj_info
if not exist "%projFpath%" goto end
set /p dateTimeP=< "%projFpath%"
for /f "tokens=1 delims=;" %%x in ("%dateTimeP%") do set dateP=%%x
for /f "tokens=2 delims=;" %%x in ("%dateTimeP%") do set timeP=%%x
for /f "tokens=3 delims=;" %%x in ("%dateTimeP%") do set projName=%%x
rem call color_cmd ext -c 96 ---------------------------------------
rem call color_cmd -c 93 -s -s Project -s -c 92 : `%projName%`
rem call color_cmd ext -c 96 ---------------------------------------
rem call color_cmd -c 93 -s -s Created on -s -c 92 %dateP% -s -c 93 at -c 95 -s %timeP%
rem call color_cmd ext -c 93 -s -s Updated on -s -c 92 %dateP% -s -c 93 at -c 95 -s %timeP%
rem call color_cmd -c 96 ---------------------------------------
for /f "tokens=* USEBACKQ" %%x in ("%projFPathRaw%\.proj_neofetch") do echo %%x
echo.
:end