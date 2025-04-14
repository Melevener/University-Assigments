Dim dateTime1
dateTime1 = CDate("01/01/2008 00:05:00")

Dim dateTime2
dateTime2 = CDate("31/12/2007 20:15:00")

Dim result
If dateTime1 > dateTime2 Then
    result = "Дата и время " & dateTime1 & " больше, чем " & datetime2
ElseIf dateTime1 < dateTime2 Then
    result = "Дата и время " & dateTime1 & " меньше, чем " & datetime2
Else
    result = "Обе даты равны"
End If

MsgBox result
