start = 10
end = 33
arr = [0] * (end + 1)
arr[10] = 1

for i in range(start + 1, end + 1):
    arr[i] = arr[i - 1] + arr[i - 10]

print(arr)