def compare(m, n, p, q):
    """
    D=ABC where A is m*n matrix, B is n*p matrix, C is p*q matrix.
    Under what condition is D=(AB)C more flop-efficient than D=A(BC)
    """
    ab_and_c = n * p * q + m * n * q
    a_and_bc = m * n * p + m * p * q

    result = 0 if m * n * (p - q) < p * q * (n - m) else 1
