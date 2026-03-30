#import "../utils.typ": *

= Lecture 4

```plain
Time: Week 2, 9.18 Mon
```

#statement[
  $
  a > 1 quad => quad
  a^n > (n^2) / 4 (a-1)^2
  $
]

#proof[
  $
  a^n = ((a-1)+1)^n = sum_(i=0)^(n) binom(n, i) (a-1)^i = 1 + n(a-1) +n(n-1) / 2 (a-1)^2 > n(n-1) / 2 (a-1)^2
  $

  对充分大的$n$, 容易说明:
  $
  n-1>n / 2 quad => quad n(n-1) / 2 > n^2 / 4 \
  => a^n > n^2 / 4 (a-1)^2
  $
]

$
a_n = n^k / a^n = (n / (a^(1 / k))^n)^k
$

$
a_n / a_1 = product_(i=1)^(n-1) a_(i+1) / a_i <= product_(i=1)^(n-1) b_(i+1) / b_i = b_n / b_1
$

$
n! <1 / 2 n^(n / 2)
$

#v(4cm)

$
a_n = sum_(i=0)^n 1 / i \
forall epsilon>0, "take" N=1 / epsilon, => forall n>N, abs(a_(n+1) - a_n)<epsilon \
a_n -> infinity \
$
#pagebreak()