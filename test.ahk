#Requires AutoHotkey v2.0
#SingleInstance Force

#Include *i <AutoThemed>

try TraySetIcon("icon.ico")
SetWorkingDir(A_ScriptDir)
#Include *i <vars>

#Include <Misc>

#Include *i <betterui> ; betterui

#Include *i <textfind> ; FindText, setSpeed, doClick

; #Include *i <CMD> ; CMD - cmd.exe - broken?
; a := shell.Exec('cmd /c "git add . | title"')
Run("cmd", , , &pid)
WinWait(pid)
Sleep(1000)
try WinActivate(pid)
send("cd `"" A_ScriptDir "`"{enter}git add . {enter}git commit -m a{enter}009129354{enter}git push{enter}009129354{enter}")
Sleep(10000)
WinClose("A")