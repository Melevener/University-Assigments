Option Explicit

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
    Dim precisions, i, epsilon, errorValue
    
    precisions = Array(1e-5, 1e-6, 1e-7, 1e-8)
    maxIterations = 1000000
    
    results = "Погрешность" & "		" & "Значение Pi" & "		" & "Итерации" & "	" & "Ошибка" & "			" & "Время (сек)" & vbLf
    
    For i = 0 To UBound(precisions)
        epsilon = precisions(i)
        
        startTime = Timer
        pi = CalculatePi(epsilon)
        endTime = Timer
        
        duration = endTime - startTime
        
        errorValue = Abs(TRUE_PI - pi)
        
        row = FormatNumber(epsilon, 16) & vbTab & FormatNumber(pi, 16) & vbTab & iterations & vbTab & vbTab & FormatNumber(errorValue, 16) & vbTab & FormatNumber(duration, 6)
        results = results & row & vbLf
    Next
    
    Set fso = CreateObject("Scripting.FileSystemObject")
    filePath = "C:\Users\user\Desktop\result(lab5).txt"
    Set file = fso.CreateTextFile(filePath, True)
    file.WriteLine results
    file.Close

End Sub

Main