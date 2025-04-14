def check(n):
    d = 2
    arr = []
    while d * d <= n:
        if n % d == 0:
            arr.append(d)
            if len(arr) == 3:
                break
        d += 1

    s_n = 0
    if len(arr) < 2:
        return (False, 0)
    if len(arr) == 2:
        if n == arr[1] ** 2:
            s_n += arr[0]
        else:
            s_n += arr[1]
        s_n += n // arr[0] + n // arr[1]
    else:
        s_n = n // arr[0] + n // arr[1] + n // arr[2]

    return (str(s_n) == ''.join(sorted(str(s_n), reverse=True)), s_n)

count = 0
n = 10**7 + 1
while count < 5:
    flag, s_n = check(n)
    if flag:
        print(n, s_n)
        count += 1
    n += 1