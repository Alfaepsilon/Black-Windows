@echo off
setlocal
@REM Add exclusion path for pentesting tools.
powershell.exe -c "Add-MpPreference -ExclusionPath 'C:\Users\Administrator\Tools'"
