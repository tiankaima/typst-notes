#import "@preview/diagraph:0.2.1": *
#import "utils.typ": *

== HW7 (Week 8)
Due: 2024.04.28

=== Question 21.1-1

Let $(u,v)$ be a minimum-weight edge in a connected graph $G$. Show that $(u,v)$ belongs to some minimum spanning tree of $G$.

#[
  #set text(fill: black)
  #align(center)[
    #scale(55%, reflow: true)[
      #raw-render(```dot
        digraph MSTModification {
          layout=neato
          subgraph cluster_0 {
              node [shape=circle, style=filled, color=lightgrey];
              style = invis;

              A1 -> B1 [label="2", dir="none"];
              B1 -> C1 [label="3", dir="none"];
              C1 -> D1 [label="6", dir="none"];
              D1 -> E1 [label="4", dir="none"];
              E1 -> F1 [label="5", dir="none"];
              F1 -> A1 [label="1", dir="none"]; // Minimum weight edge
          }
          subgraph cluster_1 {
              style = invis;
              node [shape=circle, style=filled, color=lightgrey];

              A2 -> B2 [label="2", dir="none"];
              B2 -> C2 [label="3", dir="none"];
              C2 -> D2 [label="6", dir="none"];
              D2 -> E2 [label="4", dir="none"];
              E2 -> F2 [label="5", dir="none"];
              F2 -> A2 [style=dotted, color=red, label="Removed", dir="none"];
          }
          subgraph cluster_2 {
              style = invis;
              node [shape=circle, style=filled, color=lightgrey];

              A3 -> B3 [label="2", dir="none"];
              B3 -> C3 [label="3", dir="none"];
              D3 -> E3 [label="4", dir="none"];
              E3 -> F3 [label="5", dir="none"];
              F3 -> A3 [label="1", dir="none"];
              C3 -> D3 [style=dotted, color=red, label="Removed", dir="none"];
          }
      }
      ```)
    ]
  ]
]

#ans[
  Let $T$ be a minimum spanning tree of $G$. If $(u,v)$ is not in $T$, then $T union \{(u,v)\}$ contains a cycle $C$. Since $(u,v)$ is the minimum-weight edge in $G$ that crosses the cut $(V(T), V - V(T))$, we can replace an edge in $C$ with $(u,v)$ to get a spanning tree $T'$ with $w(T') < w(T)$, which contradicts the assumption that $T$ is a minimum spanning tree.
]

=== Question 21.2-1

Kruskal's algorithm can return different spanning trees for the same input graph $G$, depending on how it breaks ties when the edges are sorted into order. *Show that for each minimum spanning tree $T$ of $G$, there is a way to sort the edges of $G$ in Kruskal's algorithm so that the algorithm returns $T$.*

#rev1_note[
  排序时引入第二关键字, 标记是否为想要的边. 令树边优先于非树边即可.
]

#ans[
  Let $T$ be a minimum spanning tree of $G$. We sort the edges of $G$ in nondecreasing order of their weights. If there are ties, we break them arbitrarily. Since $T$ is a minimum spanning tree, the edges of $T$ are sorted before the edges not in $T$. Therefore, Kruskal's algorithm will add the edges of $T$ to the tree before adding any other edges, and the result will be $T$.
]

=== Question 21.2-4

Suppose that all edge weights in a grpah are integers in the range from $1$ to $abs(V)$. How fast can you make Kruskal's algorithm run? What if the edge weights are integers in the range from 1 to $W$ for some constant $W$?

#ans[
  - If the edge weights are integers in the range from $1$ to $abs(V)$, we can use counting sort to sort the edges in $O(E)$ time.
  - If the edge weights are integers in the range from $1$ to $W$, we can use radix sort to sort the edges in $O(E \lg W)$ time.
]
