Dim filePath
Dim fileExt
Dim cleanPath
Dim isValidInput
Dim shell
Set shell = CreateObject("WScript.Shell")

Do
    isValidInput = True
    filePath = InputBox("Введите полный путь к файлу .chm, который вы хотите открыть:", "Открыть CHM файл")

    If filePath = False Then
        WScript.Quit
    ElseIf filePath = "" Then
        MsgBox "Путь к файлу не был введен.", vbExclamation, "Ошибка"
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
                    MsgBox "Не удалось открыть файл, так как у вас нет прав для доступа к этому файлу.", vbExclamation, "Ошибка"
                    isValidInput = False
                    Err.Clear
                Else
                    file.Close
                    ' Попробовать заменить hh.exe на notepad++.exe
                    shell.Run "notepad++ """ & cleanPath & """", 1, False

                    If Err.Number <> 0 Then
                        MsgBox "Не удалось открыть файл.", vbExclamation, "Ошибка"
                        isValidInput = False
                        Err.Clear
                    End If
                End If
                On Error GoTo 0
            Else
                MsgBox "Файл не найден. Убедитесь, что путь введен правильно.", vbExclamation, "Ошибка"
                isValidInput = False
            End If
        Else
            MsgBox "Файл должен быть в формате .chm. Пожалуйста, введите корректный путь.", vbExclamation, "Ошибка"
            isValidInput = False
        End If
    End If
Loop Until isValidInput
