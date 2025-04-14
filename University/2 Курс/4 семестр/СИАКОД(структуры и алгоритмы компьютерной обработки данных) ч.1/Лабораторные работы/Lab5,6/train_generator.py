import random
import os

def generate(filename, num_records):
    if os.path.exists(filename):
        print(f"Файл {filename} уже существует.")
        return
    cities = ["Москва", "Санкт-Петербург", "Новосибирск", "Екатиренбург", "Казань", "Нижний Новгород", "Челябинск", "Красноярск", "Самара", "Уфа", "Ростов-на-Дону", "Омск", "Краснодар", "Воронеж", "Пермь", "Волгоград", "Чебоксары"]

    with open(filename, 'w') as file:
        for _ in range(num_records):
            train_number = random.randint(100, 999)
            destination = random.choice(cities)
            departure_time = f"{random.randint(0, 23):02}:{random.randint(0,59):02}"
            arrival_time = f"{random.randint(0, 23):02}:{random.randint(0,59):02}"
            available_seats = random.randint(0, 500)
            file.write(f"{train_number},{destination},{departure_time},{arrival_time},{available_seats}\n")

if not os.path.exists("trains.txt"):
    generate("trains.txt", 1000000)


