Dim n, isValidInput

Do
    isValidInput = True
    n = InputBox("Введите количество элементов n для массива:", "Задание n")
    
    If n = "" Then
        WScript.Quit
    End If

    n = Replace(n, ".", ",")

    If n = " " Then
        MsgBox "Вы ввели пустую строку. Ожидается целое положительное число", vbExclamation
        isValidInput = False
    ElseIf Not IsNumeric(n) Then
        MsgBox "Введённое значение не подходит!" & vbLF & "Ожидается введение целого положительного числа", vbExclamation
        isValidInput = False
    Else
        n = CDbl(n)
		
        If n = 0 Then
            MsgBox "Количество элементов не должно равняться нулю!", vbExclamation
            isValidInput = False
		ElseIf n < 1e-1 Then
            MsgBox "Введённое число слишком маленькое! Пожалуйста, введите значение другое значение", vbExclamation
            isValidInput = False
        ElseIf n > 1e2 Then
            MsgBox "Введённое число слишком большое! Пожалуйста, введите другое значение", vbExclamation
            isValidInput = False
        ElseIf (n * 10) Mod 10 <> 0 Then
            MsgBox "Пожалуйста, введите целое число без дробной части!", vbExclamation
            isValidInput = False
        ElseIf n < 0 Then
            MsgBox "Количество элементов должно быть положительным!", vbExclamation
            isValidInput = False
		ElseIf n > 25 Then
            MsgBox "Вы ввели слишком большое число!", vbExclamation
            isValidInput = False

        Else
            n = CInt(n)
        End If
    End If
Loop Until isValidInput

Dim X()
ReDim X(n - 1)

Randomize

Dim i
For i = 0 To n - 1
    X(i) = Rnd
Next

Dim X_max, X_min
X_max = X(0)
X_min = X(0)

For Each num In X
    If num > X_max Then
        X_max = num
    End If
    If num < X_min Then
        X_min = num
    End If
Next

Dim Z()
ReDim Z(n - 1)

Dim index
index = 0

If n = 1 Then
    Z(0) = 1
Else
    For Each Xi In X
        If (X_max - X_min) <> 0 Then
            Z(index) = Xi / (X_max - X_min)
        Else
            Z(index) = 0
        End If
        index = index + 1
    Next
End If

Dim resultMsg
resultMsg = "Исходные данные и результаты:" & vbLF

For i = 0 To n - 1
    resultMsg = resultMsg & "X(" & i & ") = " & X(i) & ", Z(" & i & ") = " & Z(i) & vbLF
Next

MsgBox resultMsg
