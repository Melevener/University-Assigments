import tkinter
from tkinter import *


def solve_function():
    #Вычисления над y по переменной x
    y = 0
    x = float(ent.get())
    if x <= 0:
        y = -2 - x
    elif 0 < x < 1:
        y = 0
    elif 1 <= x < 3:
        y = x
    else:
        y = 1 - x
    lb_result.config(text=f"Результат вычислений: {y}")


#Создание окна
root = tkinter.Tk()
root.title("Задание 1")
root.geometry("1600x900")

#Написание текста, поясняющего задание
lb_text1 = Label(text="Введите значение x:", fg="black")
lb_text1.pack()

lb_text2 = Label(text="(Посмотрите на картинку снизу, по ней выведется ваш ответ, смотря, какое значение x вы выберете)", fg="black")
lb_text2.pack()

#Ввод значения x
ent = Entry(root, width=30)
ent.pack(pady=10)

#Вставка картинки "функция"
image_path = "функция.png"
image = PhotoImage(file=image_path)
lb_image = tkinter.Label(root, image=image)
lb_image.pack(pady=10)

#Создание кнопки "Получить ответ"
button = tkinter.Button(root, text="Получить ответ", command=solve_function)
button.pack(pady=10)

#Вывод конечной функции
lb_result = tkinter.Label(root, text="")
lb_result.pack(pady=10)

root.mainloop()
