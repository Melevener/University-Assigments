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


Fraction1 = Fraction(3, 4)
print(Fraction1.persent())
print(Fraction1.summa_znamenatelia())
