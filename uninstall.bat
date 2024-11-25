@echo off
cls
echo ##############################################################
echo #------------------------------------------------------------#
echo #                        ClipOCR                             #
echo #------------------------------------------------------------#
echo ################### Author: cipherswami ######################
echo ##############################################################
echo.
setlocal

:: Set up script parameters
set APLICATION_NAME="clipocr"
set INSTALL_DIR="C:\Program Files\ClipOCR"
set SCRIPT_FILE="%INSTALL_DIR%\clipocr.pyw"
set SHORTCUT_PATH="%USERPROFILE%\Desktop\clipocr.lnk"

:: Check if running as administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
	echo [!] This script must be run as administrator.
	echo.
	pause
	exit /b 1
)

:: Check if the installation directory exists
if not exist %INSTALL_DIR% (
    echo [!] ClipOCR installation not found.
    echo.
    pause
    exit /b 1
) else (
    echo [+] Found ClipOCR installation directory: %INSTALL_DIR%
    echo.
)

:: Remove the Python script from the installation directory
del /Q "%SCRIPT_FILE%"
if %errorlevel% neq 0 (
    echo [!] Error: Failed to delete Python script from installation directory.
    echo.
    pause
    exit /b 1
) else (
    echo [+] Deleted Python script from installation directory.
    echo.
)

:: Remove the desktop shortcut
if exist %SHORTCUT_PATH% (
    del /Q "%SHORTCUT_PATH%"
    if %errorlevel% neq 0 (
        echo [!] Error: Failed to delete desktop shortcut.
        echo.
        pause
        exit /b 1
    ) else (
        echo [+] Deleted desktop shortcut.
        echo.
    )
) else (
    echo [!] No desktop shortcut found.
    echo.
)

:: Remove the installation directory if empty
rmdir /S /Q %INSTALL_DIR%
if %errorlevel% neq 0 (
    echo [!] Error: Failed to remove installation directory.
    echo.
    pause
    exit /b 1
) else (
    echo [+] Removed installation directory: %INSTALL_DIR%
    echo.
)

:: Confirm uninstallation completion
echo [+] Uninstallation completed successfully.
echo.
pause
