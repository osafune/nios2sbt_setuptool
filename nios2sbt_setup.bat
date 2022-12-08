@echo off
echo -----------------------
echo  NiosII EDS Setup tool
echo -----------------------

set SCRIPT_DRIVE=%~d0
set SCRIPT_PATH=%~p0

rem ***** WSL setup *****
echo Setup WSL ...

set _DRV=%SCRIPT_DRIVE:~0,1%
for %%i in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do call set _DRV=%%_DRV:%%i=%%i%%
set _STR=%SCRIPT_PATH:~1,-1%
set SH_NAME=/mnt/%_DRV%/%_STR:\=/%/nios2sbt_setup.sh

wsl "%SH_NAME%"
echo.

rem ***** Eclipse setup *****
set MARS2_ZIP=eclipse-cpp-mars-2-win32-x86_64.zip
set MARS2_ZIP_MD5=6c29aabb67bd8f5a52de85e2382fccbe
set MARS2_URL=https://archive.eclipse.org/technology/epp/downloads/release/mars/2/%MARS2_ZIP%
set MARS2_NAME=%SCRIPT_DRIVE%%SCRIPT_PATH%%MARS2_ZIP%
set MARS2_PATH=%SOPC_KIT_NIOS2%\bin
set PLUGINS_NAME=%MARS2_PATH%\eclipse_nios2_plugins.zip

if not exist "%PLUGINS_NAME%" (
    echo [!] The installed QuartusPrime version is different.
	echo.
	pause
	exit
) 

if exist "%MARS2_PATH%\eclipse_nios2\" (
	echo [!] eclipse_nios2 already exists. Please delete the folder and try again.
	echo.
	pause
	exit
)

if not exist "%MARS2_NAME%" goto :zip_file_download

set SCRIPT_TEMPLOG=%TEMP%\nios2sbt_setup_log%RANDOM%.tmp
certutil -hashfile "%MARS2_NAME%" MD5>"%SCRIPT_TEMPLOG%"

for /f "usebackq skip=1" %%i in ("%SCRIPT_TEMPLOG%") do (
	set _HASH=%%i
	goto :break_loop
)
:break_loop
del "%SCRIPT_TEMPLOG%"

rem echo _HASH=%_HASH%
if %_HASH% == %MARS2_ZIP_MD5% goto :zip_file_extract

:zip_file_download
echo Downloading CDT package...
powershell Invoke-WebRequest '%MARS2_URL%' -OutFile '%MARS2_NAME%'

:zip_file_extract
echo Installing eclipse...
powershell Expand-Archive -Path '%MARS2_NAME%' -DestinationPath '%MARS2_PATH%' -Force
rename "%MARS2_PATH%\eclipse" eclipse_nios2
powershell Expand-Archive -Path '%PLUGINS_NAME%' -DestinationPath '%MARS2_PATH%' -Force


echo Installation finished.
echo.
pause
