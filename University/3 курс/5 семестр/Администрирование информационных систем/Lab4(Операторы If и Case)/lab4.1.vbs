Dim month, season

month = InputBox("Введите номер месяца:", "Ввод месяца")

If IsEmpty(month) Then
	Wscript.Quit
End If

month = Replace(month, ".", ",")
If IsNumeric(month) Then
	If InStr(month, ",") > 0 Or InStr(month, ".") > 0 Then
		MsgBox ("Введен неверный тип данных")
		Wscript.Quit
	End If
	
    If month >= 1 And month <= 12 Then
        If month = 12 Or month = 1 Or month = 2 Then
            season = "Зима"
        ElseIf month >= 3 And month <= 5 Then
            season = "Весна"
        ElseIf month >= 6 And month <= 8 Then
            season = "Лето"
        ElseIf month >= 9 And month <= 11 Then
            season = "Осень"
        End If
        MsgBox ("Месяц номер " & month & " относится к сезону: " & season)
    Else
        MsgBox ("Пожалуйста, введите корректный номер месяца (от 1 до 12)")
    End If
Else
    MsgBox ("Вы не ввели число или ввели не число")
End If
