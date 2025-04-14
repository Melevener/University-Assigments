import random
import time

def func1(N):
    start1 = time.time()
    k = 0
    a = [0] * N
    
    while k < N:
        x = random.randint(1, N)
        i = 0
        while i < k and a[i] != x:
            i += 1
        if i == k:
            a[k] = x
            k += 1
    finish1 = time.time() - start1
    return finish1

def func2(N):
    start2 = time.time()
    ready = [True for i in range(1, N+1)]
    k = 0
    a = [0] * N

    while k < N:
        x = random.randint(1, N)
        if ready[x-1]:
            k += 1
            a[k-1] = x
            ready[x-1] = False
    finish2 = time.time() - start2
    return finish2

def func3(N):
    start3 = time.time()
    ready = [True] * (N + 1)
    a = [0] * N
    
    for i in range(1, N + 1):
        ready[i] = True
    
    for k in range(N, 0, -1):
        x = random.randint(1, k)
        i = 0
        cnt = 0
        while cnt < x:
            i += 1
            if ready[i]:
                cnt += 1
        a[k - 1] = i
        ready[i] = False
    finish3 = time.time() - start3
    return finish3

def func4(N):
    start4 = time.time()
    list = [i for i in range(1, N + 1)]
    a = [0] * N
    
    for k in range(N, 0, -1):
        x = random.randint(0, k - 1)
        a[k - 1] = list[x]
        list[x:k] = list[x + 1:k + 1]
    finish4 = time.time() - start4
    return finish4

def func5(N):
    start5 = time.time()
    list = [i for i in range(1, N + 1)]
    a = [0] * N
    
    for k in range(1, N + 1):
        x = random.randint(0, N - 1)
        a[k - 1] = list[x]
        list[x], list[N - 1] = list[N - 1], list[x]
    finish5 = time.time() - start5
    return finish5

def func6(N):
    start6 = time.time()
    a = [i for i in range(1, N + 1)]
    
    for k in range(N, 0, -1):
        x = random.randint(0, k - 1)
        a[k - 1], a[x] = a[x], a[k - 1]
    finish6 = time.time() - start6
    return finish6

N = 10000
print(f"Время выполнения работы 1 алгоритма: {func1(N)}")
print(f"Время выполнения работы 2 алгоритма: {func2(N)}")
print(f"Время выполнения работы 3 алгоритма: {func3(N)}")
print(f"Время выполнения работы 4 алгоритма: {func4(N)}")
print(f"Время выполнения работы 5 алгоритма: {func5(N)}")
print(f"Время выполнения работы 6 алгоритма: {func6(N)}")