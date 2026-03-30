#import "../utils.typ": *

#text(fill: blue)[
  === $NN$的定义,Peano公理 <peano>
]

在提出$NN$的定义这个问题之前,似乎没人想过去关心自然数怎样「定义」,`1+1=2`的不证自明似乎很显然.出于公理化的考量,我们也需要对自然数进行公理化的定义.

#definintion(name: "Peano公理")[
  *Peano公理* 提出了基于下面五条的公理体系:

  - $0 in NN$
  - $forall a in NN, exists ! a^' in NN$,对于每个确定的$a$,在$NN$中总能找到唯一的$a^'$,称为$a$的后继.
  - $forall b, c in NN, b=c <=> b^' = c^'$, 也就是说,如果两个数的后继相等,当且仅当这两个数也相等.
  - $forall n in NN, n^' != 0$,也就是说,任意一个数的后继不是$0$.
  - $forall {S_n}$,其中$S_n$均为命题,如果$S_0$成立,且$S_n => S_(n^')$,则命题对所有自然数均成立,也就是说$forall n, S_n$都是成立的.
]

#text(fill: blue)[
  更深入了解 $=>$

  - 数域$FF$上的加法,乘法
  - 有序集,有序域
]

#pagebreak()