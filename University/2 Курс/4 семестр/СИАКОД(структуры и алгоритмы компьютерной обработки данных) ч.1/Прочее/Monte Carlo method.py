import random
import math


def cosinus_integral(a, b, n):
    c = 1
    np = 0
    for i in range(n):
        x = random.uniform(a, b)
        y = random.uniform(0, 1)
        if y < math.cos(x): 
            np += 1
    result = np / n
    return result * (b - a) * c


print(cosinus_integral(0, math.pi/2, 10000))



