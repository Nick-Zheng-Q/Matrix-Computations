= Chapter 1.1 keypoints

== Saxpy

```python
for i in range(n):
  y[i] = y[i] + a * x[i]
```

== Gaxpy
$ y = y + A x $
$ y_i = y_i + sum_(j=1)^n a_(i j)x_j $

- Row-oriented Gaxpy
  - regard $A x$ as a linear combination of A's columns

```python
  for j in range(n):
  for i in range(m):
    y[i] = y[i] + A[i][j] * x[j]
```
- Column-oriented Gaxpy

```python
for j in range(n):
  for i in range(m):
    y[i] = y[i] + A[i][j] * x[j]
```

Note: 
- the inner loop in gaxpy is a saxpy

== Outer Product Update

$ A = A + x y^T $

```python
for i in range(m):
  for j in range(n):
    A[i][j] = A[i][j] + x[i]y[j]
```

== Matrix-matrix multiplication

=== Scalar level
```python
for i in range(m):
  for j in range(n):
    for k in range(r):
    C[i][j] = C[i][j] + A[i][k]*B[k][j]
```

There are 6 loop order:
#table(
  columns: 4,
  align: center,
  [*Loop Order*], [*Inner Loop*], [*Inner 2 Loops*], [*Inner Loop Data Access*],
  [ijk], [dot], [vector $times$ matrix], [A: row, B: column],
  [jik], [dot], [matrix $times$ vector], [A: row, B: column],
  [ikj], [saxpy], [row gaxpy], [B: row, C: column],
  [jki], [saxpy], [column gaxpy], [A: column, C: column],
  [kij], [saxpy], [row outer product], [B: row, C: row],
  [kji], [saxpy], [column outer product], [A: column, C: column],
)

== Complex Matrices

1. Transpose becomes _conjugate transposition_
$ C = A^H arrow c_(i j) = macron(a)_(j i) $
2. vector dot product
$ s= x^H y = sum_(i=1)^n macron(x)_i y_i $

