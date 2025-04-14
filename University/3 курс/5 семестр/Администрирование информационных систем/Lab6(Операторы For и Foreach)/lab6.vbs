Dim n
n = 20

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

For Each Xi In X
    Z(index) = Xi / (X_max - X_min)
    index = index + 1
Next

Dim resultMsg
resultMsg = "Исходные данные и результаты:" & vbLF

For i = 0 To n - 1
    resultMsg = resultMsg & "X(" & i & ") = " & X(i) & ", Z(" & i & ") = " & Z(i) & vbLF
Next

MsgBox resultMsg