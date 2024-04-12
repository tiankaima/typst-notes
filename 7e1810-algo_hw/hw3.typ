== HW 3 (Week 4)
Due: 2024.03.31
== Question 12.2-3
Write the `TREE-PREDECESSOR` procedure(which is symmetric to `TREE-SUCCESSOR`).

#text(fill: blue)[
  === Solution 12.2-3

  ```txt
  TREE-PREDECESSOR(x)
      if x.left != nil
          return TREE-MAXIMUM(x.left)
      y = x.p
      while y != nil and x == y.left
          x = y
          y = y.p
      return y
  ```
]

== Question 13.1-5
Show that the longest simple path from a node $x$ in red-black tree to a descendant leaf at most twice that of the shortest simple path from node $x$ to a descendant leaf.

#text(fill: blue)[
  === Solution 13.1-5

  Consider the longest simple path $(a_1, ... ,a_s)$ & the shortest simple path $(b_1, ... ,b_t)$, they have equal number of black nodes (Property 5).
  Neither of the paths can have repeated red node (Property 4).
  Thus at most $floor((s - 1) / 2)$ of the nodes in the longest path are red, so $ t >= ceil((s+1)/2) $ If by way of contradiction, we had $s > t dot 2$, then $ t >= ceil((s+1) / 2) >= ceil(t+1) = t+1 $ which is a contradiction.
]

== Question 17.1-7
Show how to use an order-statistic tree to count the number of inversions in an array of $n$ distinct elements in $O(n lg n)$ time.

#text(fill: blue)[
  === Solution 17.1-7

  $O(n lg(n))$ time is required to build a red-black treem so everytime we insert a node, we can calculate the number of inversion using $"OS-RANK"$ (which is the rank of the node, thus calculating inversions).
]

== Question 17.3-2
Describe an efficient algorithm that, given an interval $i$, returns an interval overlapping $i$ that has the minimum low endpoint, or $T."nil"$ if no such interval exists.

#text(fill: blue)[
  === Solution 17.3-2

  Modify the usual interval search not to break out the loop when a overlap is found, but to keep track of the minimum low endpoint. Return the interval with the minimum low endpoint if found, otherwise return $T."nil"$.
]