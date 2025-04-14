import math

def f(n):
    if n >= 39:
        return math.factorial(n)
    if n < 10000 and n % 2 == 0:
        return f(n+1)*f(n+2)
    if n < 10000 and n % 2 != 0:
        return (n+2) / f(n+2)

print(f(10)/f(38))