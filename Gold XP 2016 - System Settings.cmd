ECHO.
ECHO ------------------------[Gold XP 2016 - System Settings]-------------------------

ECHO.
ECHO Executing file "Gold XP 2016 - System Settings.reg"...
REG LOAD "HKU\TempHive" "%AllUsersProfile%\..\Default User\NTUSER.DAT" 1>NUL
REGEDIT /S "Gold XP 2016 - System Settings.reg"
REG UNLOAD "HKU\TempHive" 1>NUL

ECHO.
ECHO Deleting Windows Catalog shortcut in the "Start Menu -> All Programs" menu...
DEL "%AllUsersProfile%\Start Menu\Windows Catalog.lnk" 2>NUL

ECHO.
ECHO Deleting Set Program Access and Defaults shortcut in
ECHO the "Start Menu -> All Programs" menu...
DEL "%AllUsersProfile%\Start Menu\Set Program Access and Defaults.lnk" 2>NUL

RMDIR "C:\Documents and Settings\M SADEEM\Start Menu\Programs\Powertoys for Windows XP" /S /Q

RMDIR "C:\Windows\Resources\Themes\Luna" /S /Q

DEL "C:\Windows\Resources\Themes\Luna.theme" /S /Q

DEL "C:\Windows\Web\Wallpaper\bliss.jpg" /S /Q

ECHO.
ECHO Adding Control Panel Items...
:: Adds UserPasswords2 (Windows 2000 User Account Utility) to the Control Panel.
REG ADD "HKCR\CLSID\{98641F47-8C25-4936-BEE4-C2CE1298969D}" /ve /t REG_SZ /d "User Accounts (W2k)" /f 1>NUL
REG ADD "HKCR\CLSID\{98641F47-8C25-4936-BEE4-C2CE1298969D}" /v "{305CA226-D286-468e-B848-2B2E8E697B74} 2" /t REG_SZ /d "9" /f 1>NUL
REG ADD "HKCR\CLSID\{98641F47-8C25-4936-BEE4-C2CE1298969D}" /v "InfoTip" /t REG_SZ /d "Can create an automatic computer LogOn for a User Account (Windows 2000 User Account Utility)." /f 1>NUL
REG ADD "HKCR\CLSID\{98641F47-8C25-4936-BEE4-C2CE1298969D}\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\System32\netplwiz.dll,-0" /f 1>NUL
REG ADD "HKCR\CLSID\{98641F47-8C25-4936-BEE4-C2CE1298969D}\Shell\Open\Command" /ve /t REG_EXPAND_SZ /d "Control UserPasswords2" /f 1>NUL
REG ADD "HKCR\CLSID\{98641F47-8C25-4936-BEE4-C2CE1298969D}\ShellFolder" /v "Attributes" /t REG_DWORD /d "0" /f 1>NUL
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{98641F47-8C25-4936-BEE4-C2CE1298969D}" /ve /t REG_SZ /d "User Accounts (W2k)" /f 1>NUL
:: Adds Group Policy to the Control Panel.
REG ADD "HKCR\CLSID\{9CD0827E-0AD1-4C27-93D0-29F4C4ECD3B2}" /ve /t REG_SZ /d "Group Policy" /f 1>NUL
REG ADD "HKCR\CLSID\{9CD0827E-0AD1-4C27-93D0-29F4C4ECD3B2}" /v "{305CA226-D286-468e-B848-2B2E8E697B74} 2" /t REG_SZ /d "5" /f 1>NUL
REG ADD "HKCR\CLSID\{9CD0827E-0AD1-4C27-93D0-29F4C4ECD3B2}" /v "InfoTip" /t REG_SZ /d "Group Policy is an infrastructure that allows you to implement specific configurations for users and computers." /f 1>NUL
REG ADD "HKCR\CLSID\{9CD0827E-0AD1-4C27-93D0-29F4C4ECD3B2}" /v "LocalizedString" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\gpedit.dll,-1" /f 1>NUL
REG ADD "HKCR\CLSID\{9CD0827E-0AD1-4C27-93D0-29F4C4ECD3B2}\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\gpedit.dll,-0" /f 1>NUL
REG ADD "HKCR\CLSID\{9CD0827E-0AD1-4C27-93D0-29F4C4ECD3B2}\Shell\Open\Command" /ve /t REG_EXPAND_SZ /d "\"%%SystemRoot%%\system32\mmc.exe\" \"%%SystemRoot%%\system32\gpedit.msc\"" /f 1>NUL
REG ADD "HKCR\CLSID\{9CD0827E-0AD1-4C27-93D0-29F4C4ECD3B2}\ShellFolder" /v "Attributes" /t REG_DWORD /d "0" /f 1>NUL
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{9CD0827E-0AD1-4C27-93D0-29F4C4ECD3B2}" /ve /t REG_SZ /d "Group Policy" /f 1>NUL
:: Adds Registry Editor to the Control Panel.
REG ADD "HKCR\CLSID\{77708248-F839-436B-8919-527C410F48B9}" /ve /t REG_SZ /d "Registry Editor" /f 1>NUL
REG ADD "HKCR\CLSID\{77708248-F839-436B-8919-527C410F48B9}" /v "{305CA226-D286-468e-B848-2B2E8E697B74} 2" /t REG_SZ /d "5" /f 1>NUL
REG ADD "HKCR\CLSID\{77708248-F839-436B-8919-527C410F48B9}" /v "InfoTip" /t REG_SZ /d "Registry is a hierarchical database that stores configuration settings and options on Windows operating system." /f 1>NUL
REG ADD "HKCR\CLSID\{77708248-F839-436B-8919-527C410F48B9}" /v "LocalizedString" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\regedit.exe,-16" /f 1>NUL
REG ADD "HKCR\CLSID\{77708248-F839-436B-8919-527C410F48B9}\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\regedit.exe,-0" /f 1>NUL
REG ADD "HKCR\CLSID\{77708248-F839-436B-8919-527C410F48B9}\Shell\Open\Command" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\regedit.exe" /f 1>NUL
REG ADD "HKCR\CLSID\{77708248-F839-436B-8919-527C410F48B9}\ShellFolder" /v "Attributes" /t REG_DWORD /d "0" /f 1>NUL
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{77708248-F839-436B-8919-527C410F48B9}" /ve /t REG_SZ /d "Registry Editor" /f 1>NUL
:: Adds DirectX Diagnostic Tool to the Control Panel.
REG ADD "HKCR\CLSID\{E7280DC9-52C8-B634-0D93-D9698921EC2C}" /ve /t REG_SZ /d "DirectX Diagnostic" /f 1>NUL
REG ADD "HKCR\CLSID\{E7280DC9-52C8-B634-0D93-D9698921EC2C}" /v "{305CA226-D286-468e-B848-2B2E8E697B74} 2" /t REG_SZ /d "4" /f 1>NUL
REG ADD "HKCR\CLSID\{E7280DC9-52C8-B634-0D93-D9698921EC2C}" /v "InfoTip" /t REG_SZ /d "DirectX Diagnostics is a diagnostics tool used to test DirectX functionality and troubleshoot video or sound related hardware problems." /f 1>NUL
REG ADD "HKCR\CLSID\{E7280DC9-52C8-B634-0D93-D9698921EC2C}\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\dxdiag.exe,-0" /f 1>NUL
REG ADD "HKCR\CLSID\{E7280DC9-52C8-B634-0D93-D9698921EC2C}\Shell\Open\Command" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\dxdiag.exe" /f 1>NUL
REG ADD "HKCR\CLSID\{E7280DC9-52C8-B634-0D93-D9698921EC2C}\ShellFolder" /v "Attributes" /t REG_DWORD /d "0" /f 1>NUL
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{E7280DC9-52C8-B634-0D93-D9698921EC2C}" /ve /t REG_SZ /d "DirectX Diagnostic" /f 1>NUL
:: Adds System Configuration Utility to the Control Panel.
REG ADD "HKCR\CLSID\{84280777-B643-F839-BEE4-C2EC1298969D}" /ve /t REG_SZ /d "System Config Utility" /f 1>NUL
REG ADD "HKCR\CLSID\{84280777-B643-F839-BEE4-C2EC1298969D}" /v "{305CA226-D286-468e-B848-2B2E8E697B74} 2" /t REG_SZ /d "5" /f 1>NUL
REG ADD "HKCR\CLSID\{84280777-B643-F839-BEE4-C2EC1298969D}" /v "InfoTip" /t REG_SZ /d "System Configuration Utility is a system utility to troubleshoot the Windows startup process." /f 1>NUL
REG ADD "HKCR\CLSID\{84280777-B643-F839-BEE4-C2EC1298969D}" /v "LocalizedString" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\pchealth\helpctr\binaries\msconfig.exe,-126" /f 1>NUL
REG ADD "HKCR\CLSID\{84280777-B643-F839-BEE4-C2EC1298969D}\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\pchealth\helpctr\binaries\msconfig.exe,-0" /f 1>NUL
REG ADD "HKCR\CLSID\{84280777-B643-F839-BEE4-C2EC1298969D}\Shell\Open\Command" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\pchealth\helpctr\binaries\msconfig.exe" /f 1>NUL
REG ADD "HKCR\CLSID\{84280777-B643-F839-BEE4-C2EC1298969D}\ShellFolder" /v "Attributes" /t REG_DWORD /d "0" /f 1>NUL
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{84280777-B643-F839-BEE4-C2EC1298969D}" /ve /t REG_SZ /d "System Config Utility" /f 1>NUL
:: Adds Certificate Manager Tool to the Control Panel.
REG ADD "HKCR\CLSID\{2086A18B-E188-451B-B4E8-6DB3266EFD73}" /ve /t REG_SZ /d "Certificate Manager" /f 1>NUL
REG ADD "HKCR\CLSID\{2086A18B-E188-451B-B4E8-6DB3266EFD73}" /v "{305CA226-D286-468e-B848-2B2E8E697B74} 2" /t REG_SZ /d "5" /f 1>NUL
REG ADD "HKCR\CLSID\{2086A18B-E188-451B-B4E8-6DB3266EFD73}" /v "InfoTip" /t REG_SZ /d "Enables you to manage certificates for a user, computers, or services." /f 1>NUL
REG ADD "HKCR\CLSID\{2086A18B-E188-451B-B4E8-6DB3266EFD73}\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\certmgr.dll,-0" /f 1>NUL
REG ADD "HKCR\CLSID\{2086A18B-E188-451B-B4E8-6DB3266EFD73}\Shell\Open\Command" /ve /t REG_EXPAND_SZ /d "\"%%SystemRoot%%\system32\mmc.exe\" \"%%SystemRoot%%\system32\certmgr.msc\"" /f 1>NUL
REG ADD "HKCR\CLSID\{2086A18B-E188-451B-B4E8-6DB3266EFD73}\ShellFolder" /v "Attributes" /t REG_DWORD /d "0" /f 1>NUL
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{2086A18B-E188-451B-B4E8-6DB3266EFD73}" /ve /t REG_SZ /d "Certificate Manager" /f 1>NUL
:: Adds Malicious Removal Tool to the Control Panel.
REG ADD "HKCR\CLSID\{72A2A18F-FC2B-4F74-92DA-7091EF4584E8}" /ve /t REG_SZ /d "Malicious Removal Tool" /f 1>NUL
REG ADD "HKCR\CLSID\{72A2A18F-FC2B-4F74-92DA-7091EF4584E8}" /v "{305CA226-D286-468e-B848-2B2E8E697B74} 2" /t REG_SZ /d "10" /f 1>NUL
REG ADD "HKCR\CLSID\{72A2A18F-FC2B-4F74-92DA-7091EF4584E8}" /v "InfoTip" /t REG_SZ /d "Malicious Software Removal helps to remove specific, prevalent malicious software from a Windows computer." /f 1>NUL
REG ADD "HKCR\CLSID\{72A2A18F-FC2B-4F74-92DA-7091EF4584E8}\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\MRT.exe,-0" /f 1>NUL
REG ADD "HKCR\CLSID\{72A2A18F-FC2B-4F74-92DA-7091EF4584E8}\Shell\Open\Command" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\MRT.exe" /f 1>NUL
REG ADD "HKCR\CLSID\{72A2A18F-FC2B-4F74-92DA-7091EF4584E8}\ShellFolder" /v "Attributes" /t REG_DWORD /d "0" /f 1>NUL
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{72A2A18F-FC2B-4F74-92DA-7091EF4584E8}" /ve /t REG_SZ /d "Malicious Removal Tool" /f 1>NUL

::ECHO.
::ECHO Installing IPv6 Teredo...
::ECHO This can take about 1-3 minutes. Please wait...
::netsh interface ipv6 install 1>NUL
::netsh interface ipv6 set teredo enterpriseclient 1>NUL

Exit
