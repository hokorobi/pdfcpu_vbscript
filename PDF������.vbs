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

dim i
dim pdfs
pdfs = ""
for i = 0 to WScript.Arguments.Count - 1
	pdfs = pdfs & " """ & WScript.Arguments(i) & """"
next
dim firstinfile
firstinfile = fso.GetAbsolutePathName(WScript.Arguments(0))
dim outfile
outfile = fso.GetParentFolderName(firstinfile) & "\" & fso.GetBaseName(firstinfile) & "_merge." & fso.GetExtensionName(firstinfile)
' Wscript.echo outfile
dim ret
ret = oShell.Run "pdfcpu merge """ & outfile & """" & pdfs, true


