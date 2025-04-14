Dim numElements, i
Dim arr()
Dim result, allStrings
Dim isValidInput, userInput

Do
    isValidInput = True
    numElements = InputBox("������� ���������� ����� ��� �������" & vbLF & "(�� ����� 5 � �� ����� 50):", "���������� �����")
    
    If numElements = "" Then
        WScript.Quit
    End If

    numElements = Replace(numElements, ".", ",")

    If Not IsNumeric(numElements) Then
        MsgBox "�������� �������� �� ��������!" & vbLF & "����������, ������� ����� �����", vbExclamation
        isValidInput = False
    Else
        numElements = CDbl(numElements)

        If (numElements * 10) Mod 10 <> 0 Then
            If Int(numElements) = numElements Then
                numElements = Int(numElements)
            Else
                MsgBox "����������, ������� ����� ����� ��� ������� �����!", vbExclamation
                isValidInput = False
            End If
        ElseIf numElements < 5 Then
            MsgBox "���������� ����� ������ ���� �� ����� 5.", vbExclamation
            isValidInput = False
        ElseIf numElements > 50 Then
            MsgBox "�� ����� ������� ������� �����!" & vbLF & "� ���� ���������� �� ����� 50 �����", vbCritical
            isValidInput = False
        End If
    End If
Loop Until isValidInput

ReDim arr(numElements - 1)
allStrings = ""

For i = 0 To numElements - 1
    Do
        userInput = InputBox("������� ����� ��� ������ �" & (i + 1) & ":")
        
        If userInput = "" Then
            If Not IsEmpty(userInput) Then
                MsgBox "�� ������ �� �����. �������� ���-������!", vbExclamation
            Else
                WScript.Quit
            End If
        End If
        
        arr(i) = userInput
    Loop Until arr(i) <> ""
    allStrings = allStrings & "������ �" & (i + 1) & ": " & arr(i) & vbLF
Next

result = Join(arr, " ")

MsgBox "��� ������:" & vbCrLf & allStrings & vbCrLf & "����������� ������: " & result