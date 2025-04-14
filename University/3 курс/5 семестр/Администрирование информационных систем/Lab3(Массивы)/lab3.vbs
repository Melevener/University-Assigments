Dim arr, i, j, output
arr = Array(1, 2, 3, 4, 5, 6)

output = "Одномерный массив: " & vbLf
For i = 0 To 5
    output = output & "arr(" & i & ") = " & arr(i) & " " & vbLF
Next
MsgBox output

ReDim arr(2, 1)

arr(0, 0) = 1
arr(0, 1) = 2
arr(1, 0) = 3
arr(1, 1) = 4
arr(2, 0) = 5
arr(2, 1) = 6

output = "Двумерный массив (3x2): " & vbLf
For i = 0 To 2
    For j = 0 To 1
        output = output & "arr(" & i & "," & j & ") = " & arr(i, j) & vbLf
    Next
Next
MsgBox output