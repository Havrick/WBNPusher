dir = R:\AMS_PDFExport
compGui()
{
	Gui, -Caption 
	Gui,+AlwaysOnTop
	Gui, Add, Button,w80 ,Export
	Gui, Add, Button,w80 ,About 
	;Gui, Add, Button,w80 ,DebugExport  ;debugbutton not needed
	
	Gui, Show, x1232 y590
}

Loop{
	IfWinExist, rapp_cem
	{
		compGui()
		WinWaitClose, rapp_cem
		Gui, destroy
	}
	IfWinExist, Bericht
	{
		compGui()
		WinWaitClose, Bericht
		Gui, destroy
	}
}
return
ButtonExport:
Gui, destroy
InputBox, UserInput, AMS, AMS?, , 100, 150
if !ErrorLevel
{
BlockInput, On
WinActivate, rapp_cem
WinActivate, Bericht
Sleep 1000
Process, Close, SnippingTool.exe
Run, "C:\WINDOWS\system32\SnippingTool.exe"
Sleep 1000
MouseMove, 0,75
DllCall("SetCursorPos", "int", 2, "int", 62)
Click down
DllCall("SetCursorPos", "int", 1379, "int", 564)
Click up
Sleep 1000
Send ^S
Sleep 1000
Random, rand, 1, 10000000
Send %UserInput%_%rand%.jpg
Send {Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Space}
Send %dir%{Enter}
Sleep 1000
Send {Tab}{Tab}{Enter}
Send {Alt}{Down}{Down}{Down}{Down}{Enter}
BlockInput, Off
}
return
/* debugbutton not needed
ButtonDebugExport:
Gui, destroy
InputBox, UserInput, AMS, AMS?, , 100, 150
if ErrorLevel
    MsgBox, CANCEL was pressed.
	
else{
BlockInput, On
WinActivate, rapp_cem
WinActivate, Bericht
Sleep 1000
Process, Close, SnippingTool.exe
Run, C:\WINDOWS\system32\SnippingTool.exe
Sleep 1000
MouseMove, 0,75
DllCall("SetCursorPos", "int", 2, "int", 62)
Click down
DllCall("SetCursorPos", "int", 1379, "int", 564)
Click up
Sleep 1000
Send ^S
Sleep 1000
Random, rand, 1, 10000000
Send %UserInput%_%rand%.jpg
Sleep 1000
Send {Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Space}
Send C:\Users\codere.HAAKA\Documents\AutoHotkey\test{Enter}
Sleep 1000
Send {Tab}{Tab}{Enter}
Send {Alt}{Down}{Down}{Down}{Down}{Enter}
BlockInput, Off
}
*/
ButtonAbout:
Run, https://github.com/MAFernCosta/WBNPusher

