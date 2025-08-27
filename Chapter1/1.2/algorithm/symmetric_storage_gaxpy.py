import numpy as np


def symmetrix_storage_gaxpy(y, Asym, x):
    n = len(x)
    for j in range(n):
        for i in range(j - 1):
            y[i] = y[i] + Asym[(i - 1) * n - i * (i - 1) / 2 + j] * x[j]
        for i in range(j, n):
            y[i] = y[i] + Asym[(j - 1) * n - j * (j - 1) / 2 + i] * x[j]
