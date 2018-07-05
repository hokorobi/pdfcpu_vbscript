Option Explicit
if WScript.Arguments.Count = 0 then
	WScript.echo("PDFファイルをドラッグアンドドロップして下さい。")
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
pages = InputBox("取り出すページを指定して下さい。" & vbCrLf & "例:先頭から5ページを取り出す: -5" & vbCrLf & "例:1ページと3ページを取り出す: 1,3")
oShell.Run "cmd /k pdfcpu trim -pages=" & pages & " """ & firstinfile & """ """ & outfile & """"

