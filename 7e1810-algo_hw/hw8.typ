#import "utils.typ": *

== HW8 (Week 9)
Due: 2024.05.05

=== Exerciese 1
Proof that Bellman-Ford maximizes $x_1+x_2+dots.c+x_n$ subject to the constraints $x_j - x_i <= w_(i j)$ for all edges $(i,j)$ and $x <= 0$, and also minmizes $max_i {x_i}-min_i {x_i}$.

#ans[
  #rect(stroke: blue + 0.05em, inset: 1em)[
    Consider turning the problem into a single-source shortest path problem by doing the following transformation:

    - For each $x_j - x_i <= w_(i j)$ constraint, we think of it as an edge $(i,j)$ with weight $w_(i j)$. (note it's directed from $i$ to $j$)

    Then we add a new vertex $s$ and connect it to all other vertices with weight $0$. We then run Bellman-Ford algorithm on this graph to find the longest path. We fix $x_i = "dist"[i]$ as the solution.
  ]

  It's trivial to see why $x_1+x_2+dots.c+x_n$ being the longest path is equivalent to $x_1+x_2+dots.c+x_n$ being maximized.

  The constraint are met since, for each $x_j - x_i <= w_(i j)$, we have $"dist"[j] <= "dist"[i] + w_(i j)$, which is equivalent to $x_j - x_i <= w_(i j)$.

  To see why this also minmizes $max_i {x_i}-min_i {x_i}$, we can see that the longest path is the one that maximizes the difference between the maximum and minimum values. (Suppose there exists another set of solutions that has a larger difference, say $max_i {x_i '} - min_i {x_i '}$, the constraint between the two sets of solutions would be violated, since the longest path is the one that maximizes the difference.)
]

=== Question 23.2-6

Show how to use the output of the Floyd-Warshall algorithm to detect presence of a negative-weight cycle.

#ans[
  If the output of the Floyd-Warshall algorithm contains a negative number on the diagonal, then there exists a negative-weight cycle in the graph. This is because the diagonal represents the shortest path from a vertex to itself, and if there exists a negative-weight cycle, then the shortest path from a vertex to itself would be negative infinity.
]

=== Question 23.3-4

Professor Greenstreet claims that there is a simpler way to reweight edges than the method used in Johnson's algorithm. Letting $w^*=min_((u,v)in E){w(u,v)}$, just define $hat(w) (u,v)=w(u,v)-w^*$ for all edges $(u,v)in E$. What is wrong with the professor's method of reweighting?

#ans[
  Might result in path with more edges longer than direct edge, which is not optimal.
]

=== Question 24.3-3

Let $G=(V,E)$ be a bipartite graph with vertex partition $V=L union R$, and let $G$ be its corresponding flow network. Give a good upper bound on the length of any augmenting path found in $G$ during the execution of FORD-FULKERSON.

#ans[
  $2min{abs(L),abs(R)}+1$
]