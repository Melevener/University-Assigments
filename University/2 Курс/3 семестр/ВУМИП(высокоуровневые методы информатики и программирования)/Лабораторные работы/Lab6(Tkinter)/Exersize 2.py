import tkinter
from tkinter import *


def solve_str_function():
    count_space = 0
    user_input = ent.get()
    for i in user_input:
        if i == " ":
            count_space += 1
    if count_space == 1:
        lb_result.config(text="-")
    if count_space > 1:
        first_space_index = user_input.find(" ")
        last_space_index = user_input.rfind(" ")
        result_user_input = user_input[first_space_index + 1: last_space_index]
        lb_result.config(text=f"Полученная подстрока: {result_user_input}")


#Создание окна
root = tkinter.Tk()
root.title("Задание 2")
root.geometry("1600x900")

lb_text1 = Label(text="Введите строку:", fg="black")
lb_text1.pack(pady=10)

ent = Entry(root, width=30)
ent.pack()

#Создание кнопки "Получить ответ"
button = tkinter.Button(root, text="Получить ответ", command=solve_str_function)
button.pack(pady=10)

#Вывод результата
lb_result = Label(root, text="")
lb_result.pack(pady=10)

root.mainloop()
