import numpy as np


def first_column(A, x):
    """
    calculate the first column of M = (A-x1I)...(A-xrI)
    """
    r = len(x)
    n = len(A)
    result_column = np.zeros((n, 1))
    result_column[0] = 1

    for i in range(r):
        y = np.dot(A, result_column) - x[i] * result_column
        result_column = y

    return result_column


def compute_M_directly(A, x):
    """
    direct calculate M = (A-x1I)(A-x2I)...(A-xrI) and extract the first column
    """
    n = len(A)
    I = np.eye(n)  # 单位矩阵

    # 初始化M为单位矩阵
    M = np.eye(n)

    # 计算 M = (A-x1I)(A-x2I)...(A-xrI)
    for i in range(len(x)):
        term = A - x[i] * I
        M = np.dot(M, term)

    # 返回第一列
    first_column = M[:, 0].reshape(-1, 1)
    return first_column


def test_first_column():
    """
    测试函数，验证 first_column 计算的是 M = (A-x1I)...(A-xrI) 的第一列
    """
    print("测试 first_column 函数")
    print("=" * 50)

    # 测试用例1
    print("测试用例1:")
    A1 = np.array([[2, 1], [1, 2]], dtype=float)
    x1 = np.array([1, 3])

    print("矩阵 A:")
    print(A1)
    print("向量 x:", x1)

    # 使用原函数计算
    result1 = first_column(A1, x1)
    print("\n使用 first_column 计算的结果:")
    print(result1.flatten())

    # 直接计算M的第一列
    direct_result1 = compute_M_directly(A1, x1)
    print("直接计算 M 的第一列:")
    print(direct_result1.flatten())

    # 验证是否相等
    is_equal1 = np.allclose(result1, direct_result1)
    print("结果是否相等:", is_equal1)
    print()

    # 测试用例2
    print("测试用例2:")
    A2 = np.array([[3, 1, 0], [1, 3, 1], [0, 1, 3]], dtype=float)
    x2 = np.array([1, 2])

    print("矩阵 A:")
    print(A2)
    print("向量 x:", x2)

    # 使用原函数计算
    result2 = first_column(A2, x2)
    print("\n使用 first_column 计算的结果:")
    print(result2.flatten())

    # 直接计算M的第一列
    direct_result2 = compute_M_directly(A2, x2)
    print("直接计算 M 的第一列:")
    print(direct_result2.flatten())

    # 验证是否相等
    is_equal2 = np.allclose(result2, direct_result2)
    print("结果是否相等:", is_equal2)
    print()

    # 测试用例3 - 更大的矩阵
    print("测试用例3:")
    A3 = np.array([[4, 1, 0, 0], [1, 4, 1, 0], [0, 1, 4, 1], [0, 0, 1, 4]], dtype=float)
    x3 = np.array([1, 2, 3])

    print("矩阵 A:")
    print(A3)
    print("向量 x:", x3)

    # 使用原函数计算
    result3 = first_column(A3, x3)
    print("\n使用 first_column 计算的结果:")
    print(result3.flatten())

    # 直接计算M的第一列
    direct_result3 = compute_M_directly(A3, x3)
    print("直接计算 M 的第一列:")
    print(direct_result3.flatten())

    # 验证是否相等
    is_equal3 = np.allclose(result3, direct_result3)
    print("结果是否相等:", is_equal3)


if __name__ == "__main__":
    test_first_column()
