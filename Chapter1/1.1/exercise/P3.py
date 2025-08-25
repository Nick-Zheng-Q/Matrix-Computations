import numpy as np


def compute_C_xyT_power_k(x, y, k):
    """
    O(n^2) algorithm for computing C = (xy^T)^k where x and y are n-vectors

    idea:
    (xy^T)^k = x(y^Tx)^(k-1)y^T

    Time analysis：
    - calculate y^Tx: O(n)
    - calculate (y^Tx)^(k-1): O(1)
    - calculate result: O(n^2)
    overall: O(n^2)

    return:
    C: n×n matrix: (xy^T)^k
    """
    n = len(x)

    if k == 0:
        return np.eye(n)

    if k == 1:
        return np.outer(x, y)

    yTx = np.dot(y, x)

    if yTx == 0:
        return np.zeros((n, n))

    # calculate (y^T x)^(k-1) - O(1)
    scalar_power = yTx ** (k - 1)

    xyT = np.outer(x, y)  # O(n^2)
    C = scalar_power * xyT  # O(n^2)

    return C


def direct_compute(x, y, k):
    xyT = np.outer(x, y)  # O(n^2)

    C = np.eye(len(x))
    for _ in range(k):
        C = np.dot(C, xyT)

    return C


def verify_result(x, y, k):
    C_direct = direct_compute(x, y, k)

    C_fast = compute_C_xyT_power_k(x, y, k)

    is_correct = np.allclose(C_direct, C_fast)

    print(f"k = {k}")
    print(f"direct result:\n{C_direct}")
    print(f"fast result:\n{C_fast}")
    print(f"same?: {is_correct}")
    print("-" * 40)

    return is_correct


def main():
    """
    test
    """

    print("test case 1:")
    x1 = np.array([1, 2, 3], dtype=float)
    y1 = np.array([1, 1, 1], dtype=float)

    print(f"x = {x1}")
    print(f"y = {y1}")
    print()

    for k in range(0, 4):
        verify_result(x1, y1, k)

    print("\ntest case 2:")
    x2 = np.array([2, -1], dtype=float)
    y2 = np.array([1, 3], dtype=float)

    print(f"x = {x2}")
    print(f"y = {y2}")
    print()

    for k in range(0, 3):
        verify_result(x2, y2, k)

    print("\nperformance analysis:")
    n = 1000
    x_large = np.random.randn(n)
    y_large = np.random.randn(n)

    import time

    start_time = time.time()
    C_fast = compute_C_xyT_power_k(x_large, y_large, 5)
    fast_time = time.time() - start_time

    print(f"when n = {n} :")
    print(f"O(n^2) algorithm time: {fast_time:.6f} 秒")
    print(f"shape of matrix C: {C_fast.shape}")


if __name__ == "__main__":
    main()
