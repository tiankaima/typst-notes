#set heading(numbering: "1.")

= Fibonacci sequence
The Fibonacci sequence is defined through the
recurrence relation $F_n = F_(n-1) + F_(n-2)$.
It can also be expressed in _closed form:_

$
F_n = round(1 / sqrt(5) phi.alt^n), quad
phi.alt = (1 + sqrt(5)) / 2
$

#let count = 8
#let nums = range(1, count + 1)
#let fib(n) = (
  if n <= 2 {
    1
  } else {
    fib(n - 1) + fib(n - 2)
  }
)

The first #count numbers of the sequence are:

#align(
  center,
  table(
    columns: count,
    ..nums.map(n => $F_#n$),
    ..nums.map(n => str(fib(n))),
  ),
)

#pagebreak()

$
f(t x_1 + (1-t)x_2, t y_1 + (1-t)y_2) <= t f(x_1, y_1) + (1-t) f(x_2, y_2)
$

Taking the derivative of the above inequality with respect to $t$ gives

$
(d F) / (d t) = (x_1 - x_2) f'_x|_((t x_1 + (1-t)x_2, t y_1 + (1-t)y_2)) + (y_1 - y_2) f'_y|_((
  t x_1 + (1-t)x_2, t y_1 + (1-t)y_2
)) - f(x_1, y_1) + f(x_2, y_2)
$

Meanwhile:

$
F(0) = f(x_2, y_2) - f(x_2, y_2) = 0 \
F(1) = f(x_1, y_1) - f(x_1, y_1) = 0 \
F(t) <=0 quad (t in [0, 1])
$

So it's clear that $F'(1) >= 0$, which means:

$
(d F) / (d t)|_(t=1) = (x_1 - x_2) f'_x|_((x_1, y_1)) + (y_1 - y_2) f'_y|_((x_1, y_1)) - f(x_1, y_1) + f(x_2, y_2) >= 0
$
