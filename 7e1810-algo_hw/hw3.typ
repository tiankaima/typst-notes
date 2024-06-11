#import "utils.typ": *

== HW 3 (Week 4)
Due: 2024.03.31

#rev1_note[
  + Review: 二叉树

    遍历方式: 先序遍历, 中序遍历, 后序遍历.

  + Review: 二叉搜索树

    - 二叉搜索树是一种二叉树, 其中每个节点 $x$ 都有一个关键字 $"key"[x]$ 以及一个指向 $x$ 的父节点的指针 $p[x]$, 以及指向左右孩子的指针 $"left"[x]$ 和 $"right"[x]$. 二叉搜索树性质:

      + 对于任意节点 $x$, 其左子树中的*所有*关键字的值都小于 $"key"[x]$.

      + 对于任意节点 $x$, 其右子树中的*所有*关键字的值都大于 $"key"[x]$.

    - 二叉搜索树的中序遍历是一个有序序列. 此外, 通过一颗二叉搜索树的先序/后序遍历结果, 可以反推出这颗树的结构. 但是通过中序遍历结果无法唯一确定一颗二叉树.

    - 前驱的搜索逻辑:

      - 如果左节点不为空, 那么只需要搜索左节点的最大值(尽可能的向右、向下遍历)

      - 如果左节点为空, 向上找到第一个向左的 parent , 也就是说对这个 parent 来说, 当前节点是右孩子. 如果是左孩子的话那就持续向上遍历.

      - 返回最后一个父节点. 如果到根部依旧不存在向左的 parent, 那么只能说明最开始的节点已经处在整棵树的左下角, 它没有前驱, 返回空.

  + Review: 红黑树

    在 BST 的基础上增加 color 字段, 取值为红或黑. 红黑树的性质:

    - 每个节点或者是红色, 或者是黑色.

    - 根节点是黑色.

    - 每个叶子节点是黑色.(空节点)

    - 如果一个节点是红色, 则它的两个子节点都是黑色.

    - 对于每个节点, 从该节点到其所有后代叶子节点的简单路径上, 各个颜色的节点数目相同. (黑高相同)

  + Review: 逆序对

    $
      \#{(i,j) | i < j quad and quad A[i] > A[j]}
    $

  + Review: 区间树

    我们对红黑树的结构进行扩张来存储一组区间, $A^((i))=[t^((i))_1, t^((i))_2]$. 与实数一样, 区间有着三分律, 即对于两个区间 $A, B$ 来说, 要么 $A sect B != emptyset$, 要么 $A$ 在 $B$ 的左侧/右侧, 这三种情况互斥.

    区间树的使用左端点 (低端点) 作为排序的 key (关键字), 并且额外维护一个 $x.max$, 代表当前节点对应的子树中, 所有区间的右端点 (高端点) 的最大值, 构建方式类似转移方程, 维护方式只需要向上更新, 都不超过一般红黑树的复杂度.
]

=== Question 12.2-3
Write the `TREE-PREDECESSOR` procedure(which is symmetric to `TREE-SUCCESSOR`).

#ans[
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

=== Question 13.1-5
Show that the longest simple path from a node $x$ in red-black tree to a descendant leaf at most twice that of the shortest simple path from node $x$ to a descendant leaf.

#rev1_note[
  证明从红黑树节点 $x$ 到叶子节点的最长简单路径长度至多是最短简单路径长度的两倍.

  下面这个答案实际上说明: 任意两条路径的黑高相同, 红色节点由于一定存在黑色的子节点, 那么红色节点的数量也不大于黑高. 最短路径不小于黑高, 最长路径不大于二倍黑高, 得证.
]

#ans[
  Consider the longest simple path $(a_1, ... ,a_s)$ & the shortest simple path $(b_1, ... ,b_t)$, they have equal number of black nodes (Property 5).
  Neither of the paths can have repeated red node (Property 4).
  Thus at most $floor((s - 1) / 2)$ of the nodes in the longest path are red, so $ t >= ceil((s+1)/2) $ If by way of contradiction, we had $s > t dot 2$, then $ t >= ceil((s+1) / 2) >= ceil(t+1) = t+1 $ which is a contradiction.
]

=== Question 17.1-7
Show how to use an order-statistic tree to count the number of inversions in an array of $n$ distinct elements in $O(n lg n)$ time.

#rev1_note[
  考虑按照如下方式去重计算:

  $
    "Inv"(j)=\#{(i,j) | i < j quad and quad A[i] > A[j]}\
    "TotalInv" = sum_(j=1)^(n) "Inv"(j)
  $

  按照这样的思路, $"Inv"(j)$只依赖前 $A[1:j]$ 序列中元素, 具体的说, $"Inv"(j)$ 只跟 $A[j]$ 在 $A[1:j]$ 的排名相关, 记作 $r(j)$. 那么我们有:

  $
    "Inv"(j) = j - r(j) >=0
  $

  这样的思路与插入排序的思路是一致的, 当 $A[1:j-1]$ 已经是有序数组时, $A[j]$ 新的插入位置 ($r(j)$) 意味着与 $j - r(j)$ 个元素交换了位置, 即为向前的逆序数.

  每次插入时间和查询位置时间所用时间都是 $O(log k)$. 总用时 $O(log n!)=O(n log n)$
]

#ans[
  $O(n lg(n))$ time is required to build a red-black treem so everytime we insert a node, we can calculate the number of inversion using $"OS-RANK"$ (which is the rank of the node, thus calculating inversions).
]

=== Question 17.3-2
Describe an efficient algorithm that, given an interval $i$, returns an interval overlapping $i$ that has the minimum low endpoint, or $T."nil"$ if no such interval exists.

#ans[
  Modify the usual interval search not to break out the loop when a overlap is found, but to keep track of the minimum low endpoint. Return the interval with the minimum low endpoint if found, otherwise return $T."nil"$.
]