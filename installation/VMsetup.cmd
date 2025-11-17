@echo off
setlocal

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

@REM Change directory to same as cmd script
cd "%~dp0"

@REM Extract ISO contents to a folder.
"C:\Program Files\WinRAR\WinRAR.exe" x -o+ Win11_Unattended.iso *.* Win11_Unattended\

@REM Copy autounattend.xml file into ISO folder, overwriting it if it exists.
xcopy /Y autounattend.xml Win11_Unattended\

@REM Generate new Windows 11 ISO with autounattend.xml file.
"C:\Program Files\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\Oscdimg\oscdimg.exe" -m -o -udfver102 "-bootdata:2#p0,e,bWin11_Unattended\boot\etfsboot.com#pEF,e,bWin11_Unattended\efi\microsoft\boot\efisys.bin" Win11_Unattended Win11_Unattended.iso

@REM Create virtual disk for machine (default is 64 GB so I stuck with that)
vmware-vdiskmanager -c -s 64GB -a lsilogic -t 2 Black-Windowsv2.vmdk

@REM Start Virtual Machine using VSIX configuration file to skip tedious setup windows.
vmrun start "Black-Windowsv2.vmx" nogui

@REM @REM Takes a snapshot directly after VM installation.
@REM vmrun snapshot "Black-Windowsv2.vmx" "CleanInstall"
endlocal
