@echo off
@REM To install software onto the system during setup, winget is used as it is native to Windows. The software to be installed can be configured by editing the "requirements.txt" file
for /f %%p in (software.txt) do (
    winget install --id=%%p -e --source winget --silent --accept-package-agreements --accept-source-agreements
)

@REM To install Visual Studio Code extensions during setup, the "code" executable is used
for /f %%p in (vscode_extensions.txt) do (
    code --install-extension %%p
)
