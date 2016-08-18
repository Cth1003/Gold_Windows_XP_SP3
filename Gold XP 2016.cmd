@ECHO OFF
TITLE Gold Windows XP 2016 - Setup
PUSHD "%~dp0"
IF "%~1"=="-nr" GOTO NORESTART


ECHO                                      \\!//
ECHO                                      (o o)
ECHO ---------------------------------oOOo-(_)-oOOo---------------------------------
ECHO Gold XP 2016 Setup
ECHO ===============================================================================
ping -n 3 localhost 1>NUL


:INPUT-RISM
ECHO.
ECHO A computer restart is required for running the Gold XP 2016 Setup mode.
SET "OPTION="
SET /P "OPTION=Enter "1" to Continue or "0" to Quit: "
IF /I "%OPTION%"=="1" GOTO RESTART
IF /I "%OPTION%"=="0" EXIT
GOTO INPUT-RISM
:RESTART
ECHO.
ECHO Computer will now restart in 10 seconds into the Gold XP 2016 Setup mode...
ping -n 12 localhost 1>NUL
REG DELETE "HKCU\Software\Microsoft\Active Setup\Installed Components\>{XX2AHKND-R9W5-UF6T-CY3Z-SQ8MJVB7EP4G}" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\>{XX2AHKND-R9W5-UF6T-CY3Z-SQ8MJVB7EP4G}" /ve /t REG_SZ /d "Gold XP 2016 Setup" /f 1>NUL
REG ADD "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\>{XX2AHKND-R9W5-UF6T-CY3Z-SQ8MJVB7EP4G}" /v "StubPath" /t REG_EXPAND_SZ /d "\"%CD%\Gold XP 2016.cmd\" -nr" /f 1>NUL
SHUTDOWN -r -t 0
EXIT


:NORESTART
ECHO                                      \\!//
ECHO                                      (o o)
ECHO ---------------------------------oOOo-(_)-oOOo---------------------------------
ECHO Over the next few minutes you will see automated installations
ECHO of various Sofware Applications and Settings being implemented.
ECHO ===============================================================================
ping -n 3 localhost 1>NUL

ECHO.
ECHO Adding Windows File Protection Utility v1.3...
COPY "Windows File Protection.cmd" "%AllUsersProfile%\Start Menu\Programs\Accessories\System Tools\" /V /Y /S 1>NUL

ECHO.
ECHO Installing Extended Update Support Patch v1.0...
REG ADD "HKLM\SYSTEM\WPA\POSReady" /v "Installed" /t REG_DWORD /d "00000001" /f >NUL 2>&1

ECHO.
ECHO Executing Gold XP 2016 Application Installer...
START "" /WAIT "..\Gold\Gold.exe"

ECHO.
ECHO Executing Gold XP 2016 Profile Settings...
START "" /WAIT "Gold XP 2016 - Profile Settings.cmd"

ECHO.
ECHO Executing Gold XP 2016 System Settings...
START "" /WAIT "Gold XP 2016 - System Settings.cmd"

ECHO.
ECHO Installing Gold Fire Screensaver...
START "" /WAIT "..\Gold\Install\Fire.exe"

ECHO.
ECHO Setting new browser start page...
:: Microsoft Internet Explorer.
IF EXIST "%UserProfile%\Favorites\Computer Worm.url" GOTO SKIP
REG ADD "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /t REG_SZ /d "http://www.computerworm.net" /f 1>NUL
ECHO [InternetShortcut]>"%UserProfile%\Favorites\Computer Worm.url"
ECHO URL=http://www.computerworm.net/>> "%UserProfile%\Favorites\Computer Worm.url"
:SKIP
:: Mozilla Firefox.
IF EXIST "%ProgramFiles%\Mozilla Firefox\defaults\pref\local-settings.js" GOTO SKIP
MKDIR "%ProgramFiles%\Mozilla Firefox\defaults\pref" 2>NUL
SETLOCAL
SET "MFF="%ProgramFiles%\Mozilla Firefox\defaults\pref\local-settings.js""
>%MFF% ECHO pref("general.config.obscure_value", 0); // Only needed if you do not want to obscure the content with ROT-13.
>>%MFF% ECHO pref("general.config.filename", "firefox.cfg");
SET "MFF="%ProgramFiles%\Mozilla Firefox\firefox.cfg""
>%MFF% ECHO // Firefox Default Settings.
>>%MFF% ECHO.
>>%MFF% ECHO // Set default browser Homepage.
>>%MFF% ECHO defaultPref("browser.startup.homepage", "data:text/plain,browser.startup.homepage=http://computerworm.net/");
ENDLOCAL
:SKIP

ECHO.
ECHO Applying Gold Windows 7 Sounds...
REGEDIT /S "Gold Sounds.reg"

ECHO.
ECHO Applying Gold Fire Screensaver Settings...
START "" /WAIT "..\Gold\Install\FireTips.exe"

ECHO.
ECHO Deleting Gold XP 2016 Setup Registry Keys...
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "1 Gold XP 2016 Setup Cleanup" /t REG_SZ /d "CMD /C REG DELETE \"HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\^>{XX2AHKND-R9W5-UF6T-CY3Z-SQ8MJVB7EP4G}\" /f & REG DELETE \"HKCU\Software\Microsoft\Active Setup\Installed Components\^>{XX2AHKND-R9W5-UF6T-CY3Z-SQ8MJVB7EP4G}\" /f" /f 1>NUL


ECHO.
ECHO ----------------------------------[Finished]-----------------------------------
ECHO.
ECHO Gold XP 2016 installation is completed.
ECHO Computer will now restart in 30 seconds...
ECHO.
ECHO ----------------------------------[Completed]----------------------------------
ping -n 5 localhost 1>NUL
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "2 Gold XP 2016 Restart" /t REG_SZ /d "SHUTDOWN -r -t 30 -c \"The Gold XP 2016 installation is now complete and the computer will now restart in a few seconds. The Gold XP 2016 Disc can now also be removed from the Optical Disc Drive.\"" /f 1>NUL
EXIT
