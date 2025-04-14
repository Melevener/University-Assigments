Dim pi, n, term, prevPi, epsilon, startTime, endTime, duration
Dim maxIterations
Dim results, row
Dim fso, filePath, file
Const TRUE_PI = 3.141592653589793
Dim iterations

Function CalculatePi(epsilon)
    Dim sum, term
    
    sum = 0
    n = 1
    term = 1
    
    Do While Abs(Sqr(8 * sum) - TRUE_PI) > epsilon
        term = 1 / ((2 * n - 1) ^ 2)
        sum = sum + term
        n = n + 1
    Loop
    
    iterations = n - 1 
    CalculatePi = Sqr(8 * sum)
End Function

Sub Main()
    Dim epsilon, errorValue, userInput
    Dim startTime, endTime, duration
    Dim isValidInput

    Do
        isValidInput = True
        userInput = InputBox("Введите погрешность для расчета (от 1e-5 до 1e-8):")

        If userInput = "" Then
            WScript.Quit
        End If
        
        userInput = Replace(userInput, ".", ",")
        
        If userInput = " " Then
            MsgBox "Ошибка: введена пустая строка. Ожидается числовое значение погрешности.", vbExclamation
            isValidInput = False
        
        ElseIf Not IsNumeric(userInput) Then
		    MsgBox "Ошибка: введено некорректное значение! Ожидается значение погрешности в диапазоне от 1e-5 до 1e-8.", vbExclamation
            isValidInput = False

        Else
            epsilon = CDbl(userInput)
            If epsilon > 1E-5 Or epsilon < 1E-8 Then
                MsgBox "Ошибка: введена недопустимая погрешность! Пожалуйста, введите значение в диапазоне от 1e-5 до 1e-8.", vbExclamation
                isValidInput = False
            End If
        End If
    Loop Until isValidInput

    results = "Погрешность" & "		" & "Значение Pi" & "		" & "Итерации" & "	" & "Ошибка" & "			" & "Время (сек)" & vbLf
    
    startTime = Timer
    pi = CalculatePi(epsilon)
    endTime = Timer
    
    duration = endTime - startTime
    errorValue = Abs(TRUE_PI - pi)
    
    row = FormatNumber(epsilon, 16) & vbTab & FormatNumber(pi, 16) & vbTab & iterations & vbTab & vbTab & FormatNumber(errorValue, 16) & vbTab & FormatNumber(duration, 6)
    results = results & row & vbLf
    
    Set fso = CreateObject("Scripting.FileSystemObject")
    filePath = "C:\Users\user\Desktop\лаба5\result(lab7).txt"
    Set file = fso.CreateTextFile(filePath, True)
    file.WriteLine results
    file.Close

    MsgBox "Программа успешно выполнена! Результаты записаны в файл: " & filePath, vbInformation

    Set objShell = CreateObject("WScript.Shell")
    objShell.Run "notepad.exe " & filePath
End Sub

Main
