#Без использования рекурсии
def f(start, end):
    res_mult = 1
    first_value = 1
    while start != end:
        if first_value == 1:
            start += 3
            res_mult = res_mult * start
            first_value += 1
        else:
            start += 4
            res_mult = res_mult * start
    return res_mult


print(f(10, 38))
#4 108 329 225