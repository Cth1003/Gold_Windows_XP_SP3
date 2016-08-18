' This script creates a Windows Media Player shortcut on the Desktop and in the Quick Launch.

Dim Act,colEnvironmentVariables, objShortCut, Shell
  Set Shell = CreateObject("WScript.Shell")
  Set colEnvironmentVariables = Shell.Environment("Volatile")
  Set Act = CreateObject("Wscript.Shell")

  Set objShortCut = Shell.CreateShortcut(Act.ExpandEnvironmentStrings("%UserProfile%\Desktop\Windows Media Player.lnk"))
   objShortCut.TargetPath = Act.ExpandEnvironmentStrings("%ProgramFiles%\Windows Media Player\wmplayer.exe")
   objShortCut.Arguments = "/prefetch:1"
   objShortCut.Description = "Play digital media including music, videos, CDs, and DVDs."
   objShortCut.Save

  Set objShortCut = Shell.CreateShortcut(Act.ExpandEnvironmentStrings("%AppData%\Microsoft\Internet Explorer\Quick Launch\Windows Media Player.lnk"))
   objShortCut.TargetPath = Act.ExpandEnvironmentStrings("%ProgramFiles%\Windows Media Player\wmplayer.exe")
   objShortCut.Arguments = "/prefetch:1"
   objShortCut.Description = "Play digital media including music, videos, CDs, and DVDs."
   objShortCut.Save

WScript.Quit
