#import "../utils.typ": *

= 习题课 1

摘要: 归纳/初等不等式/可数/习题选讲

== 归纳公理

#statement[
    $
    cases(
    0 in S,
    n in S => n+1 in S
    )
    quad => quad S = NN
    $
]

=== 例题

- $forall n in NN, f(n) = n^4 + 2n^3 + 2n^2 + n$ 证明 $6 | f(n)$
    - 《数学基础选讲》 程艺 P3

#v(6cm)

- $a_1, a_2, ..., a_n (n>=2)$都是正数且$a_1 + a_2 + ... + a_n < 1$,求证:
$
1/(1- sum_(k=1)^n a_k) > product_(k=1)^n (1+a_k) > 1 + sum_(k=1)^n a_k
$

#v(6cm)

#pagebreak()
== 初等不等式

=== Cauchy 不等式

#statement[
    $
    forall a_1, a_2, ..., a_n, b_1, b_2, ..., b_n in RR
    quad
    (sum_(k=1)^n a_k^2)(sum_(k=1)^n b_k^2) >= (sum_(k=1)^n a_k b_k)^2
    $

    $
    <=> x, y in RR^n quad abs(x dot.c y) <= abs(x) abs(y)
    $
]

#proof[
    考虑二次函数:

    $
    (a_1 x + b_1)^2 + (a_2 x + b_2)^2 + ... + (a_n x + b_n)^2 \
    = sum_(k=1)^n a_k^2 x^2 + 2 sum_(k=1)^n a_k b_k x + sum_(k=1)^n b_k^2
    $

    由于二次函数恒大于等于0, 所以判别式小于等于0, 即:
    $
    Delta/4 = (sum_(k=1)^n a_k b_k)^2 - (sum_(k=1)^n a_k^2)(sum_(k=1)^n b_k^2) <= 0 quad  qed
    $
]

=== Bernoulli 不等式

#statement[
    $
    forall x in RR, quad x >= -1 quad n in NN, n >= 2\

    (1+x)^n >= 1 + n x
    $
]

#proof[
    #v(6cm)
]

=== HM-GM-AM-QM 不等式

#statement[
    $
    forall a_1, a_2, ..., a_n in RR_+\
    n/(1/a_1 + 1/a_2 + ... + 1/a_n) <= (a_1 a_2 ... a_n)^(1/n) <= (a_1 + a_2 + ... + a_n)/n <= sqrt((a_1^2 + a_2^2 + ... + a_n^2)/n)
    $
]

#proof[
    #v(6cm)
]

#pagebreak()

== 可数

=== 集合间映射
=== 集合的基数
=== 可数
==== 性质

- 有限个可数集的并是可数的, 可数个可数集的并是可数的

- 如果集合A是可数的, 集合B是有限的, 那么A x B是可数的:
$
A times B := {(a, b) | a in A, b in B}
$

- $abs(2^X) = 2^abs(X)$

==== 不可数集

- $2^NN$, Cantor对角线方法
- $RR$, 也类似于Cantor对角线方法

#pagebreak()

== 习题选讲


#pagebreak()

