To build the ISO, you can use the oscdimg tool that comes installed with Windows ADK (the command is for VMWare Workstation compatability):
```
oscdimg -m -o -udfver102 -bootdata:2#p0,e,bC:\<path>\Win11_English_x64v1\boot\etfsboot.com#pEF,e,bC:\<path>\Win11_English_x64v1\efi\microsoft\boot\efisys.bin C:\<path>\Win11_English_x64v1 Win11_Unattended.iso
```
Note: Probably want to use a Windows 11 ISO due to Windows 10 EOL.
