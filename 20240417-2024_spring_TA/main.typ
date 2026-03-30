#set text(
  font: ("linux libertine", "Source Han Serif SC", "Source Han Serif"),
  size: 10pt,
)
#show math.equation: set text(11pt)
#show math.equation: it => [
  #math.display(it)
]

#let dcases(..args) = {
  let dargs = args.pos().map(it => math.display(it))
  math.cases(..dargs)
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

== 小测答案

=== 1

计算 $I = integral.double_D x(1+y e^(x^4 y^6)) dif x dif y$, 其中 $D: y=sin x,x=-pi/2, y=1$

$
I&=integral_(-pi / 2)^(pi / 2) dif x integral_(sin x)^1 x (1+y e^(x^4 y^6)) dif y\
&=integral_(-1)^1 dif y integral_(-pi / 2)^(arcsin y) x(1+y dot e^(x^4 y^6)) dif x\
$

显然这两个方向上都无法得到初等函数解, 做如下处理

先对 $f_1(x,y) = x$ 在 $D$ 上积分:
$
I_1&=integral_(-pi / 2)^(pi / 2) dif x integral_(sin x)^1 x dif y\
&=integral_(-pi / 2)^(pi / 2) x (1-sin(x)) dif x\
&=integral_(-pi / 2)^(pi / 2) x dif x - integral_(-pi / 2)^(pi / 2) x sin(x) dif x\
&=0 - 2 integral_(-pi / 2)^(pi / 2) x sin(x) dif x\
&=-2
$

对于 $f_2(x,y)=x y dot e^(x^4 y^6)$ 有比较强的对称性, 但是处理起来容易出错, 我们这里处理如下:

$
I_2 &= integral_(-pi / 2)^(pi / 2) dif x integral_(sin(x))^1 f_2(x,y) dif y\
&= integral_(pi / 2)^(-pi / 2) dif (-x) integral_(sin(-x))^1 f_2(-x,y) dif y\
&= integral_(-pi / 2)^(pi / 2) dif x integral_1^(sin(x)) f_2(x,y) dif y\
&= 1 / 2 integral_(-pi / 2)^(pi / 2) dif x integral_(sin(x))^(-sin(x)) f_2(x,y) dif y\
&= 1 / 2 integral_(-pi / 2)^(pi / 2) dif x integral_(-sin(x))^(sin(x)) f_2(x,-y) dif (-y)\
&= 1 / 2 integral_(-pi / 2)^(pi / 2) dif x integral_(sin(x))^(-sin(x)) - f_2(x,y) dif (y)\
&= 0 \
$

=== 2

$
F(t) = integral_1^t dif y integral_y^t e^(-x^2) dif x
$

计算 $(dif F)/(dif t)$

在 B1 中我们讲过含参变上限求导的方法, 例如:

$
F(x,t) = integral_(x_0)^t f(x,t) dif x\
(dif F) / (dif t) = f(t,t) + integral_(x_0)^t (diff f) / (diff t) dif x
$

对于本题, 只需要应用两遍:

$
(dif F) / (dif t) &= dif / (dif t) integral_1^t dif y integral_y^t e^(-x^2) dif x\
&= [integral_y^t e^(-x^2) dif x]_(y=t) + integral_1^t (diff / (diff t) integral_y^t e^(-x^2) dif x) dif y\
&= 0 + integral_1^t e^(-t^2) dif y\
&= e^(-t^2) (t-1)
$

=== 3

求 $ (x^2+y^2)^2 + z^4 = y $ 内部的体积

考虑球坐标变换:

$
dcases(
  x = r sin theta cos phi,
  y = r sin theta sin phi,
  z = r cos theta,
) quad => quad dif x dif y dif z = r^2 sin theta dif r dif theta dif phi
$

$
&r^4 sin^4 theta (cos^2 phi + sin^phi)^2 + r^4 cos^4 theta = r sin theta sin phi\
=>&r^3 = (sin theta sin phi)/(sin^4 theta + cos^4 theta) > 0
$

注意到 $0<theta<pi => sin(theta) > 0$, 只需要 $sin phi > 0 => phi in (0,pi)$

所以转变为求下面的三重积分:

$
integral.triple_V dif x dif y dif z &= integral.triple_(V^') r^2 sin theta dif r dif theta dif phi\
&= integral_0^pi dif phi integral_0^pi dif theta integral_0^R r^2 sin theta dif r\
&= integral_0^pi dif phi integral_0^pi R^3 / 3 dif theta\
&= 1/3 integral_0^pi dif phi integral_0^pi (sin^2 theta sin phi)/(sin^4 theta + cos^4 theta) dif theta\
&= 1/3 (integral_0^pi sin phi dif phi)(integral_0^pi (sin^2 theta)/(sin^4 theta + cos^4 theta) dif theta)\
$

前面 $integral_0^pi sin phi dif phi = 2$ 容易得到, 后面的处理也不算容易, 我们展开讨论:

$
integral_0^pi &= integral_0^(pi/2) + integral_(pi/2)^pi\
&= integral_0^(pi/2) (sin^2 theta)/(sin^4 theta + cos^4 theta) dif theta + integral_(pi/2)^pi (sin^2 theta)/(sin^4 theta + cos^4 theta) dif theta\
&= integral_0^(pi/2) (sin^2 theta)/(sin^4 theta + cos^4 theta) dif theta + integral_0^(pi/2) (cos^2 theta)/(cos^4 theta + sin^4 theta) dif theta\
&= integral_0^(pi/2) 1/(sin^4 theta + cos^4 theta) dif theta
$

接下来是三角换元, 所有都是平方项, 考虑 $tan$ 相关的方向:

$
& quad integral 1/(sin^4 theta + cos^4 theta) dif theta\
&=integral (sec^4 theta)/(tan^4 theta + 1) dif theta\
&=integral (sec^2 theta (tan^2 theta + 1))/(tan^4 theta + 1) dif theta\
&= integral (t^2 + 1)/(t^4 + 1) dif t\
&= integral (1/t^2 + 1)/(1/t^2 + t^2) dif t\
&= integral (dif (t - 1/t))/((t - 1/t)^2 + 2)\
&= 1/sqrt(2) arctan((t-1/t)/sqrt(2))\
$

当 $theta = 0 -> pi/2$ 时, $t= 0->oo$, $t-1/t = -oo -> oo$, 反常积分存在, 代入即可: $I = 2/3 dot pi/sqrt(2) = sqrt(2)/3 pi$

=== 4

$
D = {x^2 + y^2 <=a }\
f: D->RR^+, quad f in C^1(D), quad f|_(diff D) = 0\
$

证明:

$
abs(integral.double_D f(x,y) dif x dif y) <= 1/3 pi a^3 max_((x,y) in D) sqrt(((diff f)/(diff x))^2 + ((diff f)/(diff y))^2 )
$

我们把问题转化为极坐标系下面的问题:

$
& (diff f)/(diff r) = (diff f)/(diff x) (diff x)/(diff r) + (diff f)/(diff y) (diff y)/(diff r) = cos theta (diff f)/(diff x) + sin theta (diff f)/(diff y)\
=> & abs((diff f)/(diff r)) <= sqrt(((diff f)/(diff x))^2 + ((diff f)/(diff y))^2)\
& quad quad space.thin <= max_((x,y) in D) sqrt(((diff f)/(diff x))^2 + ((diff f)/(diff y))^2) = M\
$

对于每个 $f(r,theta)$, 考虑到边界上函数值已知, 我们可以通过单变量的中值定理给出它的一个估计:

$
&k_theta (r) = f(r, theta) \
&k_theta (a) - k_theta (r) = (dif k_theta)/(dif r)|_(r = xi) (a-r) quad xi in (a,r) \
=>&k_theta(r) = - (dif k_theta)/(dif r)|_(r = xi) (a-r)\
& quad quad space.thin <= M (a-r)\
$

因此

$
abs(integral.double_D f(x,y) dif x dif y) &<= integral.double_D abs(f(x,y)) dif x dif y\
&<= M integral.double_D (a-r) dot r dif r dif theta\
&= M integral_0^(2pi) dif theta integral_0^a (a-r) r dif r\
&= M dot 2pi dot (1/2 a^3 - 1/3 a^3)\
& = 1/3 pi a^3 quad qed
$

#pagebreak()

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
(diff f)/(diff x) &= e^(2x)(2x+4y+2y^2+1),
(diff f)/(diff y) &= e^(2x)(2+2y),
(diff^2 f)/(diff x^2) &= e^(2x)(4x+8y+4y^2+4),
(diff^2 f)/(diff y^2) &= e^(2x) dot 2,
(diff^2 f)/(diff x diff y) &= e^(2x)(4+4y),
)\
&dcases(
(diff f)/(diff x) &= 0 ,
(diff f)/(diff y) &= 0 ,
)space.quad => space.quad
dcases(
  x = 1/2 ,
  y = -1 ,
)\
&dcases(
  A = 2e^1 ,
  B = 0 ,
  C = 2e^1 ,
)
space.quad => space.quad
dcases(
  Delta = A C - B^2 = 4e^2 > 0,
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
  x^2+y^2=1/2a^2 ,
  x^2-y^2=1/4a^2 ,
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
u(x,y,z)&=sin x sin y sin z\
U(x,y,z,phi)&=sin x sin y sin z -phi dot.c(x+y+z-pi/2)\
&dcases(
(diff U)/(diff x) &= cos x sin y sin z -phi=0 ,
(diff U)/(diff y) &= sin x cos y sin z -phi=0 ,
(diff U)/(diff z) &= sin x sin y cos z -phi=0 ,
&x+y+z=pi/2 ,
)
$

可以解出

$
P_0=(pi / 6,pi / 6,pi / 6) quad
P_1=(pi / 2,0,0)\
P_2=(0,pi / 2,0) quad
P_3=(0,0,pi / 2)\
$

分别代入 $u$ 可以得到 $u(P_0)=1/8, u(P_1)=0, u(P_2)=0, u(P_3)=0$

极大值极小值的判断不能直接从拉格朗日乘子法中得到, 应该通过如下方法判断:

- *降为二元函数*

$
u(x,y)=u(x,y,z)=u(x,y,pi / 2-x-y)=sin x sin y cos(x+y)\
$

接下来继续处理 $Delta=(diff^2 u)/(diff x^2) dot.c (diff^2 u)/(diff y^2)-((diff^2 u)/(diff x diff y))^2$, 按照一般的二元函数的处理 (#strike[也许可以从头开始就按照这样的做法]), 最终可以获得结果.

#image("./imgs/6.png", width: 50%)

#box[
  可以做如下处理:

  $
  u&=sin x sin y sin z \
  dif u&=cos x sin y sin z dif x + sin x cos y sin z dif y + sin x sin y cos z dif z\
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
=> & dif u = (cos x sin y sin z - sin x sin y cos z)dif x + (sin x cos y sin z - sin x sin y cos z)dif y\
=> & (diff u) / (diff x)=cos x sin y sin z - sin x sin y cos z=0\
=> & (diff u) / (diff y)=sin x cos y sin z - sin x sin y cos z=0\
=> & (diff^2 u) / (diff x^2)= -2sin x sin y sin z - 2cos x sin y cos z =-1\
=> & (diff^2 u) / (diff y^2) = -2sin x sin y sin z - 2sin x cos y cos z =-1\
=> & (diff^2 u) / (diff x diff y) = cos x cos y sin z - sin x cos y cos z - cos x sin y cos z - sin x sin y sin z =-1 / 2\
$

所以有
$
Delta = A C - B^2 = 3 / 4 >0 space.quad A=-1<0
$
正定, 最大值 $ u(pi/6,pi/6,pi/6)=1/8 $

下图是 $u(x,y,z)=sin x sin y sin z $ 的热力图,通过颜色来反应无法画出的另一维度的信息.
#image("imgs/5.png", width: 50%)

- *紧集最值定理*:
  - 考虑 $f: D -> RR, D subset RR^d$ $D$ 在 $RR^d$ 上 compact, $f$ 在 $D$ 上连续, 则 $f$ 在 $D$ 上有最大值和最小值.
  - 讨论在 $diff D$ 上 $f$ 的取值, 在这个问题中 $f|_(diff D) eq.triple 0$
  - 在 $D^o$ 中, 最值必定在驻点中取得 $=> f(D^o)= [0,1\/8]$
  - 那么 $f(D) = [0, 1\/8] quad forall x in D$, 在 $P_0$ 的一个局部$U(P_0) subset D$ 内, $forall x in P_0, f(x) <= 1\/8 = f(P_0)$, 因此是极大值

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

#rect(width: 100%, inset: 1em)[
  这样的思路主要源自这样的几何直观: 一个过原点的平面截一个单位球总会得到一个闭曲线:

  #image("imgs/9.png", width: 50%)
]

#pagebreak()

按照一般的 Lagrange 乘子法:

$
&U(x,y,z, lambda, mu) = x y z - lambda(x+y+z) - mu(x^2+y^2+z^2-1) \
&dcases(
(diff U)/(diff x) &= y z - lambda - 2mu x = 0 ,
(diff U)/(diff y) &= x z - lambda - 2mu y = 0 ,
(diff U)/(diff z) &= x y - lambda - 2mu z = 0 ,
&x+y+z = 0 ,
&x^2+y^2+z^2 = 1 ,
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
y z + 1/6 - 2 mu x = 0 ,
x z + 1/6 - 2 mu y = 0 ,
) => dcases(
  y^2 z + 1/6 y - 2 mu x y = 0 ,
  x^2 z + 1/6 x - 2 mu y x = 0 ,
)\
&=> [z(x+y) + 1 / 6](x-y) = 0 ,
&=> [(x+y)^2 - 1 / 6](x-y) = 0 ,
$

接下来我们分别讨论 $x=y$ 和 $(x+y)^2=1/6$. 其实他们反映的是一种情况的对称.

#box(width: 100%)[
  - $x=y$

  $
  x=y => z=-2x\
  x^2 + y^2 + z^2 = 6 x^2 = 1 => x = plus.minus sqrt(6) / 6 \
  P_1(sqrt(6) / 6,sqrt(6) / 6, -sqrt(6) / 3) quad P_2(-sqrt(6) / 6, -sqrt(6) / 6, sqrt(6) / 3)
  $
]

#box(width: 100%)[
  - $(x+y)^2=1 / 6$

  $
  (x+y)^2=1 / 6 => z^2 = 1 / 6 \
  => x^2 + y^2 = 5 / 6 \
  (x-y)^2 = 9 / 6 \
  $

  $
  dcases(
  (x-y) = plus.minus 3/6sqrt(6) ,
  (x+y) = plus.minus 1/6sqrt(6) ,
)\
  $

  $
  &P_3(sqrt(6) / 3, -sqrt(6) / 6, -sqrt(6) / 6) quad &P_4(-sqrt(6) / 3, sqrt(6) / 6, sqrt(6) / 6) \
  &P_5(sqrt(6) / 6, -sqrt(6) / 3, sqrt(6) / 6) quad &P_6(-sqrt(6) / 6, sqrt(6) / 3, -sqrt(6) / 6) \
  $
]

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
  (diff L)/(diff x) = 2x(1+mu) = 0 ,
  (diff L)/(diff y) = -2y(1-mu) = 0 ,
  x^2+y^2 = 4 \
)\
P_1(0,2) quad P_2(0,-2) quad P_3(2,0) quad P_4(-2,0)
$

容易得到 $z_min = -4, z_max = 4$

#pagebreak()
=== 11(3)

$
&z=sin x +sin y -sin(x+y) quad D={(x,y)mid("|")x>=0,y>=0,x+y<=2pi} \
$

区域内的情况：

$
&dcases(
(diff z)/(diff x) &= cos x -cos(x+y) = 0 ,
(diff z)/(diff y) &= cos y -cos(x+y) = 0 ,
) \
&P_1(0,0) quad P_2(2pi,0) quad P_3(0,2pi) quad P_4(2 / 3 pi, 2 / 3 pi)
$

$ => z_min = 0, z_max=3 / 2 sqrt(3) quad forall x in D^o $

边界上的情况，我们分成三段：

$
&l_1: {0}times[0,2pi] \
&l_2: [0,2pi]times{0} \
&l_3: {(x,y)mid("|")x+y=2pi,x>=0,y>=0} \
$

其中 $l_1, l_2$ 是对称的，我们只考虑 $l_1$:

$
&z = sin 0 + sin y - sin(0+y) eq.triple 0 quad &(x,y) in l_1 \
&z = sin x + sin(2pi-x) - sin(2pi) eq.triple 0 quad &(x,y) in l_3 \
$

#image("imgs/11.png", width: 50%)

#pagebreak()
=== 13
$
dcases(
  z=x^2+2y^2 ,
  z=6-2x^2-y^2 ,
) quad => quad x^2 + y^2 = 2
$

#image("imgs/10.png", width: 50%)

问题转为考虑 $z=x^2+2y^2$ 在 $x^2+y^2=2$ 上的最值问题, 应用拉格朗日乘子法:

$
L(x,y, mu) = x^2+2y^2 + mu(x^2+y^2-2) \
dcases(
  (diff L)/(diff x) = 2x(1+mu) = 0 ,
  (diff L)/(diff y) = 4y(1+mu) = 0 ,
  x^2+y^2 = 2 ,
)\
P_1(0,sqrt(2)) quad P_2(0,-sqrt(2)) quad P_3(sqrt(2),0) quad P_4(-sqrt(2),0)
$

因此 $z_min = 2, z_max = 4$

#pagebreak()
=== 14

#rect(width: 100%, inset: 1em)[
  #columns(2)[
    $
    f(x,y)=3x^2y-x^4-2y^2\
    dcases(
  (diff f)/(diff x)|_((0,0)) = 6x y-4x^3 = 0 ,
  (diff f)/(diff y)|_((0,0)) = 3x^2-4y = 0 ,
  (diff^2 f)/(diff x^2)|_((0,0)) = 6y-12x^2 = 0 ,
  (diff^2 f)/(diff y^2)|_((0,0)) = -4 ,
  (diff^2 f)/(diff x diff y)|_((0,0)) = 6x = 0 ,
)\
    $

    #colbreak()

    $Delta = A C-B^2=0$ 欠定, 我们继续往下算:

    $
    dcases(
(diff^3 f)/(diff x^3)|_((0,0)) = -24x = 0 ,
(diff^3 f)/(diff x^2 diff y)|_((0,0)) = 6 ,
(diff^3 f)/(diff x diff y^2)|_((0,0)) = 0 ,
(diff^3 f)/(diff y^3)|_((0,0)) = 0 = 0 ,
)
    $
  ]
]

因此 $f(x,y)$的三阶 Taylor 展开为:

$
f(x,y) = -2y^2+3x^2y + o(rho^3)
$

#align(center)[
  #image("imgs/12.png", width: 70%)

  (蓝色是级数逼近)
]

显然 $f(0,0)=0$ 不是极值点.

我们考虑任意过 $(0,0)$ 的直线 $y=k x$, 有:
$
f(x) = 3k x^3 - x^4 - 2k^2 x^2\
dcases(
(dif f)/(dif x)|_((0,0)) = 9k x^2 - 4x^3 - 4k^2 x = 0 ,
(dif^2 f)/(dif x^2)|_((0,0)) = 18k x - 12x^2 - 4k^2 = - 4k^2<0 ,
)
$
因此在每条过原点的直线上 $(0,0)$ 都是极大值点.

#pagebreak()
=== 18

$
f(x,y) = (x - x_1)^2 + (y - y_1)^2 + dots.c + (x - x_n)^2 + (y - y_n)^2\
dcases(
  (diff f)/(diff x) = 2(x - x_1) + dots.c + 2(x - x_n) = 0 ,
  (diff f)/(diff y) = 2(y - y_1) + dots.c + 2(y - y_n) = 0 ,
  (diff^2 f)/(diff x^2) = 2n ,
  (diff^2 f)/(diff y^2) = 2n ,
  (diff^2 f)/(diff x diff y) = 0 ,
)\
$

因此解出
$
=> x = (x_1 + dots.c + x_n) / n quad y = (y_1 + dots.c + y_n) / n\
$

$
Delta = A C - B^2 = 4n^2 - 0 = 4n^2 > 0 quad A = 2n > 0
$
因此是极小值点.

#pagebreak()
=== 19

$
f(x,y, mu) = x y z - mu(x^2/a^2 + y^2/b^2 + z^2/c^2 - 1)\
dcases(
  (diff f)/(diff x) = y z - 2 mu x / a^2 = 0,
  (diff f)/(diff y) = x z - 2 mu y / b^2 = 0,
  (diff f)/(diff z) = x y - 2 mu z / c^2 = 0,
  x^2/a^2 + y^2/b^2 + z^2/c^2 = 1,
)\
(x,y,z) = cal(k) (a,b,c) quad=>quad cal(k)=sqrt(3) / 3
$

此时 $V = 8x y z = 8/9 sqrt(3) a b c$, 为最大值.

#image("imgs/13.png", width: 50%)

#pagebreak()
=== 20
$
f(x,y,z,mu)=abs(x+y+2z-9) / (sqrt(1^2+1^2+2^2)) - mu(x^2/4+y^2+z^2-1)\
dcases(
  (diff f)/(diff x) = -1/(sqrt(6)) - mu x / 2 = 0 ,
  (diff f)/(diff y) = -1/(sqrt(6)) - 2mu y = 0 ,
  (diff f)/(diff z) = -2/(sqrt(6)) - 2mu z = 0 ,
  x^2/4 + y^2 + z^2 = 1 ,
)\
P_1(4 / 3,1 / 3,2 / 3) quad P_2(-4 / 3,-1 / 3,-2 / 3)
$

#image("imgs/14.png", width: 60%)

#pagebreak()
=== 21
$
F(x,y,z)=sqrt(x)-sqrt(y)-sqrt(z)-sqrt(a) eq.triple 0\
dif F = 1 / (2sqrt(x))dif x - 1 / (2sqrt(y))dif y - 1 / (2sqrt(z))dif z = 0\
1 / (2sqrt(x_0))(x-x_0) - 1 / (2sqrt(y_0))(y-y_0) - 1 / (2sqrt(z_0))(z-z_0) = 0\
x / (2sqrt(x_0)) - y / (2 sqrt(y_0)) - z / (2 sqrt(z_0)) = sqrt(x_0) / 2 - sqrt(y_0) / 2 - sqrt(z_0) / 2\
x / (sqrt(x_0)) - y / (sqrt(y_0)) - z / (sqrt(z_0)) = sqrt(x_0) - sqrt(y_0) - sqrt(z_0)\
$

所有截距之和:

$
l_1+l_2+l_3=(sqrt(x_0)-sqrt(y_0)-sqrt(z_0))^2 = a
$

四面体体积:

$
1 / 6 l_1 dot l_2 dot l_3 = 1 / 6 a^(3 / 2) dot sqrt(x_0) dot sqrt(y_0) dot sqrt(z_0)
$

$
f(
  x_0, y_0, z_0, mu
) = a^(3 / 2) dot sqrt(x_0) dot sqrt(y_0) dot sqrt(z_0) - mu(sqrt(x_0) - sqrt(y_0) - sqrt(z_0) - sqrt(a)) \
f(l,m,n,mu) = a^(3 / 2) dot l m n - mu(l - m - n - sqrt(a))\
dcases(
  (diff f)/(diff l) = a^(3/2) dot m n - mu = 0 ,
  (diff f)/(diff m) = a^(3/2) dot l n - mu = 0 ,
  (diff f)/(diff n) = a^(3/2) dot l m - mu = 0 ,
  l m n = a ,
)\
=> quad l = m = n = 1 / 3 sqrt(a)
$

所以最大四面体面积为 $a^3/162$, 截面: $x-y-z+1/9 a=0$

#pagebreak()
=== P156 1

- (2)
$
integral_0^2 dif x integral_(2x)^(6-x)f(x,y)dif y = integral_0^4 dif y integral_0^(y / 2) f(
  x,y
)dif x + integral_4^6 dif y integral_0^(6-y) f(x,y)dif x\
$
- (3)
$
integral_0^a dif y integral_(a-sqrt(a^2-y^2))^(a+sqrt(a^2-y^2))f(
  x,y
)dif x = integral_0^(2a) dif x integral_(0)^(sqrt(a^2-(x-a)^2))f(x,y)dif y\
$
- (5)
$
integral_0^1 dif x integral_0^x f(x,y) dif y+integral_1^2 dif x+integral_0^(2-x) f(
  x,y
) dif y = integral_0^2 dif y integral_y^(2-y) f(x,y) dif x\
$
- (6)
$
integral_0^1dif y integral_(1 / 2)^1f(x,y)dif x+integral_1^2dif y integral_(1 / 2)^(1 / y)f(
  x,y
)dif x = integral_(1 / 2)^1dif x integral_(0)^(1 / x)f(x,y)dif y\
$

#align(center)[
  #box(width: 95%)[
    #table(
      columns: (auto, auto, auto),
      align: bottom,
      stroke: none,
      [
        #image("imgs/15.png")
        (2)
      ],
      [
        #image("imgs/16.png")
        (3)
      ],
      [
        #image("imgs/17.png")
        (5)

        #image("imgs/18.png")
        (6)
      ],
    )
  ]
]

#pagebreak()
=== 2

- (1)
$
&quad integral.double_D y / (1+x^2+y^2)^(3 / 2) dif x dif y quad D=[0,1]times[0,1]\
&=integral_0^1 dif x integral_0^1 y / (1+x^2+y^2)^(3 / 2) dif y\
&=integral_0^1 dif x integral_0^1 (1 / 2 dif y^2) / (1+x^2+y^2)^(3 / 2)\
&=integral_0^1 [-(1+x^2+y^2)^(-1 / 2)]_0^1 dif x\
&=integral_0^1 -1 / sqrt(2+x^2) + 1 / sqrt(1+x^2) dif x\
&=[-ln(x+sqrt(2+x^2)) + ln(x+sqrt(1+x^2))]_0^1\
&=-ln(1+sqrt(3)) + ln(1+sqrt(2)) + 1 / 2ln 2\
&=quad ln(-1+sqrt(3))+ln(1+sqrt(2))-1 / 2ln 2
$

- (2)
$
&quad integral.double_D sin(x+y) dif x dif y quad D=[0,pi]times[0,pi]\
&=integral_0^pi dif x integral_0^pi sin(x+y) dif y\
&=integral_0^pi (-cos(pi+x)+cos x) dif x\
&=-sin 2pi + sin pi + sin pi - sin 0\
&=0
$

- (3)
$
&quad integral.double_D cos(x+y) dif x dif y\
&=integral_0^pi dif x integral_x^pi cos(x+y) dif y\
&=-integral_0^pi sin(2x)+sin x dif x\
&=-2
$

#align(center)[
  #rect[
    $
    integral_0^pi sin(2x) dif x = 1 / 2 integral_0^(2pi) sin x dif x = 0
    $
  ]
]

#pagebreak()
- (6)
$
&quad integral.double_D (sin y) / y dif x dif y\
&= integral_0^1 dif y integral_(y^2)^y (sin y) / y dif x\
&= integral_0^1 (1-y)sin y dif y\
&= 1-sin 1
$

- (7)
$
&quad integral.double_D x^2 / y^2 dif x dif y\
&= integral_1^2dif x integral_(1 / x)^x x^2 / y^2 dif y\
&= integral_1^2 [-x^2 / y]_(y=1 / x)^(y=x) dif x\
&= integral_1^2 (-x+x^3) dif x\
&= -2^2 / 2 + 2^4 / 4 + 1 / 2 - 1 / 4\
&= 9 / 4
$

- (8)
$
&quad integral.double_D abs(cos(x+y)) dif x dif y\
&= integral_0^(pi / 4) dif x integral_0^x dif y + integral_(pi / 4)^(pi / 2) dif x integral_0^(pi / 2-x) dif y - integral_(pi / 4)^(pi / 2) dif x integral_(pi / 2 - x)^(x) dif y \
&= pi / 2 - 1
$

#pagebreak()
=== 3

- (1)
$
&quad integral.double_D (x^2+y^2) dif x dif y quad D = [-1,1]times [-1,1]\
&= 4 integral.double_(D^') (x^2+y^2) dif x dif y quad D^' = [0,1]times [0,1]\
&= 8 integral.double_(D^') x^2 dif x dif y\
&= 8 integral_0^1 x^2 dif x\
&= 8 / 3
$

- (2)

#image("imgs/8.png", width: 50%)

$
integral.double_D sin x sin y dif x dif y &= integral sin x dot dif x integral_(y_2(x))^(y_1(x)) sin y dif y\
(forall x, quad y_1(x) + y_2(x) = 0) &=> integral 0 dot sin x dif x\
&=0
$

#pagebreak()
=== 5

$
integral_0^a dif x integral_0^x f(x)f(y) dif y &= integral_0^a dif y integral_0^x f(y)f(x) dif x \
=> integral_0^a dif x integral_0^x f(x)f(y) dif y &= 1 / 2 integral.double_D f(x)f(y) dif x dif y quad &D = [0,a]times[
  0,a
]\
&= 1 / 2 (integral_0^a f(x) dif x)^2 quad qed \
integral_0^a dif x integral_0^x f(y) dif y &= integral_0^a dif y integral_y^a f(y) dif x\
&=integral_0^a (a-y) f(y) dif y quad qed
$

// #pagebreak()
=== 6
$
integral.double_D (diff^2 f) / (diff x diff y) dif x dif y & = integral_a^b dif x integral_c^d (diff^2 f) / (diff x diff y) dif y\
&= integral_a^b ((diff f) / (diff x)(x,d) - (diff f) / (diff x)(x,c)) dif x\
&= f(b,d) - f(a,d) - f(b,c) + f(a,c) quad qed
$

// #pagebreak()
=== 7
$
1 / (2pi r_0) integral.double_(r<r_0) f(
  r,theta
) r dif r dif theta = 1 / (2pi r_0) integral_0^(2pi) dif theta integral_0^r_0 f(r,theta) r dif r\
\
forall epsilon>0, exists r_0 = r_0(theta) quad s.t. quad r<r_0 => |f(r,theta)-f(0,0)|<epsilon\
\
=> 1 / (2pi r_0) integral_0^(2pi) dif theta integral_0^r_0 f(
  r,theta
) r dif r < 1 / (2pi r_0) integral_0^(2pi) dif theta integral_0^r_0 (f(0, 0) + epsilon) r dif r = f(0,0) + epsilon\
=> 1 / (2pi r_0) integral_0^(2pi) dif theta integral_0^r_0 f(
  r,theta
) r dif r > 1 / (2pi r_0) integral_0^(2pi) dif theta integral_0^r_0 (f(0, 0) - epsilon) r dif r = f(0,0) - epsilon\
\
\
=> (
  1 / (2pi r_0) integral.double_(r<r_0) f(r,theta) r dif r dif theta - f(0,0)
) < epsilon quad forall epsilon, exists r, forall r_0<r quad qed
$

#pagebreak()
=== P166 1

- (1)
$
&quad integral_0^R dif x integral_0^(sqrt(R^2-x^2)) ln(1+x^2+y^2) dif y\
&= integral_0^(pi / 2) dif theta integral_0^R ln(1+r^2) r dif r\
&= pi / 2 integral_0^R ln(1+r^2) r dif r\
&= pi / 4 integral_0^R^2 ln(1+t) dif t\
&= pi / 4 dot [(t+1)ln(1+t)-t]_0^R^2\
&= pi / 4 dot [(R^2+1)ln(1+R^2)-R^2]
$

- (4)
$
&quad integral_0^(1 / (sqrt(2))) dif x integral_x^(sqrt(1-x^2)) x y(x+y) dif y \
&=integral_(pi / 4)^(pi / 2) dif theta integral_0^1 r cos theta dot r sin theta dot (r cos theta + r sin theta) r dif r\
&=1 / 5 integral_(pi / 4)^(pi / 2) (cos^2 theta sin theta + cos theta sin^2 theta) dif theta\
&=1 / 15
$

- (5)

$
&quad integral_0^(R/(sqrt(1+R^2))) dif x integral_0^(R x)(1+(y^2)/(x^2)) dif y + integral_(R/sqrt(1+R^2))^(R) dif x integral_0^(sqrt(R^2-x^2))(1+(y^2)/(x^2)) dif y\
&=integral_0^(arctan R) dif theta integral_0^R (r^2)/(r^2 cos^2 theta) r dif r\
&=integral_0^(arctan R) dif theta integral_0^R sec^2 theta dot r dif r\
// &=integral_0^(arctan R) dif theta sec^2 theta r^2/2 |_0^R\
&=R^2/2 integral_0^(arctan R) sec^2 theta dif theta\
&=R^2/2 [tan theta]_0^(arctan R)\
// &=1/2 R^2 tan(arctan R)\
&=1/2 R^3
$

#pagebreak()
=== 2
- (2)

$
&quad integral.double_D sqrt(x^2/a^2+y^2/b^2) dif x dif y\
(x=a dot r sin theta, y=b dot r cos theta) & = integral.double_D r dot a b dot r dif r dif theta\
&= a b integral_0^(arctan(a\/b)) dif theta integral_0^2 r^2 dif r\
&= 8 / 3 a b dot arctan(a/b)
$

- (5)

$
(x y = u, x^2 / y=v) => (x=root(3,u v), y = root(3,u^2/v))\ \
(diff (x,y)) / (diff (
  u,v
)) = abs(mat(
  1/3 u^(-2/3) v^(1/3), 1/3 u^(1/3) v^(-2/3);
  2/3 u^(-1/3) v^(-1/3), -1/3 u^(2/3) v^(-4/3)
)) = abs( -1/9v^(-1) - 2/9 v^(-1)) = 1 / 3 v^(-1) quad u,v > 0\ \
$

$
integral.double_D x y dif x dif y
&= 1 / 3integral.double_D u^1 v^(-1) dif u dif v\
&= 1 / 3integral_a^b dif u integral_c^d u / v dif v\
&= 1 / 3(integral_a^b u dif u)(integral_c^d (dif v) / v)\
&= 1 / 6 (b^2-a^2)(ln d - ln c)
$

- (8)

$
(x+y = u, y=v) => (x=u-v,y=v)\
(diff (x,y)) / (diff (u,v)) = abs(mat(1,-1;0, 1)) = 1
$

$
integral.double_D sin y / (x+y) dif x dif y &=integral_0^1 dif t integral_0^t sin y / t dif y\
&=integral_0^1 dif t dot (t cos t / t - t cos 0 / t)\
&=integral_0^1 (-t cos 1 + t) dif t\
&=1 / 2 - 1 / 2 cos 1\
&=sin^2 1 / 2
$

#pagebreak()
=== 3

- (2)

  考虑变换 $u=x-y,v=y, (diff (x,y))/(diff (u,v))=1$

  因此在 $x-y$ 下的面积与 $u-v$下相等, 均为 $pi a^2$

- (3)

  考虑变换 $u=x+y,v=y/x quad => quad x = u/(1+v), y=(u v)/(1+v)$

$
(diff (x,y)) / (diff (u,v)) = u / (1+v)
$

$
integral.double_D dif x dif y &= integral.double_D u / (1+v) dif u dif v\
&=(integral_a^b u dif u)(integral_k^m (dif v) / (1+v))\
&=1 / 2(b^2-a^2)(ln(1+m) - ln (1+ k))
$

// #pagebreak()
=== 4
证明:$integral.double_(x^2+y^2<=1) e^(x^2+y^2) dif x dif y<= (integral_(-sqrt(pi)/2)^(sqrt(pi)/2)e^(x^2)dif x)^2$

$
"LHS"-"RHS" = integral.double_D - integral.double_(D^') = 4 integral.double_(D_1) - 4 integral.double_(D_2)
$

注意到
$
dcases(
  forall (x,y) in D_1 quad x^2+y^2 <=1 ,
  forall (x,y) in D_2 quad x^2+y^2 >= 1 ,
)\
=> forall (x_1,y_1) in D_1, (x_2,y_2) in D_2 quad f(x_1,y_1) <= f(x_2,y_2)\
\
sigma(D_1) = sigma(D_2)
\
=> integral.double_(D_1) - integral.double_(D_2) <=0 quad=>quad "LHS"-"RHS" <= 0
$

#image("imgs/19.png", width: 40%)

#rect(width: 100%)[
  #strike[骗分做法:]

  $
  integral.double_(x^2+y^2<=1) e^(x^2+y^2) dif x dif y
  &= integral_0^(2pi) dif theta integral_0^1 r e^r dif r\
  &= 2pi integral_0^1 r e^(r^2) dif r\
  &= 2pi [1 / 2 e^(r^2)]_0^1\
  &= pi(e-1)
  $

  $
  (integral_(-sqrt(pi) / 2)^(sqrt(pi) / 2)e^(x^2)dif x)^2
  &= (2 integral_0^(sqrt(pi) / 2)e^(x^2)dif x)^2\
  &>= (2 integral_0^(sqrt(pi) / 2) (1+ x^2 + x^4 / 2)dif x)^2\
  &= (pi^(1 / 2) + 1 / 12 pi^(3 / 2)+1 / 160 pi^(5 / 2))^2\
  &>= pi + 1 / 6 pi^2 + 1 / 144 pi^3 + 1 / 80 pi^3 + 1 / 960 pi^4
  $

  #strike[这不可能是正常做法, 这样放缩至少需要把 $pi > 22/7$ 代入, 然后至少计算到小数点后三位.]
]

#pagebreak()
=== 6

考虑把关于原点对称的两个区域合并计算, 即我们现在在右半平面上计算, 左侧的区域对称到 $(-x,-y)$ 计算:
$
& quad integral.double_(abs(x)+abs(y)<=1)e^(f(x,y)) dif x dif y\
& = integral.double_(abs(x)+abs(y)<=1, x>0)e^(f(x,y))+e^(f(-x,-y)) dif x dif y\
& = integral.double_(abs(x)+abs(y)<=1, x>0)e^(f(x,y))+e^(-f(x,y)) dif x dif y\
& >= 2integral.double_(abs(x)+abs(y)<=1, x>0) dif x dif y\
& = 2 quad qed
$

=== 7

考虑变换 $s=x+y, t=x-y, (diff (x,y))/(diff (s,t)) = 1/2$

$
integral.double_D f(x-y) dif x dif y &= integral.double_(D^') 1 / 2 f(t) dif s dif t\
&=1 / 2 integral_(-A)^A dif t integral_(abs(t) - A)^(A-abs(t)) f(t) dif s\
&=integral_(-A)^A (A-abs(t)) f(t) dif t quad qed
$

#image("imgs/20.png", width: 50%)