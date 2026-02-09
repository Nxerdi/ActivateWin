@echo off
title Windows Setup Utility

echo ======================================
echo   Activate Windows?
echo ======================================
echo 1. Yes
echo 2. No
echo.
set /p activate_choice=Enter your choice: 

if "%activate_choice%"=="1" goto key_menu
if "%activate_choice%"=="2" goto skip_activation

echo Invalid input. Skipping activation.
goto skip_activation

cls
echo ==========================================================
echo                WINDOWS VERSION SELECTION
echo ==========================================================
:key_menu
echo 1. Windows 10/11 Pro
echo 2. Windows 10/11 Corp
echo 3. Windows 10/11 Home
echo 4. Windows Server 1803
echo 0. Exit
echo.
set /p choice=Enter number: 

REM Check user selection
if "%choice%"=="1" set key=W269N-WFGWX-YVC9B-4J6C9-T83GX & goto apply
if "%choice%"=="2" set key=NPPR9-FWDCX-D2C8J-H872K-2YT43 & goto apply
if "%choice%"=="3" set key=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99 & goto apply
if "%choice%"=="4" set key=PTXN8-JFHJM-4WC78-MPCBR-9W4KR & goto apply
if "%choice%"=="0" exit

echo Invalid selection. Please try again.
pause
goto menu

:apply
cls
echo You selected key:
echo %key%
echo.
echo installing key...

REM Enter official KMS client key
slmgr /ipk %key%

echo.
echo Key installed
echo (activation not perfomed - only key input)
echo.

echo.
echo run the activation service...
slmgr /skms kms.digiboy.ir
echo.

echo.
echo Activate Windows...
slmgr /ato
echo Activation completed.

:skip_activation

:after_activation

echo ======================================
echo   Choose Windows Theme
echo ======================================
echo 1. Dark Theme
echo 2. Light Theme
echo.
set /p theme_choice=Enter your choice: 

if "%theme_choice%"=="1" (
    echo Applying dark theme...
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f >nul
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f >nul
    echo Dark theme applied.
) else (
    echo Applying light theme...
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 1 /f >nul
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 1 /f >nul
    echo Light theme applied.
)
echo.
timeout /t 1 >nul

echo ==========================================================
echo                DISABLE UNNECESSARY SERVICES
echo ==========================================================
echo Disabling telemetry services...

sc stop DiagTrack >nul
sc config DiagTrack start= disabled >nul

sc stop dmwappushservice >nul
sc config dmwappushservice start= disabled >nul

sc stop WSearch >nul
sc config WSearch start= disabled >nul

echo Services disabled.
echo.
timeout /t 1 >nul

echo ==========================================================
echo                REMOVE WIDGETS / NEWS / ADS
echo ==========================================================
echo Removing Widgets and News...

reg add "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /v AllowNewsAndInterests /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v ShellFeedsTaskbarViewMode /t REG_DWORD /d 2 /f >nul

echo Widgets and News removed.
echo.
timeout /t 1 >nul

echo ======================================
echo Visual Effects Configuration
echo ======================================
echo Do you want to disable animations,
echo shadows and visual effects?
echo.
echo 1. Yes, maximum performance
echo 2. No, keep Windows visuals
echo.
set /p perf_choice=Enter your choice: 

if "%perf_choice%"=="1" goto perf_optimize
if "%perf_choice%"=="2" goto perf_skip

echo Invalid input. Skipping.
goto perf_skip

:perf_optimize
echo Applying maximum performance settings...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul
reg add "HKCU\Software\Microsoft\Windows\DWM" /v UseAnimations /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\DWM" /v EnableAeroPeek /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul

echo Visual effects disabled.
goto after_perf

:perf_skip
echo Keeping default visual settings.
goto after_perf

:after_perf
echo.
timeout /t 1 >nul

echo ==========================================================
echo               SYSTEM INFORMATION OUTPUT
echo ==========================================================
echo Collecting system information...
echo.

echo --- CPU ---
wmic cpu get Name
echo.

echo --- GPU ---
wmic path win32_VideoController get Name
echo.

echo --- RAM ---
wmic MemoryChip get Manufacturer,PartNumber,Capacity,Speed
echo.

echo --- Storage ---
wmic diskdrive get Model,Size
echo.

echo All tasks completed.
pause
exit
