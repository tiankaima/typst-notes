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

#let blue_note(it) = [
  #rect(stroke: blue + 0.02em, width: 100%, inset: 1em)[
    #set text(fill: blue)
    #it
  ]
]

#show image: it => [
  #set align(center)
  #it
]

#align(right + horizon)[
  = Function Analysis Introduction
  2024 Spring 数学分析 B2

  Tiankai Ma

  2024.05.20 随堂笔记
]

#pagebreak()

在第 12 章 Fourier Series 的部分, 我们实际上只需要考虑 $L_2$ 空间, 即平方可积函数的空间.

讨论它的原因主要是我们在 B1 讨论过如下积分:

$
  &integral_(-pi)^(pi) cos(n x) cos(m x) dif x = 0, quad n != m\
  &integral_(-pi)^(pi) sin(n x) sin(m x) dif x = 0, quad n != m\
  &integral_(-pi)^(pi) cos(n x) sin(m x) dif x = 0
$

在线性代数中我们有正交基的概念, 讨论起来大概是这个样子:

$
  {e_1, e_2, ... e_n}, quad forall i!=j quad angle.l e_i, e_j angle.r = 0
$

这两件事情可能看起来没什么关系, 但是如果我们把线性代数中空间从 $RR^n$ 替换成函数空间呢? 也就是我们不再把函数是做 $f: A->B$ 的映射, 能不能对函数本身, 按照线性代数的思路来讨论呢?

#v(2em)

== 函数空间 Function Space

我们定义函数空间 $F(A)$ 为定义在 $A$ 上的函数的集合:

$
  F(A) = {f: A -> RR}
$

也就是说:

$
  forall f in F(A), quad f: A -> RR
$

#blue_note[
  注: 在下面的讨论中我会默认讨论 $F(RR)$, 在 Fourier Series 中, 按照本书的记号, 实际上所有函数都约定在 $F([-pi, pi])$ 上, 这两者的讨论只相差一个 $1_[-pi,pi]$, 改变上下限也可以得到相同的结论.
]

这不是我们第一次遇到函数空间的概念, 在 B1 中我们把连续函数 $f$ 就写作 $f in C^0(RR)$, 我们在这里把 $C^k (RR)$ 的定义表述如下:
$
  C^k (RR) = {f in F(RR): f, f', f'', ..., f^(k) in C^0(RR)}
$

#v(2em)

== 向量空间 Vector Space

我们自然的认为 $F(RR)$ 是线性的,

$
  forall f, g in F(RR), alpha, beta in R, quad alpha f + beta g in F(RR)
$

#blue_note[
  这样的说法其实不太严谨, 我们要补充定义两件事情,

  1. 加法: $f + g$ 的定义

  $
    f+g: RR -> RR, quad (f+g)(x) := f(x) + g(x)
  $

  2. 数乘: $alpha f$ 的定义

  $
    alpha f: RR -> RR, quad (alpha f)(x) := alpha f(x)
  $
]

#blue_note[
  对更一般的空间 $F$, 线性的性质是对一个数域 $KK$ 表述的, 完整的表述如下:

  $
    forall f, g in F, alpha, beta in KK, quad alpha f + beta g in F
  $

  也自然的, 我们需要定义加法和数乘的操作, 他们分别对应了两个二元操作:

  $
    + quad& (dot,dot): F times F -> F\
    dot quad& (dot, dot): K times F -> F
  $

  也就是线性的性质是 空间 $F$ 对于这两个操作 $(+, dot)$的性质.

  我们把满足上面的性质的空间称作向量空间 Vector Space.
]

#v(2em)

== 内积空间 Inner Product Space
// 我们直接跳到内积的定义, 在理解 Fourier Series上, 其他的事情都不那么重要:

我们定义 $F(RR)$ 上的内积 $angle.l dot, dot angle.r$ 为:

$
  angle.l f, g angle.r = &integral_(-oo)^(oo) f(x) g(x) dif x
$

#blue_note[
  在有些地方你可能看到这样的写法:

  $
    angle.l f, g angle.r = &integral_(-oo)^(oo) f(x) overline(g(x)) dif x
  $

  这是因为他们在复数域上讨论这个问题, 我们这里只考虑 $f : RR -> RR$, 但是这个定义是可以推广到复数域上的. 而且必须保留这个共轭的写法(为什么?)
]

#blue_note[
  与线性代数里面讲的内积性质相同, 我们同样可以验证:

  - 对称性:

    $angle.l f, g angle.r = angle.l g, f angle.r$

  - 线性性:

    $angle.l alpha f + beta g, h angle.r = alpha angle.l f, h angle.r + beta angle.l g, h angle.r$ (左)

    $angle.l h, alpha f + beta g angle.r = alpha angle.l h, f angle.r + beta angle.l h, g angle.r$ (右)

  - 正定性:

    $angle.l f, f angle.r >= 0$

    $angle.l f, f angle.r = 0 <=> f = 0$

  #blue_note[
    更一般的, 我们要求共轭对称性 & 左线性, 右线性可以推导出来.

    即使推广到复数域, 正定性的要求依然存在 $angle.l x,x angle.r >=0$, 意味着 $angle.l x,x angle.r in R$
  ]

  一般的, 我们把满足上面的性质的空间称作内积空间 Inner Product Space.
]
#box(width: 100%)[

  到这里我们说回那几个定义在 $[-pi,pi]$ 上的函数:

  $
    f_n = cos (n x), quad g_m = sin (m x)
  $

  他们之间相乘积分的性质, 这里也就转变为内积的性质:

  $
    angle.l f_n, f_m angle.r = &integral_(-pi)^(pi) cos (n x) cos (m x) dif x = 0, quad n != m\
    angle.l g_n, g_m angle.r = &integral_(-pi)^(pi) sin (n x) sin (m x) dif x = 0, quad n != m\
    angle.l f_n, g_m angle.r = &integral_(-pi)^(pi) cos (n x) sin (m x) dif x = 0
  $
]

#v(0.2em)

== 赋范空间 Normed Space

*接下来我们推导一下函数空间上模长的概念:*

在线性代数里, 内积的定义有一种很几何的表述方法:

$
  angle.l a, b angle.r = abs(a) dot abs(b) dot cos angle.l a, b angle.r
$

所以比较自然的有:

$
  angle.l a, a angle.r = abs(a) dot abs(a) dot cos angle.l a, a angle.r = abs(a)^2
$

从几何的角度来看, 因为我们先定义了 $abs(a) = (sum_(i=1)^n abs(a_i)^2)^(1/2)$, 然后再定义了 $angle.l a, b angle.r = abs(a) dot abs(b) dot cos angle.l a, b angle.r$. 但是我们也可以反过来, 先定义了 $angle.l a, b angle.r$, 然后定义 $abs(a) = angle.l a, a angle.r^(1/2)$, 这样的定义也是合理的.

推广到函数空间上也是这样的思路, 我们先定义了内积, 然后定义了"模长":

$
  abs(f) = angle.l f, f angle.r^(1 / 2) = (integral f^2 dif x)^(1 / 2)
$

"模长" 的概念, 推广到一般的向量空间上, 会被记作范数 (norm), 更规范地记作 $norm(dot)$, 也就是:

$
  norm(f) = angle.l f, f angle.r^(1 / 2) = (integral f^2 dif x)^(1 / 2)
$

我们把这样的范数称为内积诱导的范数, 额外的, 也可以不通过内积定义范数, 只需要满足:

#blue_note[

  作为模长的推广, 我们的对范数也有一些性质的要求:

  - 正定性:

    $norm(f) >= 0$

    $norm(f) = 0 <=> f = 0$

  - 齐次性:

    $norm(alpha f) = abs(alpha) norm(f)$

  - 三角不等式:

    $norm(f + g) <= norm(f) + norm(g)$

  一般的, 我们把满足上面的性质的空间称作赋范空间 Normed Space.
]

从内积诱导出来的范数满足额外的性质, 也就是:

$
  norm(f+g)^2 + norm(f-g)^2 = 2 norm(f)^2 + 2 norm(g)^2
$

一般被称作平行四边形定理 Parallelogram Law.

#blue_note[
  在这里我们漏掉了一件比较重要的事情, *存在性的问题*: 在一般的 $F(RR)$ 上, $angle.l f, g angle.r$ 和 $norm(f)$ 总是存在吗? 答案显然是否定的.

  那如何定义一个"最大"的 $V subset F(RR)$, 使得 $forall f,g$, $angle.l f, g angle.r$ 和 $norm(f)$ 总是存在呢?

  这里我们回顾 B1 用到的一个积分不等式:

  $
    (integral f dot g dif x)^2 <= (integral f^2 dif x) (integral g^2 dif x)
  $

  在 B1 习题课的时候我曾经提到, 这实际上是 Cauchy 不等式, 现在我们把他换为内积, 可以清楚的看到这一点:

  $
    (angle.l f, g angle.r)^2 &<= angle.l f, f angle.r dot angle.l g, g angle.r\
    &<= norm(f)^2 dot norm(g)^2
  $

  所以怎么样限制 $V subset F(RR)$ 使得 $angle.l f,g angle.r$ 总是存在呢? 其实只需要限制 $norm(f) < oo$ 即可, 也就是:
  $
    integral f^2 dif x < oo
  $

  那么自然有:
  $
    angle.l f, g angle.r = integral f dot g dif x <= norm(f) dot norm(g) < oo
  $

  也就是说, 只要空间里所有函数都平方可积, 那么 $angle.l f, g angle.r$ 总是存在的.
  这样, 我们得到了一个新的空间, 我们记作 $L^2 subset F(RR)$, 其中

  $
    L^2 = {f in F(RR): norm(f) < oo}
  $
]

#blue_note[
  $L_2$ 空间上的范数 (norm) 定义给了我们启发, 我们可以类似的定义 $L_p$ 空间和它的范数, 将这个概念推广开:

  $
    norm(f)_p := (integral f^p dif x)^(1 / p)
  $

  对应的, $L_p$ 空间也就是:
  $
    L_p = {f in F(RR): norm(f)_p < oo}
  $

  值得注意的是, 一般的 $L_p$ 空间在 $p!=2$ 时, 并不能被内积诱导出来. (怎么证明?)
]

#blue_note[
  有了 $L_2$ 范数以后, 我们注意到 $norm(f)_2 = 0 arrow.double.not f eq.triple 0$, 而只有:

  $
    integral f^2 dif x = 0
  $

  从这里能推出

  $
    m({x: f(x) != 0}) = 0
  $

  但是并不能得到 $f$ 逐点都为 $0$.

  这样的关系会影响其他一些我们对 $L_2$ Space 的看法, 最主要的是:
  $
    f = g quad <=> quad norm(f-g)_2 = 0
  $

  如果从这个角度理解 $L_2$ 空间上的 $f=g$, 就变成了:

  $
    f = g quad <=> quad m({x: f(x) != g(x)}) = 0
  $

  // 实际上给出了 $L_2$ 上一组等价关系 $L_2\/tilde: quad  f tilde g <=> norm(f-g)_2 = 0$

  我们把这样的关系记作 $f = g quad "a.e."$ (almost everywhere, 几乎处处相等), 这更像是一个等价关系, 而不是严格的相等关系.
]

#v(2em)

== 总结

推导到这里可以稍微停下来, 看看到目前为止我们介绍了哪些概念, 又有哪些新方法来处理问题:

// 我们backtrack一下:

- 函数空间 Function Space
- 向量空间 Vector Space
- 内积空间 Inner Product Space
- 赋范空间 Normed Space
- $L_2$ 空间

在介绍中, 向量空间是比较自然引入的, 这点符合我们直觉. 内积空间是我们人为定义 $angle.l f, g angle.r = integral f dot g dif x$ 的结果. 赋范空间是从内积空间的范数推导出来的.

在我们严谨讨论存在性的问题后, 我们引入了 $L_2$ 空间, 也就是平方可积函数的空间. 实际内积 $angle.l f, g angle.r$ 应该定义在 $L_2$ 空间上, 这样才能保证 $angle.l f, g angle.r$ 总是存在.

那么回顾开头提出的问题, 现在我们能使用线性代数的方法处理函数空间的问题了吗?

#v(2em)

我来提供几个例子:

*线性相关:* 考虑 $L_2 (RR)$ 上三个函数 ${1,x,2-x}$ 线性相关吗? ${0,x,2-x}$ 呢? ${1, x, x^2}$ 呢? 如果限制在 $L_2[0,1]$ 上, 结果会发生变化吗?

*标准正交基:* 有了内积和范数的概念, 我们能找到 $L_2[0,1]$ 上的一组标准正交基吗? ${cos(n x), sin(m x), ...}$ 构成一组正交基吗? 如何标准化?

*Gram-Schmidt 过程:* 我们能使用 Gram-Schmidt 过程来构造 $L_2[0,1]$ 上的一组正交基吗? 如果已知 ${1, x, x^2, ...}$ 线性无关, 如何构造一组正交基?

#pagebreak(weak: true)

== One More Thing

在泛函分析的课程中, 我们会讨论更一般的空间, 主要从几个方面刻画:

- 度量空间 Metric Space
$
  d(dot, dot): X times X -> RR
$

- 赋范空间 Normed Space
$
  norm(dot): X -> RR
$

- 内积空间 Inner Product Space
$
  angle.l dot, dot angle.r: X times X -> RR
$

这三者分别是 距离, 模长, 内积的概念的推广. 诱导关系 $angle.l dot, dot angle.r => norm(dot) => d(dot, dot)$, 也就是:

$
  norm(f) := angle.l f, f angle.r^(1 / 2)\
  d(f, g) := norm(f-g)
$

#v(2em)

在这之上还通过 Cauchy 列的概念引入了完备性的概念, 也就是: 所有的 Cauchy 列都收敛.
// 
// - Cauchy 列 Cauchy Sequence
// $
//   forall epsilon > 0, exists N, forall m, n > N, d(x_m, x_n) < epsilon
// $

// - 收敛性 Convergence
// $
//   exists x, forall epsilon > 0, exists N, forall n > N, d(x_n, x) < epsilon
// $

// - 完备性 Completeness: 


// #v(2em)

我们这节课讨论的 $L_2$ 空间就是一个完备的内积空间 (Hilbert Space).

另一件值得一提的事情是, 所有可分 Hilbert Space 都是同构 (isomorphic) 的, 也就是说, 他们之间的性质是一样的, 只是基(空间)不同.

#v(2em)

除了这里讨论的 $L_p$ 空间, 另一个很重要的空间是 $cal(l)_p$ 空间:

$
  cal(l)_p := {(x_n) in RR^oo :quad sum_(n=1)^oo abs(x_n)^p < oo}
$

其中的元素

$
(x_1, x_2, ... x_n, ...) in cal(l)_p
$

是一个序列, 他们的范数定义为:

$
  norm((x_n))_p := (sum_(n=1)^oo abs(x_n)^p)^(1 / p)
$

特别的, $cal(l)_2$ 上内积定义为:

$
  angle.l (x_n), (y_n) angle.r = sum_(n=1)^oo x_n y_n
$

如果对这方面感兴趣, 可以重复上面对 $L_2$ 的讨论, 证明 $cal(l_2)$ 是完备的内积空间.
