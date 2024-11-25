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
set SCRIPT_FILE="%~dp0src\clipocr.pyw"
set INSTALL_DIR="C:\Program Files\ClipOCR"

:: Check if running as administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
	echo [!] This script must be run as administrator.
	echo.
	pause
	exit /b 1
)

:: Check for Python executable
where python >nul 2>&1
if %errorlevel% neq 0 (
	echo [!] Error: Python not found. Please install python and add it to system ENV Path
	echo.
	pause
	exit /b 1
) else (
	echo [+] Python found, continuing setup...
	echo.
)

:: Check for Tesseract executable
where tesseract >nul 2>&1
if %errorlevel% neq 0 (
	echo [!] Error: Tesseract not found. Please install tesseract and add it to system ENV Path.
	echo.
	echo [Download Tesseract]: https://github.com/tesseract-ocr/tesseract
	echo.
	pause
	exit /b 1
) else (
	echo [+] Tesseract found, continuing setup...
	echo.
)

:: Check and install dependencies
pip install pillow pytesseract pyperclip >nul 2>&1
if %errorlevel% neq 0 (
    echo [-] Failed to install dependencies. Ensure Python and pip are correctly installed.
    pause
    exit /b 1
) else (
	echo [+] Python dependencies installed successfully.
	echo.
)

:: Ensure installation directory exists
if not exist %INSTALL_DIR% (
    mkdir %INSTALL_DIR%
    if %errorlevel% neq 0 (
	echo [!] Error: Failed to create installation directory.
        echo.
        pause
        exit /b 1
    ) else (
        echo [+] Installation directory created successfully: %INSTALL_DIR%
	echo.
    )
) else (
	echo [+] Installation directory already exists: %INSTALL_DIR%
	echo.
)

:: Copy the Python script to the installation directory
copy /Y "%SCRIPT_FILE%" %INSTALL_DIR% >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Error: Failed to copy Python script to installation directory.
    echo.
    pause
    exit /b 1
) else (
    echo [+] Copied %SCRIPT_FILE% to installation directory...
    echo.
)

:: Creating desktop shorcut
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut([Environment]::GetFolderPath('Desktop') + '\clipocr.lnk'); $Shortcut.TargetPath = 'C:\Program Files\ClipOCR\clipocr.pyw'; $Shortcut.Hotkey = 'Ctrl+Alt+C'; $Shortcut.Save();" >nul 2>&1
if %errorlevel% neq 0 (
    echo [-] Failed to create desktop shortcut. Check PowerShell permissions.
    pause
    exit
)

:: Confirm completion
echo [+] Installation completed successfully! You can now run clipocr using Ctrl+Alt+C.
echo.
pause
