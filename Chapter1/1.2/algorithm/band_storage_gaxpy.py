import numpy as np


def band_storage_gaxpy(y, Aband, x, p, q):
    n = len(x)
    for j in range(n):
        alpha1 = max(1, j - q)
        alpha2 = min(n, j + q)
        beta1 = max(1, q + 2 - j)
        beta2 = beta1 + alpha2 - alpha1
        y[alpha1:alpha2] = y[alpha1:alpha2] + Aband[beta1:beta2, j] * x[j]
