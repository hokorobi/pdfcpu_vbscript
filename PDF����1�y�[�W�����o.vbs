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

dim outfolder
outfolder = fso.GetParentFolderName(fso.GetAbsolutePathName(WScript.Arguments(0)))
' Wscript.echo outfile

Dim pages
pages = InputBox("取り出すページを指定して下さい。" & vbCrLf & "例:先頭から5ページを取り出す: -5" & vbCrLf & "例:1ページと3ページを取り出す: 1,3")
oShell.Run "pdfcpu extract -mode=page -pages=" & pages & " """ & WScript.Arguments(0) & """ """ & outfolder & """"
' WScript.Echo "cmd /k pdfcpu extract -mode=page -pages=" & pages & " """ & WScript.Arguments(0) & " """ & outfolder & """"

