#import "@preview/cetz:0.2.2": canvas, draw, tree

== HW5 (Week 6)
Due: 2024.04.14

=== Question 14.5-2
Determine the cost and structure of an optimal binary serach tree for a set of $n=7$ keys with the following probabilities:

#align(center)[
  #table(
    stroke: none,
    columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto),
    table.header(
      [$i$],
      [$0$],
      [$1$],
      [$2$],
      [$3$],
      [$4$],
      [$5$],
      [$6$],
      [$7$],
    ),
    table.hline(start: 0, stroke: 0.5pt),
    [$p_i$],
    table.vline(start: 0, stroke: 0.5pt),
    [],
    [$0.04$],
    [$0.06$],
    [$0.08$],
    [$0.02$],
    [$0.10$],
    [$0.12$],
    [$0.14$],
    [$q_i$],
    [$0.06$],
    [$0.06$],
    [$0.06$],
    [$0.06$],
    [$0.05$],
    [$0.05$],
    [$0.05$],
    [$0.05$],
  )
]

#text(fill: blue)[
  === Solution 14.5-2

  Running the code provided in appendix, we get the following result (cost, preorder traversal of the optimal BST):
  ```text
  (3.17, [5, 2, 1, 3, 4, 7, 6])
  ```

  #let data = (
    [$5$],
    ([$2$], ([$1$], [$d_0$], [$d_1$]), ([$3$], [$d_2$], ([$4$], [$d_3$], [$d_4$]))),
    ([$7$], ([$6$], [$d_5$], [$d_6$]), ([$d_7$],)),
  )

  #align(center)[
    #canvas(
      length: 1cm,
      {
        import draw: *

        set-style(
          content: (padding: .2),
          fill: gray.lighten(80%),
          stroke: gray.lighten(70%),
        )

        tree.tree(
          data,
          spread: 1.5,
          grow: 1.4,
          draw-node: (node, ..) => {
            circle((), radius: .45, stroke: none)
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
      },
    )
  ]
]

=== Question 15.3-3

What is an optimal Huffman code for the following set of frequencies, based on the first 8 Fibonacci numbers?

#align(center)[
  #table(
    stroke: none,
    columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto),
    table.header(
      [$i$],
      [$0$],
      [$1$],
      [$2$],
      [$3$],
      [$4$],
      [$5$],
      [$6$],
      [$7$],
    ),
    table.hline(start: 0, stroke: 0.5pt),
    [$f_i$],
    table.vline(start: 0, stroke: 0.5pt),
    [$1$],
    [$1$],
    [$2$],
    [$3$],
    [$5$],
    [$8$],
    [$13$],
    [$21$],
  )
]

Can you generalize your answer to find the optimal code when the frequencies are the first $n$ Fibonacci numbers?

#text(fill: blue)[
  === Solution 15.3-3
  #align(center)[
    #table(
      stroke: none,
      columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto),
      table.header(
        [$i$],
        [$0$],
        [$1$],
        [$2$],
        [$3$],
        [$4$],
        [$5$],
        [$6$],
        [$7$],
      ),
      table.hline(start: 0, stroke: (paint: blue, thickness: 0.5pt)),
      [$f_i$],
      table.hline(start: 0, stroke: (paint: blue, thickness: 0.5pt)),
      table.vline(start: 0, stroke: (paint: blue, thickness: 0.5pt)),
      [$1$],
      [$1$],
      [$2$],
      [$3$],
      [$5$],
      [$8$],
      [$13$],
      [$21$],
      [$c_i$],
      [$1111111$],
      [$1111110$],
      [$111110$],
      [$11110$],
      [$1110$],
      [$110$],
      [$10$],
      [$0$],
    )
  ]

  The generalized answer: Huffman for the first $n$ Fibonacci numbers:
  - the code for $i>0$ is $underbrace(1 dots.c 1, n-i) 0$
  - the code for $i=0$ is $underbrace(1 dots.c 1, n)$.

  Proof is also trivial, let's discuss sums of Fibonacci first:

  $
  f_n = f_(n-1) + f_(n-2) => f_(n) = f_(n+2) - f_(n-1)\
  sum_(i=0)^n f_i = f_(n+2) - 1 => sum_(i=0)^n f_i < f_(n+2)
  $

  so after merging the first $k$ elements, we're left with $((sum_(i=0)^k f_i), f_(k+1), dots.c, f_n)$, amoung which $((sum_(i=k)^n f_i), f_(k+1))$ are the smallest two, so they should be merged first, and so on, using induction it's easy to prove Huffman generates such tree, thus giving the optimal code.
]

#v(1em)

=== Appendix
#box[
  ==== Code for Question 14.5-2 <code_14_5_2>
  ```py
  import numpy as np

  def resolve_pre_order(n, root, i, j):
      if i < 1 or i > n or j < 1 or j > n or i > j:
          return []
          return []
      if i == j:
          return [i]

      pre_order = []
      r = root[i - 1][j - 1]
      pre_order.append(r)
      tmp = resolve_pre_order(n, root, i, r - 1)
      pre_order.extend(tmp)
      tmp = resolve_pre_order(n, root, r + 1, j)
      pre_order.extend(tmp)
      return pre_order


  def optimal_bst(n, p, q):
      e = np.zeros((n + 2, n + 1))
      w = np.zeros((n + 2, n + 1))
      root = np.zeros((n, n), dtype=int)

      for i in range(1, n + 2):
          e[i][i - 1] = q[i - 1]
          w[i][i - 1] = q[i - 1]

      for l in range(1, n + 1):
          for i in range(1, n - l + 2):
              j = i + l - 1
              e[i][j] = float("inf")
              w[i][j] = w[i][j - 1] + p[j - 1] + q[j]
              for r in range(i, j + 1):
                  t = e[i][r - 1] + e[r + 1][j] + w[i][j]
                  if t < e[i][j]:
                      e[i][j] = t
                      root[i - 1][j - 1] = r

      return e[1][n], resolve_pre_order(n, root, 1, n)


  n = 7
  p = [0.04, 0.06, 0.08, 0.02, 0.10, 0.12, 0.14]
  q = [0.06, 0.06, 0.06, 0.06, 0.06, 0.05, 0.05, 0.05]

  result = optimal_bst(n, p, q)
  print(result)
  ```
]