' This script creates a IExpress shortcut in at "Start Menu -> All Programs -> Accessories".

Dim Act,colEnvironmentVariables, objShortCut, Shell
  Set Shell = CreateObject("WScript.Shell")
  Set colEnvironmentVariables = Shell.Environment("Volatile")
  Set Act = CreateObject("Wscript.Shell")

  Set objShortCut = Shell.CreateShortcut(Act.ExpandEnvironmentStrings("%UserProfile%\Start Menu\Programs\Accessories\IExpress.lnk"))
   objShortCut.TargetPath = "%SystemRoot%\system32\iexpress.exe"
   objShortCut.WorkingDirectory = "%HOMEDRIVE%%HOMEPATH%"
   objShortCut.Description = "Wizard to create a Self Extracting Installation Package."
   objShortCut.Save

WScript.Quit
