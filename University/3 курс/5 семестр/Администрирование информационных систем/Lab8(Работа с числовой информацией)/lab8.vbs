Function IsNumericInput(input)
    input = Replace(input, ".", ",")
    If IsNumeric(input) Then
        IsNumericInput = True
    Else
        IsNumericInput = False
    End If
End Function

Function IsValidNumber(number)
    If Abs(number) > 1e100 or Abs(number) < 1e-100 Then
        IsValidNumber = False
    Else
        IsValidNumber = True
    End If
End Function

Function GetNumber(prompt)
        inputValue = InputBox(prompt)

        If IsEmpty(inputValue) Then
            WScript.Quit 
        End If

        If Len(inputValue) = 0 Then
            MsgBox "Ошибка: введено пустое значение. Пожалуйста, введите число.", vbExclamation
        Else
            inputValue = Replace(inputValue, ".", ",")

            If IsNumericInput(inputValue) Then
                number = CDbl(inputValue)

                If Not IsValidNumber(number) Then 
					MsgBox "Ошибка: введено слишком большое или слишком маленькое число." & vbLF & "Пожалуйста, введите более рациональное значение.", vbCritical
                End If
            Else
                MsgBox "Ошибка: введено некорректное число. Пожалуйста, введите корректное значение.", vbExclamation
            End If
        End If

    GetNumber = number
End Function

Function RoundToTwoDigits(number)
    RoundToTwoDigits = Round(number * 100) / 100
End Function

Function CalculateY(a, b, c)
    On Error Resume Next 

    nestedSqrt = Sqr(2 + Sqr(2 + Sqr(2 + Sqr(2 + a))))
    sineTerm = Sin((13 - b) / (c ^ 5))

    y = nestedSqrt + sineTerm

    If Err.Number <> 0 Then
        MsgBox "Произошла ошибка переполнения или другая ошибка при вычислении y. Попробуйте ввести другие значения.", vbCritical
        WScript.Quit
    End If

    On Error GoTo 0
    CalculateY = y
End Function

Do
    a = GetNumber("Введите число a:")
    If a < -2 Then
        MsgBox "Ошибка: значение a должно быть больше, чем -3. Пожалуйста, введите корректное значение.", vbExclamation
    End If
Loop Until a >= -2

b = GetNumber("Введите число b:")
Do
	c = GetNumber("Введите число c:")
	If c = 0 Then
        MsgBox "Ошибка: значение c не может быть равно нулю. ", vbExclamation
    End If
Loop Until c <> 0

y = CalculateY(a, b, c)
yRounded = RoundToTwoDigits(y)

MsgBox "Введенные числа:" & vbLf & _ 
       "a = " & a & vbLf & _ 
       "b = " & b & vbLf & _ 
       "c = " & c & vbLf & vbLf & _ 
       "Результат:" & vbLf & _
	   "Y = " & yRounded & vbLf