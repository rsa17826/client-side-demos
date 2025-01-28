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
getConsole(wd?, opts?) {
  Run(A_ComSpec, wd?, opts?)
  list := WinGetList("C:\Windows\system32\cmd.exe").join(",")
  pid := WinExist("A")
  print(pid)
  while list = WinGetList("C:\Windows\system32\cmd.exe").join(",") {
  }
  print(list, WinGetList("C:\Windows\system32\cmd.exe"))
  win := WinGetList("C:\Windows\system32\cmd.exe")[WinGetList("C:\Windows\system32\cmd.exe").find(e => !list.includes(e))]
  return win
}
win := getConsole(, "min")
print(win)
sshpass := EnvGet("SSHPASS")
ControlSend("cd `"" A_ScriptDir "`"{enter}git add . {enter}git commit -m a{enter}" sshpass "{enter}git push{enter}" sshpass "{enter}", , win)
ControlSend("cd `"" A_ScriptDir "`"{enter}git add . {enter}git commit -m a{enter}" sshpass "{enter}git push{enter}" sshpass "{enter}", , "ahk_id " win)
Sleep(3000)
WinClose(win)