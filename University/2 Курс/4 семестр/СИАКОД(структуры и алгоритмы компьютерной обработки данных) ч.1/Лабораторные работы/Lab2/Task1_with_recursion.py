def f(n, m):
    tens_position = n // 10 % 10
    if n == m:
        return 1
    if n > m:
        return 0
    if n < m:
        if tens_position < 9:
            return f(n+1, m) + f(int(str(n)[:-2] + str(tens_position + 1) + str(n)[-1]), m)
        else:
            return 0
    
print(f(10,33))


