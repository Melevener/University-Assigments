class Fraction:
    # Конструктор для инициализации обьекта:

    def __init__(self, chislitel, znamenatel):
        self.chislitel = chislitel
        self.znamenatel = znamenatel
    # Функция выражения в процентах:

    def persent(self):
        drob_procent = (self.chislitel/self.znamenatel) * 100
        return drob_procent
    # Функция подсчета значений знаменателя

    def summa_znamenatelia(self):
        summ = 0
        znamenatel_stroka = str(self.znamenatel)
        for i in range(len(znamenatel_stroka)):
            summ += int(znamenatel_stroka[i])
        return summ
    # Информация о полях

    def __str__(self):
        print(f"Дробь с числителем {self.chislitel} и знаменателем {self.znamenatel}")
    # Деструктор:

    def __del__(self):
        print("Программа завершила работу")


class Potomok(Fraction):
    # Конструктор для класса наследника(с использованием метода super())
    def __init__(self, whole, chislitel, znamenatel):
        super(Potomok, self).__init__(chislitel, znamenatel)
        self.whole = whole

    # Нахождение вещественного числа из целой и дробной части
    def solve(self):
        total = self.whole + (self.chislitel / self.znamenatel)
        return f"Полученное вещественное число: {total}"

    def __str__(self):
        return f"Дробь с целой частью {self.whole}, числителем {self.chislitel} и знаменателем {self.znamenatel}"


drob = Potomok(1, 2, 5)
print(drob)
print(drob.solve())
