#import "../utils.typ": *

= 习题课 1

```plain
Time: Week 1, 09.17 Sun. 19:00 ~ 20:30
```

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

#homework[
  $forall n in NN, f(n) = n^4 + 2n^3 + 2n^2 + n$ 证明 $6 | f(n)$ (《数学基础选讲》 程艺 P3)
]

#homework[
  $a_1, a_2, ..., a_n (n>=2)$都是正数且$a_1 + a_2 + ... + a_n < 1$,求证:
  $
  1 / (1- sum_(k=1)^n a_k) > product_(k=1)^n (1+a_k) > 1 + sum_(k=1)^n a_k
  $
]

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
  Delta / 4 = (sum_(k=1)^n a_k b_k)^2 - (sum_(k=1)^n a_k^2)(sum_(k=1)^n b_k^2) <= 0 quad qed
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
  $n=2$ 时,
  $
  (1+x)^2 = x^2 + 2x + 1 >= 1 + 2x
  $

  假设 $n=k$ 时成立, 则 $n=k+1$ 时:

  $
  (1+x)^{k+1} = (1+x)^k (1+x) >= (1+k x)(1+x) = 1 + (k+1)x + k x^2 >= 1 + (k+1)x
  $
]

=== HM-GM-AM-QM 不等式

#statement[
  $
  forall a_1, a_2, ..., a_n in RR_+\
  n / (1 / a_1 + 1 / a_2 + ... + 1 / a_n) <= (
    a_1 a_2 ... a_n
  )^(1 / n) <= (a_1 + a_2 + ... + a_n) / n <= sqrt((a_1^2 + a_2^2 + ... + a_n^2)/n)
  $

  其中几个平均值的定义为:

  - 算数平均值(#strong[A]rithmetic #strong[M]ean): $ "AM" = (a_1 + a_2 + ... + a_n)/n $
  - 几何平均值(#strong[G]eometric #strong[M]ean): $ "GM" = (a_1 a_2 ... a_n)^(1/n) $
  - 调和平均值(#strong[H]armonic #strong[M]ean): $ "HM" = n/(1/a_1 + 1/a_2 + ... + 1/a_n) $
  - 平方平均值(#strong[Q]uadratic #strong[M]ean): $ "QM" = sqrt((a_1^2 + a_2^2 + ... + a_n^2)/n) $
]

#caption[
  $"AM"$和$"GM"$的不等式有着很显然的几何意义:

  在$RR^2$上,
  $
  (a_1+a_2) / 2 >= sqrt(a_1 a_2)
  quad => quad
  2(a_1+a_2) >= 4sqrt(a_1 a_2)
  $

  意味着, 面积相同的矩形,正方形的周长最小.注意到相同的结论可以直接推广到$RR^n$上.
]

#proof[
  $"AM"$和$"GM"$的不等式,可通过上面这种性质做一个巧妙的证明:

  $ alpha = "AM" = 1 / n (a_1 + ... + a_n) $

  若 $a_1, a_2, ..., a_n$ 不全相等, 则存在 $a_i < alpha < a_j$, 对这两项做如下替换:

  $
  a_i^prime &= alpha \
  a_j^prime &= a_i + a_j - alpha
  $

  替换后满足:
  $
  "AM"^prime &= "AM" = alpha \
  "GM"^prime &= "GM" / (a_i dot.c a_j) * (a_i^prime dot.c a_j^prime) > "GM"
  $

  注意到 $"GM"^prime > "GM"$是严格的.

  重复上述过程, 直到所有的 $a_i$ 都等于 $alpha$(容易说明只需要至多$n-1$步), 此时:
  $
  "AM" = "GM"^((n)) > "GM"^((n-1)) > ... > "GM"^(prime) > "GM"
  $

  证毕.

  #caption[
    上述证明同时说明,等号成立当且仅当 $a_1 = a_2 = ... = a_n$. 此时无需经过变换,$"AM" = "GM"$.

    只要经过变换,就有严格的不等式成立.
  ]

  #homework[
    $"AM"$和$"GM"$的不等式,也可以通过归纳法证明.
  ]
]

#proof[
  首先说明$"AM"$和$"QM"$的不等式:

  $
  forall a_1, a_2, ..., a_n in RR_+\
  (a_1 + a_2 + ... + a_n) / n <= sqrt((a_1^2 + a_2^2 + ... + a_n^2)/n)
  $

  是Cauchy不等式的推论.令 $x = (a_1, a_2, ..., a_n), y = (1, 1, ..., 1)$, 则:

  $
  (a_1 + a_2 + ... + a_n) = x dot.c y <= abs(x) abs(y) = sqrt(a_1^2 + a_2^2 + ... + a_n^2) dot.c sqrt(n)
  $

  简单变换即可得到上述不等式.

  #line(length: 100%, stroke: 0.2pt)

  接下来说明$"HM"$和$"QM"$的不等式是由$"AM"$和$"GM"$的不等式推出的:

  $
  forall a_1, a_2, ..., a_n in RR_+ quad
  (a_1 a_2 ... a_n)^(1 / n) <= (a_1 + a_2 + ... + a_n) / n
  $

  在上述不等式中将 $a_i$ 替换为 $1/a_i$, 则:

  $
  forall a_1, a_2, ..., a_n in RR_+
  quad => quad
  (1 / a_1 1 / a_2 ... 1 / a_n)^(1 / n) &<= (1 / a_1 + 1 / a_2 + ... + 1 / a_n) / n \
  &arrow.b.double \
  (a_1 a_2 ... a_n)^(1 / n) &>= n / (1 / a_1 + 1 / a_2 + ... + 1 / a_n)
  $
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

