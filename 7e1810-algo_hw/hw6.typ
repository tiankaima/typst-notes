#import "@preview/cetz:0.2.2": *

== HW6 (Week 7)
Due: 2024.04.21

#let ans(it) = [
  #pad(1em)[
    #text(fill: blue)[
      #it
    ]
  ]
]

=== Question 20.1-3

The transpose of a directed graph $G=(V,E)$ is the graph $G^T = (V, E^T)$ where $ E^T = {(v,u) in V times V:(u,v) in E} $ That is, $G^T$ is $G$ with all its edges reversed. *Describe efficient algorithms for computing $G^T$ from $G$, for both the adjacency-list and adjacency-matrix representation of $G$, Analyze the running times of your algorithms.*

#ans[
  - adjacency-list:

  ```txt
  def MAKE_ADJACENCY_LIST_TRANSPOSE(G):
    GT = EMPTY_GRAPH()
    GT.V = G.V
    for uT in GT.V
      uT.adj = []
    for u in G.V
      for v in u.adj
        GT.v.adj.append(u)
  ```

  Time complexity: $O(abs(V)+abs(E))$

  - adjacency-matrix:

  Same as matrix transpose(flipping the matrix along the diagonal).

  Time complexity: $O(V^2)$. (with special design of matrix representation, sparse matrix: $O(abs(V)+abs(E))$, dense matrix: $O(V^2)$, lazy transpose: $O(1)$)
]

=== Question 20.1-8

Suppose that instead of a linked list, each array entry $"Adj"[u]$ is a hash table containing the vertices $v$ for which $(u,v) in E$, with collisions resolved by chaining.

Under the assumption of uniform independent hashing, if all edge lookups are equally likely,

- what is the expected time to determine whether an edge is in the graph?

  #text(fill: blue)[
    $O(1)$
  ]

- What disadvantages does this scheme have compared to the linked-list representation?

  #text(fill: blue)[
    Worst case time complexity is $O(V)$, while linked-list representation is $O(abs(u."adj"))$.
  ]

- Suggest an alternate data structure for each edge list that solves these problems. Does your alternative have disadvantages compared with the hash table?

  #text(fill: blue)[
    Use a balanced binary search tree to store the edge list.
    - Time complexity: $O(log(abs(u."adj")))$. (worst case time complexity)
    - Disadvantages: $O(log(abs(u."adj"))) > O(1)$. (worse average time complexity)
  ]

=== Question 20.2-6

Give an example of a directed graph $G=(V,E)$, a source vertex $s in V$, and a set of tree edges $E_pi subset.eq E$ such that for each vertex $v in V$, the unique simple path in the graph $(V, E_pi)$ from $s$ to $v$ is a shortest path in $G$, yet the set of edges $E_pi$ cannot be produced by running BFS on $G$, no matter how the vertices are ordered in each adjacency list.

#ans[
  Consider the following graph $G$:

  #let data = (
    [$1$],
    ([$2$], [$4$]),
    ([$3$], [$5$]),
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
        let (a, b) = ("tree.0-0", "tree.0-1-0")
        line((a, .6, b), (b, .6, a), mark: (end: ">"))
        let (a, b) = ("tree.0-1", "tree.0-0-0")
        line((a, .6, b), (b, .6, a), mark: (end: ">"))
      },
    )
  ]

  Only the following $(V, E_pi)$ could be generated:

  #align(center)[
    #table(
      columns: (auto, auto),
      stroke: (),
      [
        #let data = (
          [$1$],
          ([$2$], [$4$], [$5$]),
          ([$3$]),
        )

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
      ],
      [
        #let data = (
          [$1$],
          ([$3$], [$4$], [$5$]),
          ([$2$]),
        )

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
      ],
    )
  ]

  but not the following:

  #let data = (
    [$1$],
    ([$2$], [$4$]),
    ([$3$], [$5$]),
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
  which is trivially the shortest path.
]

=== Question 20.4-5

Another way to topologically sort a directed acyclic graph $G=(V,E)$ is to repeatedly find a vertex of in-degree $0$, output it, and remove it and all of its outgoing edges from the graph. *Explain how to implement this idea so that is runs in time $O(V + E)$. What happens to this algorithm if $G$ has cycles?*

#ans[
  - Implementation:

  ```txt
  def TOPOLOGICAL_SORT(G):
    for u in G.V
      u.indegree = 0
    for u in G.V
      for v in u.adj
        v.indegree += 1
    Q = []
    for u in G.V
      if u.indegree == 0
        Q.append(u)
    while Q
      u = Q.pop()
      print(u)
      for v in u.adj
        v.indegree -= 1
        if v.indegree == 0
          Q.append(v)
  ```

  Time complexity: $O(V+E)$

  - If $G$ has cycles:

  The algorithm will not terminate, since there is no vertex of in-degree $0$.
]

=== Question 20.5-4

Prove that for any directed graph $G$, the transpose of the component graph $G^T$ is the same as the component graph of $G$. That is $((G^T)^(S C C))^T = G^(S C C)$

#ans[
  Let $C$ be a component of $G$.

  - If $C$ is a single vertex, then $C$ is also a component of $G^T$.

  - If $C$ is a strongly connected component, then $C$ is also a strongly connected component of $G^T$.
    - Vertex sets of $((G^T)^(S C C))^T$ and $G^(S C C)$ are the same.
    - To show edge sets are the same:

    For all $(v_i, v_j) in E_(((G^T)^(S C C))^T)$, $(v_j, v_i)$ is an edge in $(G^T)^(S C C)$, then there's $x in C_j, y in C_i$, $(x,y) in E_(G^T)$, $(y,x)$ is an edge of $G$ $=>$ $(v_i, v_j)$ is an edge in $G^(S C C)$.

    Discussing the other direction is similar, thus $((G^T)^(S C C))^T = G^(S C C)$.
]