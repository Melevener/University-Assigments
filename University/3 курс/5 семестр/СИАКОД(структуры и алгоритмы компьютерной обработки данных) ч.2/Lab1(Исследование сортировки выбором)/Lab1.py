import time
import random

#Массив случайных чисел
def random_array(size, lower_bound, upper_bound):
    return [random.randint(lower_bound, upper_bound) for _ in range(size)]

#Алгоритм сортировки Выбором
def selection_sort(arr):
    length = len(arr)
    comparisons = 0
    swaps = 0

    for i in range(length - 1):
        m = i
        for j in range(i + 1, length):
            comparisons += 1
            if arr[j] < arr[m]:
                m = j
        comparisons += 1   
        if arr[i] != arr[m]:
            arr[i], arr[m] = arr[m], arr[i]
            swaps += 1

    return arr, comparisons, swaps

#Создание и сортировка масива
rand_arr = random_array(1000000, 1, 1000000)

start_time = time.time()

sort_arr, comparisons, swaps = selection_sort(rand_arr)

end_time = time.time()

result_time = end_time - start_time

print(f"Количество перестановок(С): {comparisons}")
print(f"Количество обменов(М): {swaps}")
print(f"Время выполнения работы сортировки: {result_time:.5f} секунд")
# #------------------------------------------------------------------------
# start_time2 = time.time()

# sort_arr2, comparisons2, swaps2 = selection_sort(sort_arr)

# end_time2 = time.time()

# result_time2 = end_time2 - start_time2

# print(f"Количество перестановок(С): {comparisons2}")
# print(f"Количество обменов(М): {swaps2}")
# print(f"Время выполнения работы сортировки: {result_time2:.5f} секунд")
#------------------------------------------------------------------------
# sort_arr.reverse()

# start_time3 = time.time()

# sort_arr3, comparisons3, swaps3 = selection_sort(sort_arr)

# end_time3 = time.time()

# result_time3 = end_time3 - start_time3

# print(f"Количество перестановок(С): {comparisons3}")
# print(f"Количество обменов(М): {swaps3}")
# print(f"Время выполения работы сортировки: {result_time3:.5f} секунд")
