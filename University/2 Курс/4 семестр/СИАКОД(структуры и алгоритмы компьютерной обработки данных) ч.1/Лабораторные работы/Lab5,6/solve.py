import train_generator

#Тернарный метод
def ternary_search(arr, num):
    l = 0
    r = len(arr) - 1
    while l <= r:
        h = (r - l) // 3
        m1 = l + h
        m2 = r - h

        if arr[m1] == num:
            return m1
        if arr[m2] == num:
            return m2
        if arr[m1] < num < arr[m2]:
            l = m1 + 1
            r = m2 - 1
        elif num < arr[m1]:
            r = m1 - 1
        else:
            l = m2 + 1
    return None

#Поиск по номеру методом тернарного поиска
def search_train_number(filename, train_number):
    train_numbers = []
    with open(filename, 'r') as file:
        for i, line in enumerate(file):
            train_data = line.strip().split(',')
            train_numbers.append((int(train_data[0]), i)) 
    train_numbers.sort(key=lambda x: x[0])  
    index = ternary_search([x[0] for x in train_numbers], train_number)  
    if index is not None:
        with open(filename, 'r') as file:
            for i, line in enumerate(file):
                if i == train_numbers[index][1]:
                    train_data = line.strip().split(',')
                    return train_data
    return None

print("Введите номер поезда для поиска:")
train_number = int(input())
result = search_train_number("trains.txt", train_number)
if result:
    train_number, destination, departure_time, arrival_time, available_seats = result
    print(f"Информация о поезде:\n"
          f"Номер поезда: {train_number}\n"
          f"Место назначения: {destination}\n"
          f"Время отправления: {departure_time}\n"
          f"Время прибытия: {arrival_time}\n"
          f"Свободные места: {available_seats}\n")
else:
    print("Поезд с таким номером не найден.")
