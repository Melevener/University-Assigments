#Task1 - Реализовать рекурсивное сложение двух чисел (a + b).
def recursive_sum(first_number, second_number):
    if second_number == 0:
        return first_number
    else:
        return recursive_sum(first_number + 1, second_number - 1)

#Выведет 4
print(recursive_sum(2, 2))

#Task2 - Осуществить перевод натурального числа из десятичной системы счисления в двоичную.
def decimal_to_binary(decimal_number):
    if decimal_number != 1:
        #print(decimal_number % 2)
        return decimal_to_binary(decimal_number // 2) + str(decimal_number%2)
    else:
        return '1'

#Выведет 1001    
print(decimal_to_binary(9))

#Task3 - Написать функцию, определяющую количество элементов (длину) заданного числового списка (массива) a, элементами которого являются целые числа.
def length_array(arr):
    if arr[1:] == []:
        return 1
    else:
        return length_array(arr[:-1]) + 1

#Выведет 6
print(length_array([1, 2, 3, 4, 8, 9]))

#Task4 - Написать функцию, определяющую сумму элементов заданного числового списка (массива) a, элементами которого являются целые числа.
def sum_array(arr):
    if arr[1:] == []:
        return arr[-1]
    else:
        return sum_array(arr[:-1]) + arr[-1]

#Выведет 27
print(sum_array([1, 2, 3, 4, 8, 9]))