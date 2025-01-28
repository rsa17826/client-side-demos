#Requires AutoHotkey v2.0
#SingleInstance Force

#Include *i <AutoThemed>

try TraySetIcon("icon.ico")
SetWorkingDir(A_ScriptDir)
#Include *i <vars>

#Include <Misc>

#Include *i <betterui> ; betterui

#Include *i <textfind> ; FindText, setSpeed, doClick
#Include <admin>
; #Include *i <CMD> ; CMD - cmd.exe - broken?
try WinClose("C:\Windows\system32\cmd.exe")

win := getConsole(, "hide")
print(win)
sshpass := EnvGet("SSHPASS")
ControlSend("cd `"" A_ScriptDir "`"{enter}git add . {enter}git commit -m a{enter}" sshpass "{enter}git push{enter}" sshpass "{enter}", , win)
Sleep(3000)
WinClose(win)