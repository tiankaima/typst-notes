#import "@preview/cetz:0.2.2": canvas, draw, tree
#set text(
    font: "Source Han Serif SC",
    size: 10pt,
)

= USTC/AI2024 人工智能基础 书面作业

PB21000030 马天开

== HW 2
Due 2024.03.24
=== Question 4.1

4.1 追踪 $A^*$ 搜索算法用直线距离启发式求解从 Lugoj 到 Bucharest 问题的过程. 按照顺序列出算法扩展的节点和每个节点的 $f, g, h$ 值

#set text(fill: blue)
=== Solution 3.7

#let data_41 = (
  [Luogoj(244, 0, 244)], ([Timisora(440, 111, 329)]), ([Mehadia(316, 75, 241)], [Luogoj(384, 140, 244)], ([Dobreta(387, 145, 242)], ([Craiova(425, 265, 160)], [Rimnicu Vilcea(604, 411, 193)], ([Pitesti(501, 403, 98)], [Rimmiai Vileea\
  (693, 500, 193)], [Bucharest\
  (504, 504, 0)]))))
)

#canvas(length: 1cm, {
  import draw: *

  set-style(content: (padding: .2),
    fill: gray.lighten(70%),
    stroke: gray.lighten(70%))

  tree.tree(data_41, spread: 3., grow: 1.5, draw-node: (node, ..) => {
    content((), node.content)
  }, draw-edge: (from, to, ..) => {
    line((a: from, number: .6, b: to),
         (a: to, number: .6, b: from), mark: (end: ">"))
  }, name: "tree")

  let ab = (
    ("tree.0", "tree.0-1",),
    ("tree.0-1", "tree.0-1-1",),
    ("tree.0-1-1", "tree.0-1-1-0",),
    ("tree.0-1-1-0", "tree.0-1-1-0-1",),
    ("tree.0-1-1-0-1", "tree.0-1-1-0-1-1",),
  )
  for _ab in ab {
    let (a, b) = _ab
    line((a, .6, b), (b, .6, a), mark: (end: ">"), stroke: red)
  }
})
上方标红的路径即为 $A^*$ 搜索算法的最优路径, 从 Lugoj 到 Bucharest.

#set text(fill: black)

=== Question 4.2

4.2 启发式路径算法是一个最佳有限搜索, 它的目标函数是 $f(n) = (2-omega) g(n) + w h(n)$. 算法中$w$取什么值保证算法是最优的? 当$w=0$时, 这个算法是什么搜索? $w=1$呢? $w=2$呢?

#set text(fill: blue)
=== Solution 4.2

- $w=0 => f(n) = 2g(n)$ 此时算法与 UCS 算法相同, 选择最小的 $g(n)$
- $w=1 => f(n) = g(n) + h(n)$ 此时算法与 $A^*$ 算法相同, 选择最小的 $f(n)$
- $w=2 => f(n) = 2h(n)$ 此时算法与 Greedy 算法相同, 选择最小的 $h(n)$

考虑到 $ f(n) = (2-omega)[g(n) + omega/(2-omega) h(n)] $
这与以 $ h_1(n) = omega/(2-omega)h(n) $ 作为启发式函数的 $A^*$ 算法相同.

当 $omega<1$ 时, $h_1(n)<h(n)$. 当且仅当 $omega=1$ 时, $h_1(n)=h(n)$, 此时算法是最优的.

#set text(fill: black)

=== Question 4.6

4.6 设计一个启发函数, 使它在八数码游戏中有时会估计过高, 并说明它在什么样的特殊问题下会导致次最优解.(可以借助计算机的帮助)
证明: 如果 $h$ 被高估的部分从来不超过 $c$, $A^*$ 算法返回的解的耗散多出的部分也不超过 $c$.

#set text(fill: blue)
=== Solution 4.6

- *设计一个启发函数, 使它在八数码游戏中有时会估计过高, 并说明它在什么样的特殊问题下会导致次最优解.*

#image("./img/Solution_4.6.jpg")


- *证明: 如果 $h$ 被高估的部分从来不超过 $c$, $A^*$ 算法返回的解的耗散多出的部分也不超过 $c$.*

考虑 $h(n)<=h^*(n)+c$, 并且令$G^'$为耗散超过$c$的解 ($g(G^') > C^* + c$). 考虑在到达次优解的路径上所有节点$n$:

$
f(n) = g(n) + h(n) <= g(n) + h^*(n) + c <= C^* + c <= g(G_2)
$

这样 $A^*$ 算法返回的解的耗散多出的部分也不超过 $c$.

#set text(fill: black)


=== Question 4.7

4.7 证明如果一个启发式是一致的, 它肯定是可采纳的. 构造一个非一致的可采纳启发式.

#set text(fill: blue)
=== Solution 4.7

- 一致: $h(n) <= c(n, a, n') + h(n')$
- 可采纳: $h(n) <= h^*(n)$

一致 $=>$ 可采纳性: 按归纳法, $k=1$ 时, 取 $n^'$为目标节点, $h(n) <= c(n, a, n')$; 假设 $k$ 时成立, 则 $h(n) <= c(n, a, n') + h(n') <= c(n, a, n') + h^*(n') = h^*(n)$, 所以距离 $k+1$ 步远的节点上 $h(n)$ 也是可采纳的.

构造一个非一致的可采纳启发式: $h(n) = 0$, 显然可采纳, 但不一致.


#set text(fill: black)









#pagebreak()

== HW 1
Due: 2024.03.17
=== Question 3.7

3.7 给出下列问题的初始状态、目标测试、后继函数和耗散函数。选择精确得足以实现的形式化。

- a. 只用四种颜色对平面地图染色,要求每两个相邻的地区不能染成相同的颜色。
- b. 一间屋子里有一只3英尺高的猴子，屋子的房顶上挂着一串香蕉,离地面8英尺。屋子里有两个可叠放起来、可移动、可攀登的3英尺高的箱子。猴子很想得到香蕉。
- c. 有一个程序，当送入一个特定文件的输入记录时会输出“不合法的输入记录”。已知每个记录的处理独立于其它记录。要求找出哪个记录不合法。
- d. 有三个水壶，容量分别为12加仑、8加仑和3加仑,还有一个水龙头。可以把壶装满或者倒空，从一个壶倒进另一个壶或者倒在地上。要求量出刚好1加仑水。

#set text(fill: blue)
=== Solution 3.7

- a:
  - Initial State: 所有区域未染色
  - Goal Test: 所有区域都染色
  - Successor Function: 选择一个未染色的区域，为其染上一种颜色
  - Cost Function: 涂色的次数
- b:
  - Initial State: 猴子在屋子的地面，箱子在屋子的地面，香蕉距离地面8英尺
  - Goal Test: 猴子站在箱子上，可以够到香蕉
  - Successor Function: 猴子搬动、放下箱子、爬上箱子、爬下箱子、拿起香蕉
  - Cost Function: 猴子总用时
- c:
  - Initial State: 一个输入记录
  - Goal Test: 输入记录合法
  - Successor Function: 修改输入记录的某一部分
  - Cost Function: 修改的次数
- d:
  - Initial State: 三个水壶都是空的
  - Goal Test: 一个水壶里有1加仑水
  - Successor Function: 装满水壶、倒空水壶、从一个壶倒进另一个壶
  - Cost Function: 倒水的次数

#set text(fill: black)

== Question 3.9

3.9 传教士和野人问题通常描述如下：三个传教士和三个野人在河的一边，还有一条能载一个人或者两个人的船。找到一个办法让所有的人都渡到河的另一岸，要求在任何地方野人数都不能多于传教士的人数(可以只有野人没有传教士)。这个问题在AI领域中很著名,因为它是第一篇从分析的观点探讨问题形式化的论文的主题（Amarel, 1968）

- a. 精确地形式化该问题，只描述确保该问题有解所必需的特性。画出该问题的完全状态空间图。
- b. 用一个合适的搜索算法实现和最优地求解该问题。检查重复状态是个好主意吗?
- c. 这个问题的状态空间如此简单，你认为为什么人们求解它却很困难?

#set text(fill: blue)
=== Solution 3.9

==== a:

- 状态: $(a,b,c)$, $a$:传教士在此岸的人数, $b$:野人在此岸的人数, $c$:船是否在此岸(0/1)
- Initial State: $(3,3,1)$
- Goal Test: $(0,0,0)$
- Successor Function:
$
(x,y,1) -> cases((x-1,y,0), (x,y-1,0), (x-1,y-1,0), (x-2,y,0), (x,y-2,0))
\
(x,y,0) -> cases((x+1,y,1), (x,y+1,1), (x+1,y+1,1), (x+2,y,1), (x,y+2,1))
$
同时所有$(x,y,c),(x',y',z')$满足$0<=x<=3, 0<=y<=3$, 并且:
$
(x=0 or x>=y) and (x=3 or x<=y)
$
- Cost Function: 操作次数

==== b:

使用 BFS 对状态进行搜索, 维护一个 $3 times 1$ 的数组记录已经访问过的状态:

$
(3,3,1) -> (3,1,0) -> (3,2,1) -> (3,0,0) -> (3,1,1) -> (1,1,0)\ -> (2,2,1) -> (0,2,0) -> (0,3,1) -> (0,1,0) -> (1,1,1) -> (0,0,0)
$

问题中限制很多, 可以不考虑重复状态(全部枚举即可). 如果问题中 $3 -> 100$, 检查重复状态是个好主意.

==== c:

虽然每一步的限制都足够多而且空间足够简单, 但图的深度很大, 每一步所需要做的判断过于复杂.

#set text(fill: black)
