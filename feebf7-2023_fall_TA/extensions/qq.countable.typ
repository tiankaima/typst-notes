#import "../utils.typ": *

=== $QQ$可数 <QQ.countable>

在分析中我们会经常无穷集合,透过一些性质,我们认为他们的"大小"不完全相同.

但不同于有限集合,无穷集合无法直接通过比较元素"个数"来比较大小,无穷集合的大小需要通过映射进行比较,来定义「基数」.

#definintion(name: "无穷集合的基数")[
  无穷集合的基数并不是元素的个数,但确实是有限集合中"个数"概念的推广.

  我们通过两个集合$A,B$之间的关系来定义基数:

  1. 如果$exists f: A->B$是一一映射(双射),则称$A$和$B$的基数相同,记作$abs(A)=abs(B)$.
  2. 如果$forall f: A->B$总不存在一一映射,但$exists f: A -> C subset.neq B$(存在一个到$B$真子集$C$的一一映射,与这个子集$C$有相同的基数),则称$A$的基数小于$B$的基数,记作$abs(A)<abs(B)$.

  因为这是门分析的课,我们补充说明「基数相同」是"良定义"的,意味着这样定义有着良好的性质:

  - 自反性: $abs(A)=abs(A)$
  - 对称性: $abs(A)=abs(B) <=> abs(B)=abs(A)$
  - 传递性: $abs(A)=abs(B), abs(B)=abs(C) => abs(A)=abs(C)$

  在后续的课程中,满足这样性质的关系称为「等价关系」,这里不做过多解释.
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

  $ QQ := {p / q | p,q in NN, q !=0} $

  我们可以按照$n = abs(p) + abs(q)$对$QQ$进行一次分类:

  - $n=0, Q_0 = emptyset$
  - $n=1, Q_1 = {0}$
  - $n=2, Q_2 = {1 / 1, -1 / 1}$
  - $n=3, Q_3 = {1 / 2, -1 / 2, 2 / 1, -2 / 1}$
  - $n=4, Q_4 = {1 / 3, -1 / 3, 2 / 2, -2 / 2, 3 / 1, -3 / 1}$
  - $dots.c$

  把这些数组"展平"成一维数组,我们可以得到:

  $
  QQ &= Q_0 union Q_1 union Q_2 union Q_3 union Q_4 union dots.c \
  &= {0, 1 / 1, -1 / 1, 1 / 2, -1 / 2, 2 / 1, -2 / 1, 1 / 3, -1 / 3, 2 / 2, -2 / 2, 3 / 1, -3 / 1, dots.c}
  $

  依照这样的办法$QQ = {q_n}$,自然形成了一个双射:$n |-> q_n$,因此$QQ$是可数的.

  这里用数列表示的方式说明可数,也对应着可数的另一个翻译:可列

  #text(fill: red)[
    在部分教材中会区分这两个概念:认为可数是指「有限或可列」,而可列是指一定是无穷多的.

    事实上这两个名字都是从 countable 翻译而来的,一般来说都不会指有限集合,需要包含有限集合时会使用「至多可数」的概念.
  ]
]

#homework[
  通过十进制小数证明$RR$是不可数的
]

#pagebreak()