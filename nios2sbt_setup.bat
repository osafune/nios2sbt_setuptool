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
set MARS2_URI=https://archive.eclipse.org/technology/epp/downloads/release/mars/2/%MARS2_ZIP%
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

echo Downloading CDT package...
powershell Invoke-WebRequest '%MARS2_URI%' -OutFile '%MARS2_NAME%'

echo Installing eclipse...
powershell Expand-Archive -Path '%MARS2_NAME%' -DestinationPath '%MARS2_PATH%' -Force
rename "%MARS2_PATH%\eclipse" eclipse_nios2
powershell Expand-Archive -Path '%PLUGINS_NAME%' -DestinationPath '%MARS2_PATH%' -Force

echo Installation finished.
echo.
pause
