import math

def f(n):
    if n >= 3210:
        return 1
    else:
        return math.ceil((3210 - n) / 3) * 7 + 1


def g(n):
    iterations = math.ceil(abs(10 - n) / 3)
    ostatok = n - iterations * 3
    if n < 10:
        return n
    else:
        return iterations * 5 + ostatok


f_val = f(15)
g_val = g(3000)
print(f_val - g_val)
