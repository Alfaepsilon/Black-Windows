@echo off
SETLOCAL EnableDelayedExpansion

goto :banner

:main
echo Configuring system...
call configuration\config.cmd

echo Installing tools
call tooling\tooling.cmd

:banner
setlocal
color 01
rem Read and print lines that start with "::" from the data section below
for /f "usebackq delims=" %%A in (`findstr /b "::" "%~f0"`) do (
    rem Strip the leading "::" and print the rest verbatim
    set "line=%%A"
    echo(!line:~2!
)

endlocal
goto :main

::  ____  _            _        __          ___           _                   
:: |  _ \| |          | |       \ \        / (_)         | |                  
:: | |_) | | __ _  ___| | _______\ \  /\  / / _ _ __   __| | _____      _____ 
:: |  _ <| |/ _` |/ __| |/ /______\ \/  \/ / | | '_ \ / _` |/ _ \ \ /\ / / __|
:: | |_) | | (_| | (__|   <        \  /\  /  | | | | | (_| | (_) \ V  V /\__ \
:: |____/|_|\__,_|\___|_|\_\        \/  \/   |_|_| |_|\__,_|\___/ \_/\_/ |___/
