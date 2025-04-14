Dim objNetwork, objDrives, strComputerName, strUserName, strDrives

Set objNetwork = CreateObject("WScript.Network")

strComputerName = objNetwork.ComputerName
strUserName = objNetwork.UserName

Set objDrives = CreateObject("Scripting.FileSystemObject").Drives
strDrives = ""

For Each drive In objDrives
    If drive.IsReady Then
        strDrives = strDrives & drive.DriveLetter & ": " & drive.FileSystem & vbNewLine
    End If
Next

MsgBox "Имя компьютера: " & strComputerName & vbNewLine & _
       "Имя пользователя: " & strUserName & vbNewLine & _
       "Логические диски:" & vbNewLine & strDrives

Set objNetwork = Nothing
Set objDrives = Nothing
