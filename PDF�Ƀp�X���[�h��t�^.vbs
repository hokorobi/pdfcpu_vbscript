Option Explicit
if WScript.Arguments.Count = 0 then
	WScript.echo("PDF�t�@�C�����h���b�O�A���h�h���b�v���ĉ������B")
	WScript.Quit(-1)
end if

Dim password
password = InputBox("�p�X���[�h����͂��ĉ�����")

dim fso
set fso = CreateObject("Scripting.FileSystemObject")
dim currentDirectory
currentDirectory = fso.getParentFolderName(WScript.ScriptFullName)
dim oShell
Set oShell = CreateObject("WScript.Shell")
oShell.CurrentDirectory = currentDirectory

dim i
for i = 0 to WScript.Arguments.Count - 1
	oShell.Run "cmd /k pdfcpu encrypt -upw " & password & " """ & WScript.Arguments(i) & """"
next

