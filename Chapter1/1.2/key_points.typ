#set math.mat(delim: "[")
#set math.vec(delim: "[")
= 1.2 Structure and Efficiency

== 1.2.1 Band Matrices
_band matrix_: a special case of sparse matrix

We say that $A in RR^(m times n)$ has:
- _lower bandwidth p_: if $a_(i j)=0$ whenever $i>j+p$
- _upper bandwidth p_: if $a_(i j)=0$ whenever $j>i+p$

Band structures that occur frequently in @terminologies:
#figure(
  table(
    columns:3,
    align: center,
    [Type of Matrix], [Low bandwidth], [Upper bandwidth],
    [Diagonal], [0], [0],
    [Upper triangular], [0], [n-1],
    [Lower triangular], [m-1], [0],
    [Tridiagonal], [1], [1],
    [Upper bidiagonal], [0], [1],
    [Lower bidiagonal], [1], [0],
    [Upper Hessenberg], [1], [n-1],
    [Lower Hessenberg], [m-1], [1],
  ),
  caption: [Band terminologies],
)<terminologies>


== 1.2.2 Triangular Matrix multiplication
if $C=A B$ where A,B,C are all n-by-n and upper triangular. we get:
$ c_(i j)=c_(i j)+sum_(k=i)^(j)a_(i k)b_(k j) $
Algorithm:
```python
for i in range(n):
  for j in range(i,n):
    for k in range(i,j):
      C[i][j]=C[i][j]+A[i][k]*B[k][j]
```

== 1.2.3 Colon Notation
$ A(r,p:q) =[a_(r p) | ... | a_(r q)] in RR^(1 times (q-p+1)) $
$ A(p:q,c) = vec(a_(p c), dots.v, a_(q c)) in RR^(q-p+1) $

== 1.2.4 Assessing
triangular matrix multiplication requires $1/6$ flops of full matrix multiplication

*Note: we cannot infer 6 times faster*

== 1.2.5 Band storage
Suppose $A in RR^(n times n)$ has lower bandwidth p and upper bandwidth q.
Such a matrix can be stored in a (p+q+1)-by-n array $A.b a n d$ with the convention tat:
$ a_(i j)=A.b a n d(i-j+q+1,j) $

$ mat(
  a_11, a_12, a_13, 0, 0, 0;
  a_21, a_22, a_23, a_24, 0, 0;
  0, a_32, a_33, a_34, a_35, 0;
  0, 0, a_43, a_44, a_45, a_46;
  0, 0, 0, a_54, a_55, a_56;
  0, 0, 0, 0, a_65, a_66;
) arrow mat(
  *, *, a_13, a_24, a_35, a_46;
  *, a_12, a_23, a_34, a_45, a_56;
  a_11, a_22, a_33, a_44, a_55, a_66;
  a_21, a_32, a_34, a_54, a_65, *;
) $

*Note:* we obtain a column-oriented saxpy procedure.
involves $2n(p+q+1)$ flops

== 1.2.6 Diagonal Matrices
$D in RR^(m times n)$ is diagonal, notation:
$ D="diag"(d_1, dots, d_q), q=min{m,n} arrow.l.r.double d_i=d_(i i) $

$ B=D A arrow.l.r.double B(i,:)=d_(i)dot A(i,:), i=1:m $
$ B=A D arrow.l.r.double B(:,j)=d_(j)dot A(:,j), j=1:n $
require $m n$ flops

== 1.2.7 Symmetry
- _symmetric_: $A^(T)=A$
- _skew-symmetric_: $A^(T)=-A$
- _Hermitian_: $A ^(H)=A$
- _skew-symmetric_: $A^(H)=-A$

storage can be halved:
$ A = mat(
  1,2,3;
  2, 4, 5;
  3,5,6;
) arrow.l.r.double A."vec"=[1,2,3,4,5,6] $
generally:
$ A."vec"((n-j/2)(j-1)+i)=a_(i j), 1<=j<=i<=n $

== 1.2.8 Permutation matrices and the identity
- _identity matrix_: $I_n$
- $e_i$: _i_ th column of $I_n$
- _permutation matrix_: rows of $I_n$ reordered: using a vector to denote where the "1" occurs

== 1.2.10 Working with Permutation Matrices
$P=I _(n)(v,:)$, then:
- $y=P x arrow.double y=x(v) arrow.double y_i=x_(v_i)$
- $y=P ^(T) x arrow.double y(v)=x arrow.double y_(v_i)=x_i$

*Note*: The inverse of a permutation matrix is its transpose

No flops but moves data $=>$ contribute to execution time

== 1.2.11 Three famous permutation matrices
=== Exchange permutation
$cal(E)_n = I_n (v,:)$ where $v=n:-1:1$

Function:
- turns vectors upside down

Attribute:
- $cal(E)_n^(T)cal(E)_n=cal(E)_n^(2)=I_n$
=== Downshift permutation
$cal(D)_n = I_n (v,:)$ where $v=n, 1:n-1$

Function:
- pushes the components of a vector down one notch with wraparound

Attribute:
- $cal(D)_n ^(T)$ can be called a _upstream_ permutation

=== mod-p perfect shuffle permutation
$ cal(P)_(p,r) = I_n ([(1:r:n) (2:r:n) dots (r:r:n)],:) $
$ cal(P)_(p,r)^(T) = I_n ([(1:p:n) (2:p:n) dots (p:p:n)],:) $

Function:
- treat the length $n=p r$ vector $x$ as cards in a deck.
- cuts the deck into $p$ equal piles
- reassemble by taking one card from each pile in turn
