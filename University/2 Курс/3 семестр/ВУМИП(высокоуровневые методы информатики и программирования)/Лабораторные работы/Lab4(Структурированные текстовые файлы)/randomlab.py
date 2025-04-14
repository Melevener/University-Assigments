import random
with open("surnames", 'r', encoding="utf-8", ) as file:
    surnames = list(map(lambda s: s.rstrip(), file.readlines()))


def random_name():
    name = random.randint(ord("А"), ord("Ш"))
    patronymic = random.randint(ord("А"), ord("Ш"))
    return f"{random.choice(surnames)} {chr(name)}. {chr(patronymic)}."


car_letter = ["А", "В", "Е", "К", "М", "Н", "О", "Р", "С", "Т", "У", "Х"]


def car_number():
    begin = random.choice(car_letter)
    middle = str(random.randint(0, 999)).zfill(3)
    end = random.choice(car_letter) + random.choice(car_letter)
    return f"{begin}{middle}{end}21"


def way_number():
    return random.randint(1, 24)


def fine_count():
    return random.randint(0, 100)
