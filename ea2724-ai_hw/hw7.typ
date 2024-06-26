== HW7
Due 2024.05.12

#import "@preview/diagraph:0.2.1": *
#let ans(it) = [
  #pad(1em)[
    #text(fill: blue)[
      #it
    ]
  ]
]
#show math.equation: it => [
  #math.display(it)
]
#show image: it => align(center, it)

=== Question 13.15

在一年一度的体检之后，医生告诉你一些坏消息和一些好消息。坏消息是你在一种严重疾病的测试中结果呈阳性，而这个测试的准确度为 $99 percent$ (即当你确实患这种病时，测试结果为阳性的概率为 $0.99$；而当你未患这种疾病时测试结果为阴性的概率也是 $0.99$)。好消息是，这是一种罕见的病，在你这个年龄段大约 $10000$ 人中才有 $1$ 例。为什么“这种病很罕见”对于你而言是一个好消息？你确实患有这种病的概率是多少？

#ans[
  按照题目描述, 我们可以将所有可能的检测成果总结如下:

  #table(
    columns: (auto, auto, auto),
    fill: (x, y) => {
      if (x == 0 or y == 0) and not (x == 0 and y == 0) {
        blue.lighten(80%)
      }
      if (x == 0 and y == 0) {
        blue.lighten(60%)
      }
    },
    stroke: blue,
    align: center,
    [], [阳性], [阴性],
    [患病: $1\/10000$], [$1\/10000 times 99\/100$], [$1\/10000 times 1\/100$],
    [未患病: $9999\/10000$], [$9999\/10000 times 1\/100$], [$9999\/10000 times 99\/100$],
  )
  在已知我检测结果为阳性的情况下, 我确实患病的概率为:
  $
    (1\/10000 times 99\/100) / (1\/10000 times 99\/100 + 9999\/10000 times 1\/100) approx 0.0098 < 1%
  $

  如果这并不是罕见病, 例如每$100$人就有$1$人患病, 那么在阳性检测结果下我确实患病的概率将会是:
  $
    (1\/100 times 99\/100) / (1\/100 times 99\/100 + 99\/100 times 1\/100) = 0.5
  $

  从这个角度说, 这种病很罕见对于我而言是一个好消息.
]

=== Question 13.18

假设给你一只袋子，装有个无偏差的硬币，并且告诉你其中$n$个硬币是正常的，一面是正面而另一面是反面。不过剩余$1$枚硬币是伪造的，它的两面都是正面。

+ 假设你把手伸进口袋均匀随机地取出一枚硬币，把它抛出去，硬币落地后正面朝上。那么你取出伪币的（条件）概率是多少？
  #ans[
    $
      &P("fake") = 1 / n &quad& P("normal") = 1 - 1 / n&\
      &P("head"|"fake") = 1 &quad& P("head"|"normal") = 1 / 2&\
      &P("tail"|"fake") = 0 &quad& P("tail"|"normal") = 1 / 2&\
    $
    $
      => P("fake"|"head") = (P("head"|"fake")P("fake")) / P("head") = (1\/n) / (1\/n + (1-1\/n)\/2) = 2 / (n+1)
    $
  ]
+ 假设你不停地抛这枚硬币，一共抛了$k$次，而且看到$k$次正面向上。那么你取出伪币的条件概率是多少？

  #ans[
    $
      P("fake"|"head"^k) = (P("head"^k|"fake")P("fake")) / P("head"^k) = (1^k dot 1\/n) / (1^k dot 1\/n + (1-1\/n) dot (
        1\/2
      )^k) = (2^k) / (2^k+n-1)
    $
  ]
+ 假设你希望通过把取出的硬币抛$k$次的方法来确定它是不是伪造的。如果抛次后都是正面朝上，那么决策过程返回 fake(伪造)，否则返回 normal(正常)。这个过程发生错误的(无条件)概率是多少？
  #ans[
    $
      P("WA") = P("normal" and "head"^k) = (1-1 / n) dot (1 / 2)^k
    $
  ]

=== Question 13.21

(改编自Pearl (1988)的著述.) 假设你是雅典一次夜间出租车肇事逃逸的交通事的目击者。雅典所有的出租车都是蓝色或者绿色的。而你发誓所看见的肇事出租车是蓝色的。大量测试表明，在昏暗的灯光条件下，区分蓝色和绿色的可靠度为 $75 percent$。

+ 有可能据此计算出肇事出租车最可能是什么颜色吗？（提示:请仔细区分命题“肇事车是蓝色的”和命题“肇事车看起来是蓝色的”。）
  #ans[
    不能. 我们知道肇事车看起来的颜色, 但是不知道真实颜色的概率分布. 例如, 如果绿色出租车的数量远远多于蓝色出租车, 那么即使看起来是蓝色的车辆的概率也可能很高.(与上面罕见病的例子类似)
  ]
+ 如果你知道雅典的出租车 $10$ 辆中有 $9$ 辆是绿色的呢？
  #ans[
    也与上面罕见病类似, 我们整理出所有可能的情况如下:

    #table(
      columns: (auto, auto, auto),
      fill: (x, y) => {
        if (x == 0 or y == 0) and not (x == 0 and y == 0) {
          blue.lighten(80%)
        }
        if (x == 0 and y == 0) {
          blue.lighten(60%)
        }
      },
      stroke: blue,
      align: center,
      [], [看起来蓝色], [看起来绿色],
      [真实蓝色], [$1\/10 times 3\/4$], [$1\/10 times 1\/4$],
      [真实绿色], [$9\/10 times 1\/4$], [$9\/10 times 3\/4$],
    )

    因此在 「看起来是蓝色」的前提下, 真实是蓝色的概率为: $1\/4$, 真实是绿色的概率为 $3\/4$. 肇事车最可能是绿色的.
  ]

=== Question 13.22

文本分类是基于文本内容将给定的一个文档分类成固定的几个类中的一类。朴素贝叶斯模型经常用于这个问题。在朴素贝叶斯模型中，查询（query）变量是这个文档的类别，而结果（effect）变量是语言中每个单词的存在与否；假设文档中单词的出现是独立的，单词的出现频率由文档类别决定。

+ 给定一组已经被分类的文档，准确解释如何构造这样的模型。
  #ans[
    考虑一组已经分类的文档, $C = {C_i}$, 对于每个单词 $w_j$, 我们可以计算出在每个类别下的概率 $P(w_j|C_i)$.

    我们再计算每个类别的概率 $P(C_i)$, 以及每个单词的概率 $P(w_j)$.
  ]
+ 准确解释如何分类一个新文档。
  #ans[
    考虑一篇新文档含有单词 $w_1 ,dots.c, w_k$, 分别计算在各个分类下, 这些单词出现的概率:

    $
      P(C_i|w_1,dots,w_k) &= (P(w_1, dots.c, w_k) dot P(C_i)) / (P(w_1, dots.c, w_k))\
      &= (limits(product)_i P(w_j|C_i) dot P(C_i)) / (P(w_1, dots.c, w_k))
    $

    无需计算分母, 只需比较各个分类下的概率即可.
  ]
+ 题目中的条件独立性假设合理吗?请讨论。
  #ans[
    这个假设并不合理. 例如, 在一篇关于机器学习的文章中, 出现了 "机器" 这个词, 那么 "学习" 这个词出现的概率就会变得很大. 这两个词并不是独立的.
  ]

=== Question 14.12

两个来自世界上不同地方的宇航员同时用他们自己的望远镜观测了太空中某个小区域内恒星的数目 $N$。他们的测量结果分别为 $M_1$ 和 $M_2$。通常，测量中会有不超过 $1$ 颗恒星的误差，发生错误的概率 $e$ 很小。每台望远镜可能出现(出现的概率$f$ 更小一些)对焦不准确的情况(分别记作 $F_1$ 和 $F_2$)，在这种情况下科学家会少数三颗甚至更多的恒星(或者说，当 $N$ 小于 $3$ 时，连一颗恒星都观测不到)。考虑图14.22所示的三种贝叶斯网络结构。

#align(center)[
  #table(
    columns: (auto, auto, auto),
    stroke: none,
    column-gutter: 1em,
    [
      #raw-render(```dot
      digraph {
        rankdir=TD;
        node [shape=circle];
        F_1, F_2, M_1, M_2, N;
        F_1 -> M_1; F_2 -> M_2;
        M_1 -> N; M_2 -> N;
      }
      ```)
    ],
    [
      #raw-render(```dot
      digraph {
        rankdir=TD;
        node [shape=circle];
        F_1, F_2, M_1, M_2, N;
        F_1 -> M_1; F_2 -> M_2;
        N -> M_1; N -> M_2;
      }
      ```)
    ],
    [
      #raw-render(```dot
      digraph {
        layout=neato;
        rankdir=TD;
        node [shape=circle];
        F_1 [pos="0,0!"];
        F_2 [pos="1.5,0!"];
        M_1 [pos="0,2!"];
        M_2 [pos="1.5,2!"];
        N [pos="0.5,1"];
        M_1 -> F_1; M_1 -> M_2; M_1 -> N;
        N -> F_1; N -> F_2; M_2 -> N; M_2 -> F_2;
      }
      ```)
    ],

    [
      (i)
    ],
    [
      (ii)
    ],
    [
      (iii)
    ],
  )
]

+ 这三种网络结构哪些是对上述信息的正确(但不一定高效)表示？
  #ans[
    (ii), (iii) 正确;

    考虑到 $ P(N mid(|)M_1)!=P(N|M_1,F_1) $ 所以 $F_1$ 与 $M$ 应该同时连接到 $N$, (i) 不正确.
  ]
+ 哪一种网络结构是最好的？请解释。
  #ans[
    (ii), 关系少, 更紧致.
  ]
+ 当 $N in {1,2,3}, quad M_1 in {0,1,2,3,4}$时，请写出 $P(M_1 mid(|) N)$ 的条件概率表。概率分布表里的每个条目都应该表达为参数$e$和/或$f$的一个函数。
  #ans[

    $
      P(M_1 mid(|) N) &= P(M_1 mid(|) N, F_1) P(F_1 mid(|) N) + P(M_1 mid(N), not F_1) P(not F_1 mid(|) N)\
      &= P(M_1 mid(|) N, F_1) P(F_1) + P(M_1 mid(N), not F_1) P(not F_1)\
    $

    #table(
      columns: (auto, auto, auto, auto, auto, auto),
      align: center,
      fill: (x, y) => {
        if (x == 0 or y == 0) and not (x == 0 and y == 0) {
          blue.lighten(80%)
        }
        if (x == 0 and y == 0) {
          blue.lighten(90%)
        }
      },
      stroke: blue,
      [
        $P(M_1 mid(|) N)$
      ],
      [
        $M_1 = 0$
      ],
      [
        $M_1 = 1$
      ],
      [
        $M_1 = 2$
      ],
      [
        $M_1 = 3$
      ],
      [
        $M_1 = 4$
      ],

      [
        $N = 1$
      ],
      [
        $f+e(1-f)$
      ],
      [
        $(1-2e)(1-f)$
      ],
      [
        $e(1-f)$
      ],
      [
        #set text(fill: red)
        $0$
      ],
      [
        $0$
      ],

      [
        $N = 2$
      ],
      [
        $f$
      ],
      [
        #set text(fill: green)
        $e(1-f)$
      ],
      [
        $(1-2e)(1-f)$
      ],
      [
        #set text(fill: green)
        $e(1-f)$
      ],
      [
        $0$
      ],

      [
        $N = 3$
      ],
      [
        $f$
      ],
      [
        #set text(fill: red)
        $0$
      ],
      [
        $e(1-f)$
      ],
      [
        $(1-2e)(1-f)$
      ],
      [
        $e(1-f)$
      ],
    )
  ]
+ 假设 $M_1 = 1, quad M_2 = 3$。如果我们假设 $N$ 取值上没有先验概率约束,可能的恒星数目是多少？
  #ans[
    #table(
      columns: (auto, auto, auto, auto, auto, auto, auto),
      align: center,
      fill: (x, y) => {
        if (x == 0 or y == 0) and not (x == 0 and y == 0) {
          blue.lighten(80%)
        }
        if (x == 0 and y == 0) {
          blue.lighten(90%)
        }
      },
      stroke: blue,
      [
        $P(M_1 mid(|) N)$
      ],
      [
        $M_1 = 0$
      ],
      [
        $M_1 = 1$
      ],
      [
        $M_1 = 2$
      ],
      [
        $M_1 = 3$
      ],
      [
        $M_1 = 4$
      ],
      [
        $dots.c$
      ],

      [
        $N = 4$
      ],
      [
        $f$
      ],
      [
        #set text(fill: green)
        $f$
      ],
      [
        $0$
      ],
      [
        #set text(fill: green)
        $e(1-f)$
      ],
      [
        $(1-2e)(1-f)$
      ],
      [
        $dots.c$
      ],

      [
        $N=5$
      ],
      [
        $f$
      ],
      [
        $f$
      ],
      [
        $f$
      ],
      [
        #set text(fill: red)
        $0$
      ],
      [
        $e(1-f)$
      ],
      [
        $dots.c$
      ],
    )
    #let color_r(x) = text(fill: red, $#x$)
    $
      P(M = 3 mid(|) N = 0) = 0 &quad& => &quad& N!=0\
      P(M = 3 mid(|) N = 1) = 0 &quad& => &quad& N!=1\
      P(M = 1 mid(|) N = 3) = 0 &quad& => &quad& N!=3\
      P(M = 1 mid(|) N = 5) = 0 &quad& => &quad& N!=5\
    $

    $P(M = i mid(|) N = n) > 0 quad forall i = 1,3; n = 2,4$ 已经在表中标记出来了. (考虑到 $f approx 0$ 时=, 我们近似地认为每行加起来为 $1$. )

    考虑 $n >= 6$ 时, $P(M = 1 mid(|) N = n) = P(M = 3 mid(|) N = n) = f > 0$.

    因此可能的 $n$ 的取值为 $2,4$ 或 $n>=6$
  ]
+ 在这些观测结果下，最可能的恒星数目是多少？解释如何计算这个数目，或者，如果不可能计算，请解释还需要什么附加信息以及它将如何影响结果。
  #ans[
    缺少 $N$ 的先验概率分布, 无法计算最可能的恒星数目.

    考虑我们提供一个分布: $P(N=n) = p_n quad forall n = 2,4,6,7, dots$

    $
      &P(N=2, M_1 = 1, M_2 = 3) &=& p_2 e^2(1-f)^2\
      &P(N=4, M_1 = 1, M_2 = 3) &=& p_4 e f(1-f)^2\
      (n>=6) quad &P(N=n, M_1 = 1, M_2 = 3) &=& p_n f^2\
    $

    计算出并比较大小即可, 取 $n="argmax"_n P(N=n, M_1 = 1, M_2 = 3)$.
  ]

=== Question 14.13

考虑 图14.22(ii) 的网络,假设两个望远镜完全相同。$N in {1,2,3}$，$M_1, M_2 in {0,1,2,3,4}$，CPT表和习题14.12所描述的一样。使用枚举算法(图14.9)计算概率分布 $P(N mid(|) M_1=1,M_2 = 2)$。

#ans[
  $
    cal(P)(N mid(|) M_1=2, M_2=2) &= alpha sum_(f_1,f_2) cal(P)(f_1, f_2, N, M_1=2,M_2=2)\
    &=alpha sum_(f_1,f_2) P(f_1) P(f_2) cal(P)(N) P(M_1=2,M_2=2)
  $

  考虑到 $M_1=M_2=2$, 只有 $F_1=F_2="false"$ 时才能满足, 因此:

  $
    cal(P)(N mid(|) M_1=2, M_2=2) &= alpha (1-f)^2 angle.l p_1, p_2, p_3 angle.r angle.l e, (
      1-2e
    ), e angle.r angle.l e, (1-2e), e angle.r\
    &= alpha^' angle.l p_1 e^2, p_2(1-2e)^2, p_3 e^2 angle.r
  $
]