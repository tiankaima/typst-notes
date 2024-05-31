#import "@preview/cetz:0.2.2": canvas, draw, tree

== HW 2
Due 2024.03.24

#let ans(it) = [
  #pad(1em)[
    #text(fill: blue)[
      #it
    ]
  ]
]

=== Question 4.1

4.1 追踪 $A^*$ 搜索算法用直线距离启发式求解从 Lugoj 到 Bucharest 问题的过程. 按照顺序列出算法扩展的节点和每个节点的 $f, g, h$ 值

#ans[
  #let data_41 = (
    [Luogoj(244, 0, 244)],
    ([Timisora(440, 111, 329)]),
    (
      [Mehadia(316, 75, 241)],
      [Luogoj(384, 140, 244)],
      (
        [Dobreta(387, 145, 242)],
        (
          [Craiova(425, 265, 160)],
          [Rimnicu Vilcea(604, 411, 193)],
          (
            [Pitesti(501, 403, 98)],
            [Rimmiai Vileea\
              (693, 500, 193)],
            [Bucharest\
              (504, 504, 0)],
          ),
        ),
      ),
    ),
  )

  #canvas(
    length: 1cm,
    {
      import draw: *

      set-style(
        content: (padding: .2),
        fill: gray.lighten(70%),
        stroke: gray.lighten(70%),
      )

      tree.tree(
        data_41,
        spread: 3.,
        grow: 1.5,
        draw-node: (node, ..) => {
          content((), node.content)
        },
        draw-edge: (from, to, ..) => {
          line(
            (a: from, number: .6, b: to),
            (a: to, number: .6, b: from),
            mark: (end: ">"),
          )
        },
        name: "tree",
      )

      let ab = (
        ("tree.0", "tree.0-1"),
        ("tree.0-1", "tree.0-1-1"),
        ("tree.0-1-1", "tree.0-1-1-0"),
        ("tree.0-1-1-0", "tree.0-1-1-0-1"),
        ("tree.0-1-1-0-1", "tree.0-1-1-0-1-1"),
      )
      for _ab in ab {
        let (a, b) = _ab
        line((a, .6, b), (b, .6, a), mark: (end: ">"), stroke: red)
      }
    },
  )
  上方标红的路径即为 $A^*$ 搜索算法的最优路径, 从 Lugoj 到 Bucharest.

]

=== Question 4.2

4.2 启发式路径算法是一个最佳有限搜索, 它的目标函数是 $f(n) = (2-omega) g(n) + w h(n)$. 算法中$w$取什么值保证算法是最优的？当$w=0$时, 这个算法是什么搜索？$w=1$呢？$w=2$呢？

#ans[
  - $w=0 => f(n) = 2g(n)$ 此时算法与 UCS 算法相同, 选择最小的 $g(n)$
  - $w=1 => f(n) = g(n) + h(n)$ 此时算法与 $A^*$ 算法相同, 选择最小的 $f(n)$
  - $w=2 => f(n) = 2h(n)$ 此时算法与 Greedy 算法相同, 选择最小的 $h(n)$

  考虑到 $ f(n) = (2-omega)[g(n) + omega/(2-omega) h(n)] $
  这与以 $ h_1(n) = omega/(2-omega)h(n) $ 作为启发式函数的 $A^*$ 算法相同.

  当 $omega<1$ 时, $h_1(n)<h(n)$. 当且仅当 $omega=1$ 时, $h_1(n)=h(n)$, 此时算法是最优的.

]

=== Question 4.6

4.6 设计一个启发函数, 使它在八数码游戏中有时会估计过高, 并说明它在什么样的特殊问题下会导致次最优解.(可以借助计算机的帮助)
证明：如果 $h$ 被高估的部分从来不超过 $c$, $A^*$ 算法返回的解的耗散多出的部分也不超过 $c$.

#ans[
  - *设计一个启发函数, 使它在八数码游戏中有时会估计过高, 并说明它在什么样的特殊问题下会导致次最优解. *

  #image("./imgs/Solution_4.6.jpg", width: 70%)

  - *证明：如果 $h$ 被高估的部分从来不超过 $c$, $A^*$ 算法返回的解的耗散多出的部分也不超过 $c$.*

  考虑 $h(n)<=h^*(n)+c$, 并且令$G^'$为耗散超过$c$的解 ($g(G^') > C^* + c$). 考虑在到达最优解的路径上所有节点$n$:

  $
    f(n) = g(n) + h(n) <= g(n) + h^*(n) + c = g(G) + h^*(G) + c = C^* + c <= g(G^')
  $

  在到达最优解之前不会到达 $G^'$, 这样 $A^*$ 算法返回的解的耗散多出的部分也不超过 $c$.

]

=== Question 4.7

4.7 证明如果一个启发式是一致的, 它肯定是可采纳的. 构造一个非一致的可采纳启发式.

#ans[
  - 一致：$h(n) <= c(n, a, n') + h(n')$
  - 可采纳：$h(n) <= h^*(n)$

  一致 $=>$ 可采纳性：按归纳法, $k=1$ 时, 取 $n^'$为目标节点, $h(n) <= c(n, a, n')$; 假设 $k$ 时成立, 则 $h(n) <= c(n, a, n') + h(n') <= c(n, a, n') + h^*(n') = h^*(n)$, 所以距离 $k+1$ 步远的节点上 $h(n)$ 也是可采纳的.

  构造一个非一致的可采纳启发式:

  #image("./imgs/Solution_4.7.jpg", width: 50%)

]