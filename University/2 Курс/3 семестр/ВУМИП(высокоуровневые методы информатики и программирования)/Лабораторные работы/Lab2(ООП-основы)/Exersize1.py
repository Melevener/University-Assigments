class Money:
    # Конструктор для инициализации объектов

    def __init__(self, nominal, count):
        self.nominal = nominal
        self.count = count
    # Подсчет суммы

    def summa(self):
        return self.nominal * self.count
    # Формирование строки с информацией об обьекте

    def __str__(self):
        return f"{self.count} монет достоинством {self.nominal} рублей"


# Кошель с 50 монетами номиналом 1 рубль
wallet1 = Money(1, 50)
print(f"Сумма {wallet1} составляет {wallet1.summa()} рублей")

