#import "../utils.typ": *

= Lecture 1

```plain
Time: Week 1, 9.11 Mon
```

== 数域扩张

$
    NN =>^("减法") ZZ =>^("除法") QQ =>^("极限") RR =>^("二次方程") CC
$

#definintion(name: $ZZ$)[
    $
    ZZ := {0} union NN^+ union (-NN^+) \
    -NN^+ := {-n | n in NN^+}
    $
]

#definintion(name: $QQ$)[
    $
    QQ := {a/b | a,b in ZZ, b !=0}
    $
]


#caption[
$NN$的严格定义依赖Peano公理,移步 $=>$ @peano,这门课不做要求.
]

#caption[
    $QQ$是可数集,移步 $=>$ @QQ.countable
]

== $RR$

#homework[
    $sqrt(2)$是无理数
]

常用的构造$RR$的方法有:

- 十进制小数
- Dedekind 分割
- Cauchy 列

=== 十进制小数

$
a_0.a_1a_2...=sum_(k=0)^infinity a_k/ 10^k
$

=== Dedekind分割

这样构造核心是「分割」$QQ$, 将其分割为$A, B$,满足:

- $Q = A union B$
- $A sect B = emptyset$ (_这点可忽略,直接要求第三条_)
- $forall a in A, forall b in B => a < b$

#caption[
请注意,Dedekind分割并不需要在无理数($RR without QQ$)处分割,分割出的也并不必然是无理数,课堂上似乎传递了这样的误解, 例如:

$
A := {x in QQ | x < 0}, quad B := {x in QQ | x >= 0}
$
这样的分割并不是一个无理数.

]

这样分割的结果会有如下三种可能:

- 在$QQ$中$A$有最大数, $B$无最小数
- 在$QQ$中$A$无最大数, $B$有最小数
- 在$QQ$中$A$无最大数, $B$无最小数

在前面这两种情况中,我们说这个分割定义了有理数. 在两侧均无极值时,我们说这个分割定义了一个无理数$alpha$,向$A$或者$B$中任一添加这个$alpha$,都会让$QQ$更加「完备」

我们把所有有理数的分割的的集合称为实数集,记作$RR$.每个分割都对应一个实数.


#caption[
    我们在这里展开讨论经典的Dedekind分割,这一点似乎让很多同学有困惑:

    $
    A&:={x in QQ | x>0 and x^2 < 2} union {x<0}\
    B&:={x in QQ | x>0 and x^2 >2}
    $

    我们说明:$A$中不存在最大数:

    #proof[
        若存在最大数$p^2<2 quad (p>0)$,构造
        $
        q:= p + (2-p^2)/(p+2) = (2+2p)/(p+2)
        $

        容易说明:$q>p$, 同时$q^2<2$,因此$A$中不存在最大数.
    ]

    同时,通过初等的办法可以说明,$sqrt(2)$不是有理数,因此这个Dedekind分割成功构造出了$sqrt(2)$这个无理数.
]

=== Cauchy列

用收敛数列的极限来定义实数,例如

$
a_1 in QQ, quad a_1>sqrt(2), quad a_(n+1) = 1/2 (a_n + 2/a_n) \
=> forall n, quad a_n in QQ, quad lim_(n->infinity) a_n = sqrt(2)
$

#caption[
    这个例子说明:有理数的极限未必是有理数,上面Dedekind的例子中也说明了这一点,可以通过构造$ a_(n+1) = (2+2a_n)/(a_n + 2) $来得到一个单调递增,收敛到$sqrt(2)$的数列.

    从这个意义上说,$RR$是在$QQ$上引入极限运算的结果,实数可以定义为有序完备域.
]

#pagebreak()

== 一些问题

=== 补充知识

补充一些这门课可能用的记号和它们的`LaTeX`代码作为参考.

#grid(
  columns: (1fr, 1fr),

table(
    columns: (auto, auto, auto),
    stroke: none,
    [符号],[说明],[`LaTeX`],
    $NN$,[自然数],`\mathbb{N}`,
    $ZZ$,[整数],`\mathbb{Z}`,
    $QQ$,[有理数],`\mathbb{Q}`,
    $RR$,[实数],`\mathbb{R}`,
    $CC$,[复数],`\mathbb{C}`,

    $forall$,[任意],`\forall`,
    $exists$,[存在],`\exists`,
    $exists!$,[唯一存在],`\exists!`,

    $subset$,[子集],`\subset`,
    $subset.neq$,[真子集],`\subsetneq`,

    $union$,[并集],`\cup`,
    $sect$,[交集],`\cap`,
    $without$,[差集],`\setminus`,
    $union.plus$,[并集(不相交)],`\dot{\cup}`,

    $in$,[属于],`\in`,
    $in.not$,[不属于],`\notin`,
),
table(
    columns: (auto, auto, auto),
    stroke: none,
    [符号],[说明],[`LaTeX`],
    $arrow.r.double$,[蕴含],`\implies`,
    $arrow.l.r.double$,[等价],`\iff`,
    $arrow.tr$,[单调递增],`\nearrow`,
    $arrow.br$,[单调递减],`\searrow`,
    $arrow.r.long.bar$,[映到],`\mapsto`,
    $eq.def$,[定义为],`\triangleq`,
    $colon.eq$,[定义为],`:=`,
    $tilde$,[等价],`\sim`,
    $and$,[与],`\wedge`,
    $or$,[或],`\vee`,
    $prop$,[成正比],`\propto`,
    $Sigma$,[求和],`\sum`,
    $Pi$,[求积],`\prod`,
    $qed$,[证毕],`\qed`,
    $infinity$,[无穷],`\infty`,
)
)

#caption[
    掌握这些符号后,请在证明中减少不必要的语言描述,直接使用符号表达即可.

    在高中时可能更习惯使用这样的写法:
    $
    because "statement A" \
    therefore "statement B"
    $

    但在今后的课程作业/考试中,请使用这样的写法:

    $
    "statement A" => "statement B"
    $


    更多内容会在习题课上进行说明.
]

=== 归纳法

#statement[
    对于一个列命题${S_n}$(其中每个元素$S_i$都是一个命题),如果能说明:

    - $S_1$成立
    - $S_n => S_(n+1)$

    则可以说明$forall n$, 命题$S_n$都成立.
]

有时这样的「命题列」的编号, 会跟题目中数列的编号出现混淆,我们使用群里提出的一道题目来说明这个问题:

#homework[
    $a_1, a_2, ..., a_n (n>=2)$都是正数且$a_1 + a_2 + ... + a_n < 1$,求证:

    $
    product_(k=1)^n (1+a_k) > 1 + sum_(k=1)^n a_k
    $
]

一个很有价值的问题是,如果在这里使用归纳法,从$n$推向$n+1$时,是否还能说明$a_1 + ... a_(n+1)<1$?因为我们只知道前$n$项和小于$1$,但是不知道第$n+1$项的大小.

这里的问题就在于混淆了命题跟数列编号的问题,按照「命题列」的思路,我们来给出第$S_n$个命题的准确定义:

$
forall {a_k}_(k=1)^n quad sum_(k=1)^n a_k < 1 => product_(k=1)^n (1+a_k) > 1 + sum_(k=1)^n a_k
$

因为确实容易混乱,我们把$S_(n+1)$的定义也写出来:

$
forall {b_k}_(k=1)^(n+1) quad sum_(k=1)^(n+1) b_k < 1 => product_(k=1)^(n+1) (1+b_k) > 1 + sum_(k=1)^(n+1) b_k
$

在$S_(n+1)$的命题中,一般情况下并不能自然的得到前$n$项直接套用$S_n$中的结论,只不过:

$
b_1 +... + b_n < (b_1 + ... +b_n) + b_(n+1) < 1
$

进而这里的${b_k}_(k=1)^n$(前$n$项)自然符合$S_n$中的${a_n}$的要求,进而可以使用$S_n$的结论.事实上甚至可以对${b_k}_(k=2)^(n+1)$(后$n$项)使用$S_n$的结论(可以试试).

=== 邻域

#caption[
    后续课程中会经常遇到以一点为中心的开区间,和去掉这点本身的开区间,分别称为这点的邻域和去心邻域.
    $
    U(a, delta) &:= (a-delta, a+delta) \
    U^compose (a,delta) &:= (a-delta, a) union (a, a+delta)
    $
]

#pagebreak()