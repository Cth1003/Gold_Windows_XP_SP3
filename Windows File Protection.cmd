@ECHO OFF
TITLE GUI - Gold XP 2016 - WFP Utility


:TOP
CLS
ECHO                                      \\!//
ECHO                                      (o o)
ECHO ---------------------------------oOOo-(_)-oOOo---------------------------------
ECHO                 Windows XP Professional SP3 x86 - Gold Edition
ECHO                      Windows File Protection Utility v1.3
ECHO ===============================================================================


ECHO.
REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "SFCDisable" | find "0x0" 1>NUL && SET "STATUS=Enabled"
REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "SFCDisable" | find "0x4" 1>NUL && SET "STATUS=Enabled but with all prompts disabled"
REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "SFCDisable" | find "0xffffff9d" 1>NUL && SET "STATUS=Disabled"
ECHO STATUS: Windows File Protection is %STATUS%.
ECHO NOTE: Enabling the WFP will protect the system files from unauthorized changes
ECHO and Disabling the WFP will slightly improve the performance of your computer.

ECHO.
ECHO Enter "1" to Enable the Windows File Protection.
ECHO Enter "2" to Enable the Windows File Protection but disable all prompts.
ECHO Enter "3" to Disable the Windows File Protection.
ECHO Enter "4" to Scan all the protected system files (WFP must be turned ON).
ECHO Enter "5" to See all the System File Checker commands.
ECHO Enter "0" to Quit.
ECHO.
:INPUT-WFP
SET "OPTION="
SET /P "OPTION=Enter an option from 0-5: "
IF /I "%OPTION%"=="1" SET "SETTING=0x0" & GOTO APPlY
IF /I "%OPTION%"=="2" SET "SETTING=0x4" & GOTO APPlY
IF /I "%OPTION%"=="3" SET "SETTING=0xffffff9d" & GOTO APPlY
IF /I "%OPTION%"=="4" START "System File Checker" CMD /C "ECHO. & SFC /SCANNOW & IF ERRORLEVEL 1 ECHO. & PAUSE" & GOTO TOP
IF /I "%OPTION%"=="5" START "System File Checker" CMD /K "SFC /?" & GOTO TOP
IF /I "%OPTION%"=="0" EXIT
GOTO INPUT-WFP

:APPlY
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "SFCDisable" /t REG_DWORD /d "%SETTING%" /f 1>NUL
IF ERRORLEVEL 1 GOTO END
ECHO.
REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "SFCDisable" | find "0x0" 1>NUL && SET "STATUS=Enabled"
REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "SFCDisable" | find "0x4" 1>NUL && SET "STATUS=Enabled but with all prompts disabled"
REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "SFCDisable" | find "0xffffff9d" 1>NUL && SET "STATUS=Disabled"
ECHO STATUS: Windows File Protection has been %STATUS%.
ECHO * You need to restart your computer for the new setting to take effect.
ECHO.
:INPUT-RESTART
SET "OPTION="
SET /P "OPTION=Enter "1" to Restart Now or "0" to Restart Later : "
IF /I "%OPTION%"=="1" GOTO RESTART
IF /I "%OPTION%"=="0" EXIT
GOTO INPUT-RESTART
:RESTART
ECHO.
ECHO Computer will now restart in 5 seconds...
ping -n 6 localhost 1>NUL
SHUTDOWN -r -t 0
EXIT

:END
ECHO.
PAUSE
EXIT
