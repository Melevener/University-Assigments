Dim filePath
Dim fileExt
Dim cleanPath
Dim isValidInput
Dim shell
Set shell = CreateObject("WScript.Shell")

Do
    isValidInput = True
    filePath = InputBox("������� ������ ���� � ����� .chm, ������� �� ������ �������:", "������� CHM ����")

    If filePath = False Then
        WScript.Quit
    ElseIf filePath = "" Then
        MsgBox "���� � ����� �� ��� ������.", vbExclamation, "������"
        isValidInput = False
    Else
        fileExt = LCase(Right(filePath, Len(filePath) - InStrRev(filePath, ".")))
        fileExt = Replace(fileExt, " ", "")

        cleanPath = LCase(Left(filePath, InStrRev(filePath, "."))) & fileExt

        If fileExt = "chm" Then
            If CreateObject("Scripting.FileSystemObject").FileExists(cleanPath) Then
                On Error Resume Next
                Set fso = CreateObject("Scripting.FileSystemObject")
                Set file = fso.OpenTextFile(cleanPath, 1, False)
                If Err.Number <> 0 Then
                    MsgBox "�� ������� ������� ����, ��� ��� � ��� ��� ���� ��� ������� � ����� �����.", vbExclamation, "������"
                    isValidInput = False
                    Err.Clear
                Else
                    file.Close
                    ' ����������� �������� hh.exe �� notepad++.exe
                    shell.Run "notepad++ """ & cleanPath & """", 1, False

                    If Err.Number <> 0 Then
                        MsgBox "�� ������� ������� ����.", vbExclamation, "������"
                        isValidInput = False
                        Err.Clear
                    End If
                End If
                On Error GoTo 0
            Else
                MsgBox "���� �� ������. ���������, ��� ���� ������ ���������.", vbExclamation, "������"
                isValidInput = False
            End If
        Else
            MsgBox "���� ������ ���� � ������� .chm. ����������, ������� ���������� ����.", vbExclamation, "������"
            isValidInput = False
        End If
    End If
Loop Until isValidInput
