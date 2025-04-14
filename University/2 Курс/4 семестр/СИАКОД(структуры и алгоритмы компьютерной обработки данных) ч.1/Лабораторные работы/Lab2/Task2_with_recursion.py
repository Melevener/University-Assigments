def f(n, m, mult_count):
    if n == m:
        return 1
    if n > m or mult_count > 3:
        return 0
    count = 0
    count += f(n+2, m, mult_count)
    count += f(n*3, m, mult_count+1)
    if mult_count < 3:
        count += f(n*5, m, mult_count+1)

    return count

print(f(2,200,0))
