= 2023-2024 数学分析（B1）期中

1. 用极限的定义证明： 若$limits(lim)_(n->infinity) a_n = limits(lim)_(n->infinity) b_n = c$, 则$limits(lim)_(n->infinity) max {a_n,b_n} = c$.
2. 计算下列各题

  1. $limits(lim)_(n->infinity) ((n+1)/(n-1))^n$

  2. $limits(lim)_(n->infinity) ((n+1)^k-n^k), 0<k<1$

  3. $limits(lim)_(n->infinity) (root(4,1+x+x^2)-1)/(tan 2x)$

  4. $limits(lim)_(n->infinity) (cos x - e^(-1/2 x^2))/(sin^4 x)$

  5. $limits(lim)_(x->a)((sin x)/(sin a))^(1/(x-a))$ ($a!=k pi, k in ZZ$)

  6. 求$f(x)=ln(cos x)$带 Peano 余项的 4 阶 Maclaurin 公式.

3. 计算下列各题

  1. 求由参数方程 $cases(x=t cos t, y=t sin t) space.quad (0<=t<=pi)$ 确定的曲线 $y = y(x)$在$(0,pi/2)$处的切线方程.

  2. 函数 $f(x) = cases(x^2+x+1 space.quad x>=0, a sin x + b space.quad x<0)$. 请问：当$a,b$分别满足什么条件时, $f(x)$在$(-infinity,+infinity)$上连续和可导？并在可导时, 求$f(x)$在$x=0$处的微分.

4. 设 $f(x) = sin 2x - x, space.quad x in [-pi/2,pi/2]$

  1. 求$f(x)$的最值.

  2. 求曲线$y=f(x)$的拐点.

5. 设$f(x)$在$[a,b]$上连续, $(a,b)$上可微, 且

$
f(a)dot.c f(b) > 0, space.quad f(a) dot.c f((a+b)/2) < 0
$
求证：$exists xi in (a,b)$, 使得$f'(xi)=f(xi)$.

6. 设$f(x)$在有界闭区间$[a,b]$上有定义且满足以下两个条件：
- $f(x) in [a,b], forall x in [a,b]$
- $abs(f(x) - f(y)) <= k abs(x-y) space.quad forall x,y in [a,b]$, 其中$0<k<1$为常数
称满足$f(c) = c$的实数$c$为$f(x)$的不动点.

证明：

- $f(x)$ 在 $[a,b]$上有唯一的不动点$x^*$.
- 对$forall x_1 in [a,b]$, 归纳定义数列$x_(n+1) = f(x_n) space.quad (n=1,2,...)$, 则${x_n}$收敛于$f(x)$的不动点$x^*$.

7. 设函数$f(x)$在$[0,1]$上二阶可导, 且$f(0) = f(1)$, $abs(f^('') (x))<=2 space.quad (forall x in [0,1])$. 求证：$abs(f^' (x))<=1$.