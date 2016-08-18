ECHO.
ECHO ------------------------[Gold XP 2016 - Profile Settings]------------------------

ECHO.
ECHO Executing file "Gold XP 2016 - Profile Settings.reg"...
REGEDIT /S "Gold XP 2016 - Profile Settings.reg"

IF NOT EXIST "%UserProfile%\Start Menu\Programs\Windows Media Player.lnk" GOTO SKIP
ECHO.
ECHO Creating Windows Media Player shortcut on the Desktop and Quick Launch...
START "" /WAIT "WMP Shortcuts Creator.vbs"
:SKIP

ECHO.
ECHO Creating IExpress shortcut in
ECHO the "Start Menu -> All Programs -> Accessories" menu...
START "" /WAIT "IExpress Shortcut Creator.vbs"

ECHO.
ECHO Deleting Remote Assistance shortcut in
ECHO the "Start Menu -> All Programs" menu...
DEL "%UserProfile%\Start Menu\Programs\Remote Assistance.lnk" 2>NUL

ECHO.
ECHO Deleting default Internet Explorer feed links...
RMDIR /S /Q "%UserProfile%\Local Settings\Application Data\Microsoft\Feeds\Microsoft Feeds~" 2>NUL

ECHO.
ECHO Deleting default Weblinks in the Gold XP 2016 Favorites folder...
DEL "%UserProfile%\Favorites\Links\Web Slice Gallery.url" 2>NUL
RMDIR /S /Q "%UserProfile%\Favorites\Microsoft Websites" 2>NUL

IF EXIST "%UserProfile%\My Documents\My Videos\Desktop.ini" GOTO SKIP
ECHO.
ECHO Creating default "My Videos" folder in the "My Documents" folder...
MKDIR "%UserProfile%\My Documents\My Videos" 2>NUL
ATTRIB +S "%UserProfile%\My Documents\My Videos"
SETLOCAL
SET "MVF="%UserProfile%\My Documents\My Videos\Desktop.ini""
>%MVF% ECHO [.ShellClassInfo]
>>%MVF% ECHO InfoTip=@Shell32.dll,-12690
>>%MVF% ECHO IconFile=%%SystemRoot%%\system32\SHELL32.dll
>>%MVF% ECHO IconIndex=-238
>>%MVF% ECHO [DeleteOnCopy]
>>%MVF% ECHO Owner=%Username%
>>%MVF% ECHO Personalized=14
>>%MVF% ECHO PersonalizedName=My Videos
ENDLOCAL

ATTRIB +A +S +H "%UserProfile%\My Documents\My Videos\Desktop.ini"
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Video" /t REG_SZ /d "%UserProfile%\My Documents\My Videos" /f 1>NUL
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "CommonVideo" /t REG_SZ /d "%AllUsersProfile%\Documents\My Videos" /f >NUL 2>&1
:SKIP

EXIT