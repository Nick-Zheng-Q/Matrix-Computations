m, n, r = 2, 2, 2

print("=== 顺序1: i-j-k ===")
for i in range(m):
    for j in range(n):
        for k in range(r):
            print(f"a{i+1}{k+1}b{k+1}{j+1}")

print("\n=== 顺序2: i-k-j ===")
for i in range(m):
    for k in range(r):
        for j in range(n):
            print(f"a{i+1}{k+1}b{k+1}{j+1}")

print("\n=== 顺序3: j-i-k ===")
for j in range(n):
    for i in range(m):
        for k in range(r):
            print(f"a{i+1}{k+1}b{k+1}{j+1}")

print("\n=== 顺序4: j-k-i ===")
for j in range(n):
    for k in range(r):
        for i in range(m):
            print(f"a{i+1}{k+1}b{k+1}{j+1}")

print("\n=== 顺序5: k-i-j ===")
for k in range(r):
    for i in range(m):
        for j in range(n):
            print(f"a{i+1}{k+1}b{k+1}{j+1}")

print("\n=== 顺序6: k-j-i ===")
for k in range(r):
    for j in range(n):
        for i in range(m):
            print(f"a{i+1}{k+1}b{k+1}{j+1}")
