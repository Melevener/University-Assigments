def change(n):
    if 0 <= n <= 2:
        return 1
    elif 3 <= n <= 4:
       return change(n- 1) + change(n - 3)
    elif 5 <= n < 10:
        return change(n - 1) + change(n - 3) + change (n - 5)
    elif n >= 10:
        return change(n - 1) + change(n - 3) + change (n - 5) + change(n - 10)

print(change(11))


