#import "../utils.typ": *

= Lecture 2 & 3

```plain
Time: Week 2, 9.13 Wed & 9.15 Fri
```

== 数列极限

刻画「收敛」的方式:

#definintion(name: "数列极限")[
$epsilon - N$语言:

$ forall epsilon > 0, exists N, forall n > N, abs(a_n - a) < epsilon quad => quad lim_(n -> infinity) a_n = a $
]

记号:

$
cases(
lim a_n  = a,
lim_(n -> infinity) a_n = a,
a_n -> a quad (n -> infinity),
)
$

=== 例子

$ alpha > 0, quad lim 1/n^alpha = 0 $
$ abs(q) < 1, quad lim q^n = 0 $
$ lim (2^n)/(n!) = 0 $

== 数列极限的性质

=== 唯一性
#statement[
    若${a_n}$ 收敛, 则 ${a_n}$ 的极限唯一.

    这说明数列的极限是「良定义」的.
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
    forall n > N_1, abs(a_n - a) < epsilon \
    forall n > N_2, abs(a_n - b) < epsilon
    $

    则当$n > max{N_1, N_2}$

    $ abs(a-b) = abs(a-a_n + a_n - b) <= abs(a-a_n) + abs(a_n - b) < 2*epsilon = abs(a-b) $

    矛盾.
]

=== 有界性

#statement[
    若${a_n}$ 收敛, 则 ${a_n}$ 有界. 即存在一个正数$M$, 使得 $forall n, quad abs(a_n) < M$.
]

#proof[
    取 $epsilon = 1$, 根据极限的定义, 存在 $N$, 使得

    $ forall n > N, abs(a_n - a) < 1 $

    则当$n > N$

    $ abs(a_n)  < 1 + abs(a) $

    取 $M = max{abs(a_1), abs(a_2), ..., abs(a_N), 1+abs(a)}$, 则 $forall n, quad abs(a_n) < M$.

    #caption[
        通常情况下, 不能直接取得无穷多个数的最大值,
        $a_n = n$ 就不存在最大值, 但是他前$N$项可以取最大值.

        在一般的情况下, 正如上面证明展示的那样, 拆成有限+无限两部分, 分别控制大小, 可以得到有界的结论.
    ]
]


=== 保序性

#caption[
    「充分大」: 等于在说,存在一个$N$, 使得 $n>N$ 时,某个结论成立.

    这个概念的引入, 等于说刨除了前有限项的影响, 只讨论后面无穷多项的性质.
]

#statement[
    - 若 $exists l, quad l<a$, 那么当$n$充分大时, 有 $l < a_n$

    特别的, 取$l=0$, 上述结论可以改写为:

    - 若 $exists l, quad l<0$, 那么当$n$充分大时, 有 $0 < a_n$
]

#proof[
    讨论$l<a$:

    取 $epsilon = a-l$, 根据极限的定义, 存在 $N$, 使得

    $ forall n > N, abs(a_n - a) < a-l quad => quad a_n > l $
]

通过上面的命题还可推导出一个更为常用的结论:

#statement[
    若$exists l$,对充分大的$n$, 有 $l <= a_n$, 则 $l <= a$
]

#caption[
    反证, 证明略.

    注意, 如果将上面不等式中两个$<=$均替换为严格的$<$, 则结论并不成立. 给出一个反例: $a_n = 1/n > 0$, 但是$a=0$.
]

=== 四则运算

#statement[
    ${a_n}, {b_n}$是两个收敛数列, 则

    - $lim(a_n plus.minus b_n) = lim a_n plus.minus lim b_n$

    - $lim(a_n dot b_n) = lim a_n dot lim b_n$

    - $lim b_n !=0 quad => lim(a_n/b_n) = (lim a_n)/ (lim b_n) $
]

=== 数列间关系

#statement[
    ${a_n}, {b_n}$是两个收敛数列, 则

    -  $a_n <= b_n$, 则 $lim a_n <= lim b_n$

    - 若$lim a_n < lim b_n$, 则当$n$充分大时, $a_n < b_n$
]

#caption[
    可以考虑更简便的代换 $c_n = a_n - b_n$, 使用保序性来说明.
]

#statement[
    ${b_n}, {c_n}$均收敛到$a$, 且当 $n$ 充分大时存在:

    $ b_n <= a_n <= c_n $

    则 ${a_n}$ 收敛, 且 $lim a_n = a$
]

#proof[
    首先通过 $lim b_n = lim c_n = a$ 可以得到:

    $
    exists N_1, n>N_1 => abs(b_n - a) < epsilon \
    exists N_2, n>N_2 => abs(c_n - a) < epsilon
    $

    同时,
    $ exists N_3, forall n>N_3, b_n <= a_n <= c_n $

    取 $N = max{N_1, N_2, N_3}$, 则当$n>N$时,有:

    $
    &a - epsilon < b_n <= a_n <= c_n < a + epsilon \
    &=> forall epsilon, exists N, forall n>N, quad  abs(a_n - a) < epsilon \
    &=> lim a_n = a
    $
]

#caption[
    上述条件中未假定${a_n}$收敛, 可用作判断收敛的依据.
]

=== 子列

#definintion(name: "子列")[
    定义${a_n}$的子列是这样一个数列${a_(n_k)}_k$, 其中${n_k}$是一个严格递增的数列.
]

#statement[
    ${a_n}$收敛, 则${a_n}$的任意子列收敛, 且极限相同.
]

#caption[
注意
    - 子列的编号严格递增, 因此 $n_k >= k$
    - 如果${a_n}$的一个子列${a_(n_k)}_k$发散, 则${a_n}$也发散
    - 如果${a_n}$的一个子列${a_(n_k)}_k$收敛到$a$, ${a_(m_k)}_k$收敛到$b$, 且$a!=b$ 则${a_n}$发散 (Why?)

]


#pagebreak()

== 一些问题

=== 极限不存在

极限的定义:

$ lim a_n = a quad <=> quad forall epsilon > 0, exists N, forall n > N, abs(a_n - a) < epsilon $

则极限不存在的定义:

$
lim a_n != a quad <=> quad exists epsilon > 0, forall N, exists n > N, abs(a_n - a) >= epsilon
$

#caption[
    一些同学给出了这样的形式:

    $
    lim a_n != a quad <=> quad exists epsilon > 0, forall N, forall n > N, abs(a_n - a)  >= epsilon
    $ <array.limit.wrong.equation>

    这个表述是错误的, 我们考虑这个例子:

    $
    a_n = cases(
        1/n quad n = 2k+1,
        1 quad n = 2k
    )
    $

    这个例子显然不满足@array.limit.wrong.equation 的条件, 但是极限不存在.
]

可以这样理解极限的定义:对于任意的$epsilon$邻域, 邻域会把${a_n}$的取值分成两部分, 如果极限存在, 那么:

- 无穷多个点总是落在邻域内
- 邻域外的点至多有限

从这个角度来看, 极限的定义是这样描述的:

- 对于任意的$epsilon$邻域, 邻域外的点至多有限 $=> forall epsilon$
- 那么邻域外的点的序号总存在一个上界, 我们称之为$N$ $=> exists N$
- 那么剩下的, 无穷多的点${a_n | n > N}$都应该落在邻域内 $=> forall n>N quad abs(a_n-a)<epsilon$

而极限不存在的充要条件, 不是「存在一个邻域内只有有限多点」, 而是*「邻域外的点无穷多个」*便可说明, 应当描述为:

- 对于任意的$epsilon$邻域, 邻域外总有无穷多个点 $=> exists epsilon$
- 邻域外的点无穷多个, 无法确定最大编号, 我们称之为$N$ $=> forall N$
- 也就是说, 任给一个控制的上界$N$,总有至少一个$n>N$落在邻域外面: $=> exists n>N quad abs(a_n-a)>=epsilon$

#caption[
    从上面的理解方式出发,更容易寿命:「改变数列中有限多项的值不改变收敛性及其极限」
]

=== $epsilon$的任意性

很多时候分析就在研究怎样选取$epsilon$.定义中要求$forall epsilon>0$, 这个任取的作用要远比看上去的要大.

#caption[
    $epsilon$只是无穷小量的一个体现, 因为它是任意的, 所以其他地方定义的 $epsilon$ 经过缩放或者其他变化, 只要满足$epsilon^prime>0$, 就不影响极限定义的成立.

$ exists N_(epsilon^prime), forall n>N_(epsilon^prime), quad abs(a_n - a)<epsilon^prime $
]

#pagebreak()