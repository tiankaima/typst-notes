#set text(
  font: ("linux libertine", "Source Han Serif SC", "Source Han Serif"),
  size: 10pt,
)
#show math.equation: set text(11pt)
#show math.equation: it => [
  #math.display(it)
]

#let dcases(..args) = {
  math.cases(
    math.display(..args),
  )
}

#show image: it => [
  #set align(center)
  #it
]

#align(center)[
  = 习题课 7 讲义
  2024 Spring 数学分析 B2

  PB21000030 马天开
]

== 作业答案

#text(weight: "bold")[
  - 4.1 P125 7(3)(4)(5)
  - 4.3 P125 9 10(3)(4) 11(1)(3) 13 18 19 20 21
  - 4.8 P156 2(1)(2)(3)(6)(7)(8)
  - 4.10 P156 1(2)(3)(5)(6) 3 5 6 7
  - 4.12 P166 1(1)(4)(5) 2(2)(5)(8) 3(2)(3) 4 6 7
]

=== 7(3)
$
&space.quad f(x,y) = e^(2x) (x+2y+y^2) \
&dcases(
(diff f)/(diff x) &= e^(2x)(2x+4y+2y^2+1)\
(diff f)/(diff y) &= e^(2x)(2+2y) \
(diff^2 f)/(diff x^2) &= e^(2x)(4x+8y+4y^2+4) \
(diff^2 f)/(diff y^2) &= e^(2x) dot 2 \
(diff^2 f)/(diff x diff y) &= e^(2x)(4+4y) \
)\
&dcases(
(diff f)/(diff x) &= 0 \
(diff f)/(diff y) &= 0 \
)space.quad => space.quad
dcases(
  x = 1/2 \
  y = -1 \
)\
&dcases(
  A = 2e^1 \
  B = 0 \
  C = 2e^1 \
)
space.quad => space.quad
dcases(
  Delta = A C - B^2 = 4e^2 > 0 \
  A > 0
)
$

正定, 极小值 $f(1/2, -1) = -e/2$

#image("imgs/1.png", width: 50%)

#pagebreak()
=== 7(4)

$
(x^2+y^2)^2 = a^2(x^2-y^2) \
$
$
&=> [4x(x^2+y^2)-2a^2x]dif x +[4y(x^2+y^2)+2a^2y]dif y = 0 \
&=> (dif y) / (dif x) = -(4x(x^2+y^2)-2a^2x) / (4y(x^2+y^2)+2a^2y) \
$

$
(dif y) / (dif x) = 0 space.quad => space.quad x = 0 "or" x^2+y^2=1 / 2a^2 \
$

考虑 $x=0 => (x,y) = (0,0)$ 此处不可微, 舍去

$
dcases(
  x^2+y^2=1/2a^2\
  x^2-y^2=1/4a^2\
) space.quad => space.quad
y^2 = 1 / 8
$

接下来可以用更一般的做法判断是否是极大值/极小值, 我们这里推荐一种更加初等但是高效的做法:

考虑关于 $x^2$ 的二次方程:

$
x^4+(2y^2-a^2)x^2+(y^4+a^2y^2) = 0
$

其中 $Delta=(4y^4-4a^2y^2+a^4)-4(a^2y^2+y^4)=-8a^2y^2+a^4>=0$

因此 $y^2<=1/8a^2$, 两个$ y_1=-sqrt(2)/4a, space.quad y_2=sqrt(2)/4a $分别为极小值、极大值(考虑到在其附近光滑.)

#image("imgs/2.png", width: 50%)

这个例子上学期将隐函数、参数方程求导的时候提到过: 有些参数方程的形式能给出 $(dif y)/(dif x)$ 的值, 但我们认为隐函数在 $(0,0)$ 附近不存在.

#pagebreak()
=== 7(5)

$
&x^2+y^2+z^2-2x+2y-4z-10=0 \
=> & (2x-2)dif x +(2y+2)dif y+(2z-4)dif z=0 \
=> & (diff z) / (diff x) = -(x-1) / (z-2) space.quad (diff z) / (diff y) = -(y+1) / (z-2) \
=> & (diff^2 z) / (diff x^2) = -((x-1)^2+(z-2)^2) / (z-2)^3 space.quad (diff^2 z) / (diff y^2) = -((z-2)^2+(y+1)^2) / (
  z-2
)^3 space.quad (diff^2 z) / (diff x diff y) = 0 \
$

$
((diff z) / (diff x), (diff z) / (diff y)) = (0, 0) => (x, y) = (1, -1) \
$

此时对应 $z_1 = 6, z_2=-2$, 我们分别在两个点的局部判断这是极大值/极小值, 即 $(1,-1,6)$ 和 $(1,-1,-2)$

- $z_1 = 6$ 时 $Delta=A C-B^2>0, A<0$, 正定, 极大值
- $z_2 = -2$ 时 $Delta=A C-B^2>0, A>0$, 负定, 极小值

#image("imgs/3.png", width: 50%)

#pagebreak()
=== 9

#image("imgs/4.png", width: 50%)

#pagebreak()
=== 10(3)

$
u(x,y,z)&=sin(x)sin(y)sin(z)\
U(x,y,z,phi)&=sin(x)sin(y)sin(z)-phi dot.c(x+y+z-pi/2)\
&dcases(
(diff U)/(diff x) &= cos(x)sin(y)sin(z)-phi=0\
(diff U)/(diff y) &= sin(x)cos(y)sin(z)-phi=0\
(diff U)/(diff z) &= sin(x)sin(y)cos(z)-phi=0\
&x+y+z=pi/2\
)
$

可以解出

$
P_0=(pi / 6,pi / 6,pi / 6)\
P_1=(pi / 2,0,0)\
P_2=(0,pi / 2,0)\
P_3=(0,0,pi / 2)\
$

分别代入 $u$ 可以得到 $u(P_0)=1/8, u(P_1)=0, u(P_2)=0, u(P_3)=0$

极大值极小值的判断不能直接从拉格朗日乘子法中得到, 应该通过如下方法判断:

$
u(x,y)=u(x,y,z)=u(x,y,pi / 2-x-y)=sin(x)sin(y)cos(x+y)\
$

接下来继续处理 $Delta=(diff^2 u)/(diff x^2) dot.c (diff^2 u)/(diff y^2)-((diff^2 u)/(diff x diff y))^2$, 按照一般的二元函数的处理 (#strike[也许可以从头开始就按照这样的做法]), 最终可以获得结果.

#image("./imgs/6.png", width: 50%)

#box[
  更一般的, 我们可以做如下处理:

  $
  u&=sin(x)sin(y)sin(z)\
  dif u&=cos(x)sin(y)sin(z)dif x + sin(x)cos(y)sin(z)dif y + sin(x)sin(y)cos(z)dif z\
  $
]

#align(center)[
  #rect[
    $
    &x+y+z=pi / 2 space.quad=>space.quad dif x + dif y + dif z = 0\
    $
  ]
]

$
=> & dif u = (cos(x)sin(y)sin(z) - sin(x)sin(y)cos(z))dif x + (sin(x)cos(y)sin(z) - sin(x)sin(y)cos(z))dif y\
=> & (diff u) / (diff x)=(cos(x)sin(y)sin(z) - sin(x)sin(y)cos(z))=0\
=> & (diff u) / (diff y)=(sin(x)cos(y)sin(z) - sin(x)sin(y)cos(z))=0\
=> & (diff^2 u) / (diff x^2)= -2sin(x)sin(y)sin(z) - 2cos(x)sin(y)cos(z)=-1\
=> & (diff^2 u) / (diff y^2) = -2sin(x)sin(y)sin(z) - 2sin(x)cos(y)cos(z)=-1\
=> & (diff^2 u) / (diff x diff y) = cos(x)cos(y)sin(z) - sin(x)cos(y)cos(z) - cos(x)sin(y)cos(z) - sin(x)sin(y)sin(z)=-1 / 2\
$

所以有
$
Delta = A C - B^2 = 3 / 4 >0 space.quad A=-1<0
$
正定, 最大值 $ u(pi/6,pi/6,pi/6)=1/8 $

下图是 $u(x,y,z)=sin(x)sin(y)sin(z)$ 的热力图,通过颜色来反应无法画出的另一维度的信息.
#image("imgs/5.png", width: 50%)

#pagebreak()
=== 10(4)

$
&u=x y z space.quad x+y+z=0 space.quad x^2+y^2+z^2=1\
$

按照上文的处理思路,

$
&dif u = y z dif x + x z dif y + x y dif z\
$

#align(center)[
  #rect[
    $
    dif x + dif y + dif z = 0\
    x dif x + y dif y + z dif z = 0\
    $
  ]
]

在后两个方程中, 解出 $dif y, dif z$ 关于 $dif x$的表达式为:

$
dif y = (z-x) / (y-z) dif x quad dif z = (x-y) / (y-z) dif x
$

接下来可以类似处理得到 $(dif u)/(dif x) , (dif^2 u)/(dif x^2)$, 按照一元函数的极值点处理即可.

按照一般的 Lagrange 乘子法:

$
&U(x,y,z, lambda, mu) = x y z - lambda(x+y+z) - mu(x^2+y^2+z^2-1) \
&dcases(
(diff U)/(diff x) &= y z - lambda - 2mu x = 0 \
(diff U)/(diff y) &= x z - lambda - 2mu y = 0 \
(diff U)/(diff z) &= x y - lambda - 2mu z = 0 \
&x+y+z = 0 \
&x^2+y^2+z^2 = 1 \
)\
$

对上面式子的处理较为依赖对称性, 我们提供一种比较简便、标准的做法:

首先考虑 $(diff U)/(diff x),(diff U)/(diff y),(diff U)/(diff z)$ 中 $mu x,mu y,mu z$的对称性, 我们将这三项对应加起来:

$
&quad (diff U) / (diff x) + (diff U) / (diff y) + (diff U) / (diff z)\
&= x z + y z + x y - 3 lambda - 2 mu (x+y+z)\
&= x z + y z + x y - 3 lambda \
&= 0
$

前面一项是已知的, 得益于这样的关系:

$
(x+y+z)^2&=x^2+y^2+z^2+2(x y+y z+z x)\
&=1+2(x y+y z+z x)=0 \
=> & x y+y z+z x = -1 / 2
$

因此得到 $lambda = - 1/6$, 接下来只需要关心前两项 $(diff U)/(diff x), (diff U)/(diff y)$:

$
&dcases(
y z + 1/6 - 2 mu x = 0 \
x z + 1/6 - 2 mu y = 0 \
) => dcases(
  y^2 z + 1/6 y - 2 mu x y = 0 \
  x^2 z + 1/6 x - 2 mu y x = 0 \
)\
&=> [z(x+y) + 1 / 6](x-y) = 0 \
&=> [(x+y)^2 - 1 / 6](x-y) = 0 \
$

接下来我们分别讨论 $x=y$ 和 $(x+y)^2=1/6$. 其实他们反映的是一种情况的对称.

- $x=y$

$
x=y => z=-2x\
x^2 + y^2 + z^2 = 6 x^2 = 1 => x = plus.minus sqrt(6) / 6 \
P_1(sqrt(6) / 6,sqrt(6) / 6, -sqrt(6) / 3) quad P_2(-sqrt(6) / 6, -sqrt(6) / 6, sqrt(6) / 3)
$

- $(x+y)^2=1 / 6$

$
(x+y)^2=1 / 6 => z^2 = 1 / 6 \
=> x^2 + y^2 = 5 / 6 \
(x-y)^2 = 9 / 6 \
$

$
dcases(
  (x-y) = plus.minus 3/6sqrt(6) \
  (x+y) = plus.minus 1/6sqrt(6) \
)\
$

$
&P_3(sqrt(6) / 3, -sqrt(6) / 6, -sqrt(6) / 6) quad &P_4(-sqrt(6) / 3, sqrt(6) / 6, sqrt(6) / 6) \
&P_5(sqrt(6) / 6, -sqrt(6) / 3, sqrt(6) / 6) quad &P_6(-sqrt(6) / 6, sqrt(6) / 3, -sqrt(6) / 6) \
$

因此 $ u_max = sqrt(6)/18 quad u_min = -sqrt(6)/18 $

考虑到讨论的取值范围是光滑的闭曲线, 光滑函数在此上的最大(小)值点也显然是局部的极大(小)值点.

#pagebreak()
=== 11(1)

在做这道题之前也许就应该想到 $z=x^2-y^2$ 的曲面图像:

#image("imgs/7.png", width: 50%)

即便没有这样的几何直观, 处理起来也是固定的模式, 先讨论内部的极值点、再讨论边界上的条件极值.

$
(diff z) / (diff x) = 2x quad (diff z) / (diff y) = -2y \
(diff^2 z) / (diff x^2) = 2 quad (diff^2 z) / (diff y^2) = -2 quad (diff^2 z) / (diff x diff y) = 0
$

Hessian 矩阵总是负定的, 函数在${(x,y)mid("|") x^2+y^2 <4}$内部不存在极值点. (事实上也说明在任何区域内部都不存在极值点)

#rect(fill: red.lighten(70%), width: 100%, inset: 1em)[
  实际上我们有更一般的结论:

  - *弱极值原理*: 考虑调和函数 $u$($Delta u=0$), 在区域 $overline(Omega)$ 上连续, 则函数的最值总能在边界上取得:

  $
  max_(overline(Omega)) u = max_(partial Omega) u
  $

  - *极值原理*: 非常数调和函数的最值总在边界上取得.

  $
  max_(Omega) u = max_(partial Omega) u \
  max_(Omega^o) u < max_(partial Omega) u
  $
]

回到本题, 我们继续讨论边界上的极值点, 问题转化为一个一般的拉格朗日乘子法问题:

$
L(x,y, mu) = x^2-y^2 + mu(x^2+y^2-4) \
dcases(
  (diff L)/(diff x) = 2x(1+mu) = 0 \
  (diff L)/(diff y) = -2y(1-mu) = 0 \
  x^2+y^2 = 4 \
)\
P_1(0,2) quad P_2(0,-2) quad P_3(2,0) quad P_4(-2,0)
$

容易得到 $z_min = -4, z_max = 4$

#pagebreak()
=== 11(3)

$
&z=sin(x)+sin(y)-sin(x+y) quad D={(x,y)mid("|")x>=0,y>=0,x+y<=2pi} \
$

区域内的情况：

$
&dcases(
(diff z)/(diff x) &= cos(x)-cos(x+y) = 0 \
(diff z)/(diff y) &= cos(y)-cos(x+y) = 0 \
) \

&P_1(0,0) quad P_2(2pi,0) quad P_3(0,2pi) quad P_4(pi/3, pi/3)
$

$ => z_min = 0, z_max=sqrt(3)/2 quad forall x in D^o $

边界上的情况，我们分成三段：

$
&l_1: {0}times[0,2pi] \
&l_2: [0,2pi]times{0} \
&l_3: {(x,y)mid("|")x+y=2pi,x>=0,y>=0} \
$

其中 $l_1, l_2$ 是对称的，我们只考虑 $l_1$:

$
&z = sin(0) + sin(y) - sin(0+y) eq.triple 0 quad &(x,y) in l_1 \
&z = sin(x) + sin(2pi-x) - sin(2pi) eq.triple 0 quad &(x,y) in l_3 \
$

// TODO: 补充 z = sin(x) + sin(2pi-x) - sin(2pi) 的图像


#pagebreak()
=== 13
$
dcases(
  z=x^2+2y^2\
  z=6-2x^2-y^2\
) quad => quad  x^2 + y^2 = 2
$

问题转为考虑 $z=x^2+2y^2$ 在 $x^2+y^2=2$ 上的最值问题, 应用拉格朗日乘子法:

$
L(x,y, mu) = x^2+2y^2 + mu(x^2+y^2-2) \
dcases(
  (diff L)/(diff x) = 2x(1+mu) = 0 \
  (diff L)/(diff y) = 4y(1+mu) = 0 \
  x^2+y^2 = 2 \
)\
P_1(0,sqrt(2)) quad P_2(0,-sqrt(2)) quad P_3(sqrt(2),0) quad P_4(-sqrt(2),0)
$

因此 $z_min = 2, z_max = 4$

//TODO: 补图

#pagebreak()
=== 14

$
f(x,y)=3x^2y-x^4-2y^2\
dcases(
  (diff f)/(diff x)|_((0,0)) = 6x y-4x^3 = 0 \
  (diff f)/(diff y)|_((0,0)) = 3x^2-4y = 0 \
  (diff^2 f)/(diff x^2)|_((0,0)) = 6y-12x^2 = 0 \
  (diff^2 f)/(diff y^2)|_((0,0)) = -4 \
  (diff^2 f)/(diff x diff y)|_((0,0)) = 6x = 0 \
)\
$

$Delta = A C-B^2=0$ 欠定, 我们继续往下算:

$
dcases(
(diff^3 f)/(diff x^3)|_((0,0)) = -24x = 0 \
(diff^3 f)/(diff x^2 diff y)|_((0,0)) = 6 \
(diff^3 f)/(diff x diff y^2)|_((0,0)) = 0 \
(diff^3 f)/(diff y^3)|_((0,0)) = 0 = 0 \
)
$

因此 $f(x,y)$的三阶 Taylor 展开为:

$
f(x,y) = -4y^2+18x^2y + o(rho^3)
$

显然 $f(0,0)=0$ 不是极值点.

我们考虑任意过 $(0,0)$ 的直线 $y=k x$, 有:
$
f(x) = 3k x^3 - x^4 - 2k^2 x^2\
dcases(
(dif f)/(dif x)|_((0,0)) = 9k x^2 - 4x^3 - 4k^2 x = 0\
(dif^2 f)/(dif x^2)|_((0,0)) = 18k x - 12x^2 - 4k^2 = - 4k^2<0\
)
$
因此在每条过原点的直线上 $(0,0)$ 都是极大值点.

#pagebreak()
=== 18

$
f(x,y) = (x - x_1)^2 + (y - y_1)^2 + dots.c + (x - x_n)^2 + (y - y_n)^2\
dcases(
  (diff f)/(diff x) = 2(x - x_1) + dots.c + 2(x - x_n) = 0\
  (diff f)/(diff y) = 2(y - y_1) + dots.c + 2(y - y_n) = 0\
  (diff^2 f)/(diff x^2) = 2n\
  (diff^2 f)/(diff y^2) = 2n\
  (diff^2 f)/(diff x diff y) = 0\
)\
$

因此解出
$
=> x = (x_1 + dots.c + x_n) / n quad y = (y_1 + dots.c + y_n) / n\
$

$
Delta = A C - B^2 = 2n^2 - 0 = 2n^2 > 0 quad A = 2n > 0
$
因此是极小值点.


#pagebreak()
=== 19

$
f(x,y, mu) = x y z - mu(x^2/a^2 + y^2/b^2 + z^2/c^2 - 1)\
dcases(
  (diff f)/(diff x) = y z - 2 mu x / a^2 = 0\
  (diff f)/(diff y) = x z - 2 mu y / b^2 = 0\
  (diff f)/(diff z) = x y - 2 mu z / c^2 = 0\
  x^2/a^2 + y^2/b^2 + z^2/c^2 = 1\
)\
(x,y,z) = cal(k) (a,b,c) quad=>quad cal(k)=sqrt(3)/3
$

此时 $V = 8x y z = 8/9 sqrt(3)$, 为最大值.

// #pagebreak()
=== 20
$
f(x,y,z,mu)=(x+y+2z-9)/(sqrt(1^2+1^2+2^2)) - mu(x^2/4+y^2+z^2-1)\
dcases(
  (diff f)/(diff x) = 1/(sqrt(6)) - mu x / 2 = 0\
  (diff f)/(diff y) = 1/(sqrt(6)) - 2mu y = 0\
  (diff f)/(diff z) = 2/(sqrt(6)) - 2mu z = 0\
  x^2/4 + y^2 + z^2 = 1\
)\

P_1(4/3,1/3,2/3) quad P_2(-4/3,-1/3,-2/3)
$

// #pagebreak()
=== 21
$
F(x,y,z)=sqrt(x)-sqrt(y)-sqrt(z)-sqrt(a) eq.triple 0\
dif F = 1/(2sqrt(x))dif x - 1/(2sqrt(y))dif y - 1/(2sqrt(z))dif z = 0\
1/(2sqrt(x_0))(x-x_0) - 1/(2sqrt(y_0))(y-y_0) - 1/(2sqrt(z_0))(z-z_0) = 0\
x/(2sqrt(x_0)) - y/(2 sqrt(y_0)) - z/(2 sqrt(z_0)) = sqrt(x_0)/2 - sqrt(y_0)/2 - sqrt(z_0)/2\
$

所有截距之和:

$
l_1+l_2+l_3=(sqrt(x_0)-sqrt(y_0)-sqrt(z_0))^2 = a
$

四面体体积:

$
1/6 l_1 dot l_2 dot l_3 = 1/6 sqrt(a) dot sqrt(x_0) dot sqrt(y_0) dot sqrt(z_0)
$

$
f(x_0, y_0, z_0, mu) = sqrt(a) dot sqrt(x_0) dot sqrt(y_0) dot sqrt(z_0) - mu(sqrt(x_0) - sqrt(y_0) - sqrt(z_0) - sqrt(a)) \
f(l,m,n,mu) = l m n - mu(l - m - n - a)\
dcases(
  (diff f)/(diff l) = m n - mu = 0\
  (diff f)/(diff m) = l n - mu = 0\
  (diff f)/(diff n) = l m - mu = 0\
  l m n = a\
)\
=> quad l = m = n = sqrt(a)
$

所以最大四面体面积为 $a^2/6$, 截面: $x-y-z+a=0$

#pagebreak()
=== P156 1

- (2)
$
integral_0^2 dif x integral_(2x)^(6-x)f(x,y)dif y = integral_0^4 dif y integral_0^(y/2) f(x,y)dif x + integral_4^6 dif y integral_0^(6-y) f(x,y)dif x\
$
- (3)
$
integral_0^a dif y integral_(a-sqrt(a^2-y^2))^(a+sqrt(a^2-y^2))f(x,y)dif x = integral_0^(2a) dif x integral_(0)^(sqrt(a^2-(x-a)^2))f(x,y)dif y\
$
- (5)
$
integral_0^1 dif x integral_0^x f(x,y) dif y+integral_1^2 dif x+integral_0^(2-x) f(x,y) dif y = integral_0^2 dif y integral_0^(2-y) f(x,y) dif x\
$
- (6)
$
integral_0^1dif y integral_(1/2)^1f(x,y)dif x+integral_1^2dif y integral_(1/2)^(1/y)f(x,y)dif x = integral_(1/2)^1dif x integral_(0)^(1/x)f(x,y)dif y\
$

=== 2

- (1)
$
&integral.double_D y/(1+x^2+y^2)^(3/2) dif x dif y quad D=[0,1]times[0,1]\
&=integral_0^1 dif x integral_0^1 y/(1+x^2+y^2)^(3/2) dif y\
$