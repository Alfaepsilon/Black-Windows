To build the ISO, you can use the oscdimg tool that comes installed with Windows ADK:
```
oscdimg -n -m -bC:\<path>\Win11_English_x64v1\boot\etfsboot.com C:\<path>\Win11_English_x64v1 Win11_Unattended.iso
```
Note: Probably want to use a Windows 11 ISO due to Windows 10 EOL.
