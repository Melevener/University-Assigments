def min_change(n):
    if n == 0:
        return 0
    elif n == 1 or n == 3 or n == 5 or n == 10:
        return 1
    elif n == 2:
        return 2
    elif 3 < n < 5:
        return 1 + min(min_change(n - 1), min_change(n - 3))
    elif 5 < n < 10:
        return 1 + min(min_change(n - 1), min_change(n - 3), min_change(n - 5))
    elif n > 10:
        return 1 + min(min_change(n - 1), min_change(n - 3), min_change(n - 5), min_change(n - 10))     

print(min_change(16))
