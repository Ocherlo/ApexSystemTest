a = []
for i in range(10):
    if (i > 1):
        fn1 = a[i -1]
        fn2= a[i -2]
        fn = fn1 + fn2
        print(fn)
        a.append(fn)
    else:
        print(i)
        a.append(i)   
# 0 1 1 2 3
