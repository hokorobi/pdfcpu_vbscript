Option Explicit
if WScript.Arguments.Count = 0 then
	WScript.echo("PDF�t�@�C�����h���b�O�A���h�h���b�v���ĉ������B")
	WScript.Quit(-1)
end if

dim fso
set fso = CreateObject("Scripting.FileSystemObject")
dim currentDirectory
currentDirectory = fso.getParentFolderName(WScript.ScriptFullName)
dim oShell
Set oShell = CreateObject("WScript.Shell")
oShell.CurrentDirectory = currentDirectory

dim firstinfile
firstinfile = fso.GetAbsolutePathName(WScript.Arguments(0))
dim outfile
outfile = fso.GetParentFolderName(firstinfile) & "\" & fso.GetBaseName(firstinfile) & "_trimmed." & fso.GetExtensionName(firstinfile)

Dim pages
pages = InputBox("���o���y�[�W���w�肵�ĉ������B" & vbCrLf & "��:�擪����5�y�[�W�����o��: -5" & vbCrLf & "��:1�y�[�W��3�y�[�W�����o��: 1,3")
oShell.Run "cmd /k pdfcpu trim -pages=" & pages & " """ & firstinfile & """ """ & outfile & """"

