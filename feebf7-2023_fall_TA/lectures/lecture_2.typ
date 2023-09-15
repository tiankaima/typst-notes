#import "../utils.typ": *

= Lecture 2, 3

```plain
Time: Week 1, 9.13 Wed, 9.15 Fri
```

== 数列极限

刻画"收敛"的方式:

#definintion[

$epsilon - N$语言:

$
forall epsilon > 0, exists N, forall n > N, |a_n - a| < epsilon quad => quad lim_(n -> infinity) a_n = a
$
]

记号:

$
cases(
lim a_n  = a,
lim_(n -> infinity) a_n = a,
a_n -> a quad (n -> infinity),
)
$

== 例子

$
alpha > 0, quad lim 1/n^alpha = 0
$

$
abs(q) < 1, quad lim q^n = 0
$

$
lim (2^n)/(n!) = 0
$

== 数列极限的性质

=== 唯一性
#statement[
    若${a_n}$ 收敛, 则 ${a_n}$ 的极限唯一. 数列的极限是良定义的.
]

#proof[
    反证:
    $
    cases(
        a_n -> a,
        a_n -> b
    ), quad a!=b
    $

    取 $epsilon = abs(a-b)/2$, 根据极限的定义, 存在 $N_1, N_2$, 使得

    $
    forall n > N_1, |a_n - a| < epsilon \
    forall n > N_2, |a_n - b| < epsilon
    $

    则当$n > max{N_1, N_2}$

    $
    |a-b| = |a-a_n + a_n - b| <= |a-a_n| + |a_n - b| < 2*epsilon = |a-b|
    $

    矛盾.
]

=== 有界性

=== 保序性


=== 四则运算


#pagebreak()

== 一些问题

=== 极限不存在

$
lim a_n = a quad <=> quad forall epsilon > 0, exists N, forall n > N, |a_n - a| < epsilon
$

极限不存在的充要条件应该表述成这样的形式:

$
lim a_n != a quad <=> quad exists epsilon > 0, forall N, exists n > N, |a_n - a| >= epsilon
$

#caption[
    一些同学给出了这样的形式:

    $
    lim a_n != a quad <=> quad exists epsilon > 0, forall N, forall n > N, |a_n - a| >= epsilon
    $ <array.limit.wrong.equation>

    这个表述是错误的,我们考虑这个例子:

    $
    a_n = cases(
        1/n quad n = 2k+1,
        1 quad n = 2k
    )
    $

    显然 $lim a_n$ 不存在, 但是这个例子显然也不满足@array.limit.wrong.equation 的条件.
]

可以这样理解极限的定义:对于任意的$epsilon$邻域,邻域会把${a_n}$的取值分成两部分,如果极限存在,那么:

- 无穷多个点总是落在邻域内
- 邻域外的点至多有限

从这个角度来看,极限的定义是这样描述的:

- 对于任意的$epsilon$邻域,邻域外的点至多有限 $=> forall epsilon$
- 那么邻域外的点的序号总存在一个上界,我们称之为$N$ $=> exists N$
- 那么剩下的,无穷多的点${a_n | n > N}$都应该落在邻域内 $=> forall n>N quad abs(a_n-a)<epsilon$

而极限不存在的充要条件,不是"存在一个邻域内只有有限多点",而是*"邻域外的点无穷多个"*便可说明,应当描述为:

- 对于任意的$epsilon$邻域,邻域外总有无穷多个点 $=> exists epsilon$
- 邻域外的点无穷多个,无法确定最大编号,我们称之为$N$ $=> forall N$
- 也就是说,任给一个控制的上界$N$,总有至少一个$n>N$落在邻域外面: $=> exists n>N quad abs(a_n-a)>=epsilon$

#homework[
    从上面的理解方式出发,证明:"改变数列中有限多项的值不改变收敛性及其极限"
]

=== $epsilon$的任意性

很多时候分析就在研究怎样选取$epsilon$.定义中要求$forall epsilon>0$,这个任取的作用要远比看上去的要大.

#caption[
    $epsilon$只是无穷小量的一个体现,因为它是任意的,所以其他地方定义的$epsilon$经过缩放或者其他变化,只要满足$epsilon^prime>0$,就不影响极限定义的存在,依然会满足$exists N, forall n>N abs(a_n - a)<epsilon^prime$
]

#pagebreak()