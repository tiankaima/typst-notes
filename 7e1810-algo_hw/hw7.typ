== HW7 (Week 8)
Due: 2024.04.28

#let ans(it) = {
  box(inset: 1em, width: 100%)[
    #text(fill: blue)[
      #it
    ]
  ]
}

=== Question 21.1-1

Let $(u,v)$ be a minimum-weight edge in a connected graph $G$. Show that $(u,v)$ belongs to some minimum spanning tree of $G$.

#ans[
  Let $T$ be a minimum spanning tree of $G$. If $(u,v)$ is not in $T$, then $T union \{(u,v)\}$ contains a cycle $C$. Since $(u,v)$ is the minimum-weight edge in $G$ that crosses the cut $(V(T), V - V(T))$, we can replace an edge in $C$ with $(u,v)$ to get a spanning tree $T'$ with $w(T') < w(T)$, which contradicts the assumption that $T$ is a minimum spanning tree.
]

=== Question 21.2-1

Kruskal's algorithm can return different spanning trees for the same input graph $G$, depending on how it breaks ties when the edges are sorted into order. *Show that for each minimum spanning tree $T$ of $G$, there is a way to sort the edges of $G$ in Kruskal's algorithm so that the algorithm returns $T$.*

#ans[
  Let $T$ be a minimum spanning tree of $G$. We sort the edges of $G$ in nondecreasing order of their weights. If there are ties, we break them arbitrarily. Since $T$ is a minimum spanning tree, the edges of $T$ are sorted before the edges not in $T$. Therefore, Kruskal's algorithm will add the edges of $T$ to the tree before adding any other edges, and the result will be $T$.
]

=== Question 21.2-4

Suppose that all edge weights in a grpah are integers in the range from $1$ to $abs(V)$. How fast can you make Kruskal's algorithm run? What if the edge weights are integers in the range from 1 to $W$ for some constant $W$?

#ans[
  - If the edge weights are integers in the range from $1$ to $abs(V)$, we can use counting sort to sort the edges in $O(E)$ time.
  - If the edge weights are integers in the range from $1$ to $W$, we can use radix sort to sort the edges in $O(E \lg W)$ time.
]
