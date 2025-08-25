= P1.1.6

Suppose $W in RR^(n times n)$ is defined by
$ w_(i j)=sum_(p=1)^(n) sum_(q=1)^(n) x_(i p)y_(p q)z_(q j) $
where $X,Y,Z in RR^(n times n)$.

If we use this formula we get $O(n^(4))$ operations

On the other hand,
$ w_(i j)=sum_(p=1)^(n)  x_(i p)(sum_(q=1)^(n) y_(p q)z_(q j))=sum_(p=1)^(n) x_(i p)u_(p j) $

where $U=Y Z$. Thus $W=X U=X Y Z$ and only require $O(n^3)$ operations

== Question
Use this methodology to develop a $O(n^3)$ procedure for computing the n-by-n matrix $A$ defined by:

$ a_(i j)=sum_(k_1=1)^(n) sum_(k_2=1)^(n)sum_(k_3=1)^(n) E(k_1,i)F(k_1,i)G(k_2,k_1)H(k_2,k_3)F(k_2,k_3)G(k_3,j) $

Hint: Transposes and Pointwise products

+ Pointwise products:
  + Note: $E(k_1,i)F(k_1,i)=I(k_1,i)$, i.e. $I = E.*F$
  + Note: $H(k_2,k_3)F(k_2,k_3)=J(k_2,k_3)$, i.e. $J = H.*F$
$ a_(i j)=sum_(k_1=1)^(n) sum_(k_2=1)^(n)sum_(k_3=1)^(n) I(k_1,i)G(k_2,k_1)J(k_2,k_3)G(k_3,j) $
2. Multiply $k_3$:
  + $K=J G$
$ a_(i j)&=sum_(k_1=1)^(n) sum_(k_2=1)^(n) I(k_1,i)G(k_2,k_1)sum_(k_3=1)^(n)J(k_2,k_3)G(k_3,j)\
&=sum_(k_1=1)^(n) sum_(k_2=1)^(n) I(k_1,i)G(k_2,k_1)K(k_2,j)
$
3. Transpose G
$ a_(i j)&=sum_(k_1=1)^(n) sum_(k_2=1)^(n) I(k_1,i)G^(T)(k_1,k_2)K(k_2,j) $
4. Multiply $k_2$
  + $L= G^(T)K$
$ a_(i j)&=sum_(k_1=1)^(n)  I(k_1,i)sum_(k_2=1)^(n)G^(T)(k_1,k_2)K(k_2,j) \
&=sum_(k_1=1)^(n)  I(k_1,i)L(k_1,j)
$
5. Transpose I and Multiply $k_1$
$ a_(i j)&=sum_(k_1=1)^(n)  I^(T)(i, k_1)L(k_1,j) $

In all we get:
$ A &= I^(T)L\
  &= (E.*F)^(T)G^(T)K \
  &= (E.*F)^(T)G^(T)J G \
  &= (E.*F)^(T)G^(T)(H.*F) G \
$
Operation count:
1. 2 pointwise products: $2 times O(n^2)$
+ 2 transposes: $2 times O(n^2)$
+ 3 matrix multiplication: $3 times O(n^3)$
Dominated by $O(n^3)$
