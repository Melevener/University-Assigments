Const City = "Новочебоксарск"
Const Number = 19
Const Predmet = "Информатика"

First_letter = "<(" & City & ")" & " " & ",(" & Cstr(Number) & ")" & " " & _
			   ",(" & Predmet & ")>" 
Second_letter = "<Мой любимый предмет был " & "(" & Predmet & ") , когда я учился в " _
				& "(" & Cstr(Number) & ")" & vbLF & "школе города " & "(" & City & ")"

Result = MsgBox(City & vbLF & _
				Cstr(Number) & vbLF & _
				Predmet & vbLF & _
				First_letter & vbLF & Second_letter, , _
				"Ввод константы")
