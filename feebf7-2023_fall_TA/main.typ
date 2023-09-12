#set text(
    font: "Source Han Serif SC",
    size: 10pt,
)
#set heading(numbering: "1.")
#set math.equation(numbering: "(1)")
#let definintion(body, name: "") = {
    box(
        width: 100%,
        stroke: (
            paint: green,
            thickness: 0.5pt,
        ),
        inset: 12pt,
        outset: 0pt,
        radius: 5pt,
        clip: true,
    )[
        #text(
            size: 11pt,
            weight: "bold",
        )[
            定义: #name
        ]

        #set text(
            size: 9pt,
        )
        #body
    ]
}

#let statement(body, name: "") = {
    box(
        width: 100%,
        stroke: (
            paint: blue,
            thickness: 0.5pt,
        ),
        inset: 12pt,
        outset: 0pt,
        radius: 5pt,
        clip: true,
    )[
        #text(
            size: 11pt,
            weight: "bold",
        )[
            定理: #name
        ]

        #set text(
            size: 9pt,
        )
        #body
    ]
}

#let proof(body) = {
    box(
        width: 100%,
        stroke: (
            paint: red,
            thickness: 0.5pt,
        ),
        inset: 12pt,
        outset: 0pt,
        radius: 5pt,
        clip: true,
    )[
        #text(
            size: 11pt,
            weight: "bold",
        )[
            证明:
        ]

        #set text(
            size: 9pt,
        )
        #body
    ]
}

#let homework(body) = {
    box(
        width: 100%,
        stroke: (
            paint: red,
            thickness: 0.5pt,
        ),
        inset: 12pt,
        outset: 0pt,
        radius: 5pt,
        clip: true,
    )[
        #text(
            size: 11pt,
            weight: "bold",
        )[
            请证明/思考:
        ]

        #set text(
            size: 9pt,
        )
        #body
    ]
}

#align(center, text(17pt)[
    2023 Fall 数学分析 B1
])

= 课程信息

== 授课教师

屠彩凤老师

- *地址*:管科楼1309
- *邮箱*:`tucf@ustc.edu.cn`

== 推荐教材

- 数学分析讲义 程艺 陈卿 李平
- 数学分析教程 常庚哲 史济怀
- 数学分析 卓里奇

== 助教

- 马天开
- 杨锴闻
- 曲司成

== 成绩评定

待定.

== 作业要求

每周一交,无特殊情况不扣分. ddl每周五3,4节课之间(即每周五上午10:35之前),可以迟交但会扣一定量分数.

== 作业分组

待定.

== 习题课,答疑课

- *时间*:每周周日晚19:00开始,约一个半小时(可提前离开)
- *地点*:`2321`

== 关于这份文档

会简要记录课程内容,但不建议替代自己的笔记,可以用作复习参考.

部分扩展内容超出课程要求,不需掌握,甚至扩展的部分引理不能直接在考试中"不加说明地使用",复习时请留意.


#pagebreak()




= Lecture 1

```plain
Time: Week 1, 9.11 Mon
Author: TianKai Ma
```

== 补充知识

补充一些这门课可能用的记号和它们的`LaTeX`代码作为参考.

#grid(
  columns: (1fr, 1fr),

table(
    columns: (auto, auto, auto),
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
    $subset.neq$,[真子集],`\subseteq`,

    $union$,[并集],`\cup`,
    $sect$,[交集],`\cap`,
    $without$,[差集],`\setminus`,
    $union.plus$,[并集(不相交)],`\dot{\cup}`,

    $in$,[属于],`\in`,
    $in.not$,[不属于],`\notin`,
),
table(
    columns: (auto, auto, auto),
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

掌握这些符号后,请在证明中减少不必要的语言描述,直接使用符号表达即可. 如果符号难以说明的,还请语言表述.

== 数域扩张

$
    NN -> ZZ -> QQ -> RR -> CC
$

=== $NN$
$NN$的定义依赖Peano公理,移步 $=>$ @peano

=== $ZZ$

#definintion[
    $
    ZZ := {0} union NN^+ union (-NN^+) \
    -NN^+ := {-n | n in NN^+}
    $
]

=== $QQ$

#definintion[
    $
    QQ := {a/b | a,b in ZZ, b !=0}
    $
]

$QQ$是可数集,移步 $=>$ @QQ.countable

=== $RR$

#homework[
    $sqrt(2)$是无理数
]

常用的构造$RR$的方法有:

- 10-进制小数
- Dedekind 分割
- Cauchy 列


==== Dedekind分割

这样构造核心是"分割"$QQ$, 将其分割为$A, B$,满足:

- $Q = A union B$
- $A sect B = emptyset$ (这点可忽略,直接要求第三条)
- $forall a in A, forall b in B => a < b$

请注意,Dedekind分割并不需要在无理数($RR without QQ$)处分割,分割出的也并不必然是无理数,课堂上似乎传递了这样的误解.

这样分割的结果会有如下三种可能:

- 在$QQ$中$A$有最大数, $B$无最小数
- 在$QQ$中$A$无最大数, $B$有最小数,在前面这两种情况中,我们说这个分割定义了有理数.
- 在$QQ$中$A$无最大数, $B$无最小数,我们说这个分割定义了一个无理数$alpha$,向$A$或者$B$中任一添加这个$alpha$,都会让$QQ$更加"完备"

#homework[
    为什么没有第四种可能(在$QQ$中$A$有最大数, $B$有最小数)?
]

我们把所有有理数的分割的的集合称为实数集,记作$RR$.每个分割都对应一个实数.


==== Cauchy列

这点需要在后续引入极限后说明.


== 一些问题

=== 归纳法

```plain
Time: 2023.9.12
Author: Tiankai Ma
```

#statement[
    对于一个列命题${S_n}$(其中每个元素$S_i$都是一个命题),如果能说明:

    - $S_1$成立
    - $S_n => S_(n+1)$

    则可以说明$forall n, S_n$都成立.
]

有时这样的"命题列"会跟命题本身中的数列混淆,我们使用群里提出的一道题目来说明这个问题:

#homework[
    $a_1, a_2, ..., a_n (n>=2)$都是正数且$a_1 + a_2 + ... + a_n < 1$,求证:

    $
    product_(k=1)^n (1+a_k) > 1 + sum_(k=1)^n a_k
    $
]

一个很有价值的问题是,如果在这里使用归纳法,从$n$推向$n+1$时,是否还能说明$a_1 + ... a_(n+1)<1$?因为我们只知道前$n$项和小于$1$,但是不知道第$n+1$项的大小.

这里的问题就在于混淆了命题跟数列编号的问题,按照"命题列"的思路,我们来给出第$S_n$个命题的准确定义:

$
forall {a_k}_(k=1)^n quad sum_(k=1)^n a_k < 1 => product_(k=1)^n (1+a_k) > 1 + sum_(k=1)^n a_k
$

因为确实容易混乱,我们把$S_(n+1)$的定义也写出来:

$
forall {a_k}_(k=1)^(n+1) quad sum_(k=1)^(n+1) a_k < 1 => product_(k=1)^(n+1) (1+a_k) > 1 + sum_(k=1)^(n+1) a_k
$

在$S_(n+1)$的命题中,一般情况下并不能自然的得到前$n$项直接套用$S_n$中的结论,只不过:

$
a_1 +... + a_n < a_1 + ... +a_n + a_(n+1) < 1
$

进而这里的前${a_k}_(k=1)^n$(前$n$项)自然符合$S_n$中的${a_n}$的要求,进而可以使用$S_n$的结论.事实上甚至可以对后$n$项使用$S_n$的结论(可以试试).


#pagebreak()






= 扩展内容

#text(fill: blue)[标蓝]_的内容选读,无需掌握_

=== $NN$的定义,Peano公理 <peano>

在提出$NN$的定义这个问题之前,似乎没人想过去关心自然数怎样"定义",`1+1=2`的不证自明似乎很显然.出于公理化的考量,我们也需要对自然数进行公理化的定义.


#definintion(name: "Peano公理")[
    *Peano公理* 提出了基于下面五条的公理体系:

    - $0 in NN$
    - $forall a in NN, exists ! a^' in NN$,对于每个确定的$a$,在$NN$中总能找到唯一的$a^'$,称为$a$的后继.
    - $forall b, c in NN, b=c <=> b^' = c^'$, 也就是说,如果两个数的后继相等,当且仅当这两个数也相等.
    - $forall n in NN, n^' != 0$,也就是说,任意一个数的后继不是$0$.
    - $forall {S_n}$,其中$S_n$均为命题,如果$S_0$成立,且$S_n => S_(n^')$,则命题对所有自然数均成立,也就是说$forall n, S_n$都是成立的.

    #text(fill: blue)[
    更深入了解 $=>$

    - 数域$FF$上的加法,乘法
    - 有序集,有序域
    ]
]

=== $QQ$可数 <QQ.countable>

在分析中我们会经常无穷集合,透过一些性质,我们认为他们的"大小"不完全相同.

但不同于有限集合,无穷集合无法直接通过比较元素"个数"来比较大小,无穷集合的大小需要通过映射进行比较,来定义"基数".

#definintion(name: "无穷集合的基数")[
    无穷集合的基数并不是元素的个数,但确实是有限集合中"个数"概念的推广.

    我们通过两个集合$A,B$之间的关系来定义基数:

    1. 如果$exists f: A->B$是一一映射(双射),则称$A$和$B$的基数相同,记作$abs(A)=abs(B)$.
    2. 如果$forall f: A->B$总不存在一一映射,但$exists f: A -> C subset.neq B$(存在一个到$B$真子集$C$的一一映射,与这个子集$C$有相同的基数),则称$A$的基数小于$B$的基数,记作$abs(A)<abs(B)$.

    因为这是门分析的课,我们补充说明"基数相同"是"良定义"的,意味着这样定义有着良好的性质:

    - 自反性: $abs(A)=abs(A)$
    - 对称性: $abs(A)=abs(B) <=> abs(B)=abs(A)$
    - 传递性: $abs(A)=abs(B), abs(B)=abs(C) => abs(A)=abs(C)$

    在后续的课程中,满足这样性质的关系称为"等价关系",这里不做过多解释.
]

#definintion(name: "可数")[
    特别的,如果一个集合$A$与自然数集$NN$存在相同的基数,即存在$f: A -> NN, a|-> n$是双射,我们称这个集合是可数的.
]

我们通过下面几个例子来说明可数的概念.

#statement[
    $ZZ$是可数的.
]
#proof[
    证明可数的方式,一般是考虑构造定义中的双射,在这里需要构造:
    $
    f: & ZZ -> NN\
    & z |-> n
    $

    首先考虑
    $
    f = abs(z)
    $

    但这里$f$不是双射,例如$-1$和$1$都被映射到了$1$.

    只需做一点缩放,对负数的部分做一些调整,就可以得到这样的双射:

    $
    f = cases(
        abs(z) * 2   &z >= 0\
        abs(z) * 2 - 1 quad &z < 0
    )
    $

    容易说明$f$是双射,因此$ZZ$是可数的.
]

#statement[
    $QQ$是可数的.
]

#proof[
    回忆课上的对角线的图示,那个方法足够直观,我们来完善这个证明:

    考虑$QQ$的定义:

    $ QQ := {p/q | p,q in NN, q !=0} $

    我们可以按照$n = abs(p) + abs(q)$对$QQ$进行一次分类:

    - $n=0, Q_0 = emptyset$
    - $n=1, Q_1 = {0}$
    - $n=2, Q_2 = {1/1, -1/1}$
    - $n=3, Q_3 = {1/2, -1/2, 2/1, -2/1}$
    - $n=4, Q_4 = {1/3, -1/3, 2/2, -2/2, 3/1, -3/1}$
    - $dots.c$

    把这些数组"展平"成一维数组,我们可以得到:

    $
    QQ &= Q_0 union Q_1 union Q_2 union Q_3 union Q_4 union dots.c \

        &= {0, 1/1, -1/1, 1/2, -1/2, 2/1, -2/1, 1/3, -1/3, 2/2, -2/2, 3/1, -3/1, dots.c}
    $

    依照这样的办法$QQ = {q_n}$,自然形成了一个双射:$n |-> q_n$,因此$QQ$是可数的.

    这里用数列表示的方式说明可数,也对应着可数的另一个翻译:可列

    #text(fill: red)[
        在部分教材中会区分这两个概念:认为可数是指"有限或可列",而可列是指一定是无穷多的.

        事实上这两个名字都是从 countable 翻译而来的,一般来说都不会指有限集合,需要包含有限集合时会使用"至多可数"的概念.
    ]
]