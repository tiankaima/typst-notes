#import "utils.typ": *

== HW 1 (Week 2)
Due: 2024.03.17

#rev1_note[
  + Review: 渐进符号

    $o, O, Theta, omega, Omega$ 的定义如下:

    $
      O(g(n)) &= {f(n) mid(|) exists c > 0, n_0 > 0, forall n >= n_0 quad& 0 <= f(n) <= c dot g(n)}\
      o(g(n)) &= {f(n) mid(|) exists c > 0, n_0 > 0, forall n >= n_0 quad& 0 <= f(n) < c dot g(n)}\
      Theta(g(n)) &= {
        f(n) mid(|) exists c_1, c_2 > 0, n_0 > 0, forall n >= n_0 quad& 0 <= c_1 dot g(n) <= f(n) <= c_2 dot g(n)
      }\
      Omega(g(n)) &= {f(n) mid(|) exists c > 0, n_0 > 0, forall n >= n_0 quad& 0 <= c dot g(n) <= f(n)}\
      omega(g(n)) &= {f(n) mid(|) exists c > 0, n_0 > 0, forall n >= n_0 quad& 0 <= c dot g(n) < f(n)}
    $

  + Review: 主定理

    对分治算法的递归式

    $T(n) = a T(n / b) + f(n)$

    主定理给出了一个快速求解递归算法复杂度的复杂度, 记 $c = log_b a, f(n) = O(n^d)$

    + 如果 $c > d$, 则 $T(n) = Theta(n^c)$

      这里需要注意, 比较的时候要是多项式意义上的小于, 即:
      $exists epsilon > 0, f(n) = O(n^(c - epsilon))$

    + 如果 $c = d$, 则 $T(n) = Theta(n^c log n)$

    + 如果 $c < d$, 则 $T(n) = Theta(f(n))$

      同时需要满足正则化条件: $exists epsilon > 0,c < 1, quad a f(n\/b) <= c f(n) < f(n)$
]

=== Question 2.3-5

You can also think of insertion sort as a recursive algorithm. In order to sort $A[1 : n]$, recursively sort the subarray $A[1 : n – 1]$ and then insert $A[n]$ into the sorted subarray $A[1 : n – 1]$. Write pseudocode for this recursive version of insertion sort. Give a recurrence for its worst-case running time.

#ans[
  The pseudocode for this recursive version of insertion sort is as follows:

  ```txt
  INSERTION-SORT(A, n)
      if n > 1
          INSERTION-SORT(A, n - 1)
          key = A[n]
          i = n - 1
          while i > 0 and A[i] > key
              A[i + 1] = A[i]
              i = i - 1
          A[i + 1] = key
  ```

  #rev1_note[
    最坏情况是:

    在排序 $[1,k]$ 时, 需要将 $A[k]$ 与 $A[1:k-1]$ 中的所有元素比较一次, 以确定插入位置. 这样, 在排序 $[1,n]$ 时, 需要比较的次数为 $1 + 2 + dots.c + (n-1) = Theta(n^2)$.
  ]

  The recurrence for its worst-case running time is

  $
    T(n) = cases(T(n - 1) + Theta(n) space.quad & n>1, Theta(1) & n=1)
  $

  The solution to the recurrence is $Theta(n^2)$ worst-case time.
]

=== Question 2-1

*Insertion sort on small arrays in merge sort*

Although merge sort runs in $Theta(n lg n)$ worst-case time and insertion sort runs in $Theta(n^2)$ worst-case time, the constant factors in insertion sort can make it faster in practice for small problem sizes on many machines. Thus it makes sense to coarsen the leaves of the recursion by using insertion sort within merge sort when subproblems become suffificiently small. Consider a modifification to merge sort in which $n\/k$ sublists of length $k$ are sorted using insertion sort and then merged using the standard merging mechanism, where $k$ is a value to be determined.

+ Show that insertion sort can sort the $n\/k$ sublists, each of length $k$, in $Theta(n k)$ worst-case time.

+ Show how to merge the sublists in $Theta(n lg(n\/k))$ worst-case time.

+ Given that the modifified algorithm runs in $Theta(n k + n lg(n\/k))$ worst-case time, what is the largest value of $k$ as a function of $n$ for which the modifified algorithm has the same running time as standard merge sort, in terms of $Theta$-notation?

+ How should you choose $k$ in practice?

#ans[
  + For each sublist, the insertion sort can sort the $k$ elements in $Theta(k^2)$ worst-case time. Thus, the insertion sort can sort the $n\/k$ sublists, each of length $k$, in $Theta(n k)$ worst-case time.

  + Given $n\/k$ sorted sublists, each of length $k$, the recurrence for merging the sublists is
    $
      T(n) = cases(2 dot.c T(n\/2) + Theta(n) space.quad & n>k, 0 & n=k)
    $
    The solution to the recurrence is $Theta(n lg(n\/k))$ worst-case time.

    *This could also be viewed as a tree with $lg(n\/k)$ levels with $n$ element in each level. Worst case would be $Theta(n lg (n\/k))$*

    #rev1_note[
      将 $n\/k$ 个数组看成 $n\/k$ 个元素, 作为 merge sort 的叶节点. 这样一个数有 $n\/k$ 个叶节点, 也就有 $log(n\/k)$ 层. 每层实际上合并 $n$ 个元素, 总时间复杂度为 $Theta(n lg(n\/k))$.

      直接进行 $n\/k-1$ 次合并是不可行的, 这样的速度在 $Theta(n^2\/k)$, 不符合要求.

      另一种可行的思路: 考虑直接合并 $n\/k$ 个有序数组, 我们比较这 $n\/k$ 个数组中, 尚未取出的最小元素, 并从中选取最小元素.

      具体来说, 维护一个 $n\/k$ 大小的 heap 和一个 $n\/k$ 大小的数组, 用于存储每个数组中的当前元素. 每次取出堆顶元素, 并将对应数组的下一个元素插入堆中. 这样, 每次取出最小元素 (构建最小堆) 的时间复杂度为 $O(lg(n\/k))$, 总时间复杂度为 $O(n lg(n\/k))$.
    ]

  + Take $Theta(n k + n lg(n \/ k)) = Theta(n lg n)$, consider $k = Theta(lg n)$:
    $
      Theta(n k + n lg(n \/ k))
      &= Theta (n k + n lg n - n lg k) \
      &= Theta (n lg n + n lg n - n lg (lg n)) \
      &= Theta (n lg n)
    $

    #rev1_note[
      思路:
      $
        Theta(n k +n log(n\/k))=O(n log n)
      $
      只需 $k = O(log n), log(n\/k) = O(log n)$. 这样我们得到 $k=omega(1)=O(log n)$, 选取最大边界 $k=Theta(log n)$, 通过上述验证可以发现严格记号成立, 那么最大的 $k$ 值为 $Theta(log n)$. (渐进意义上的.)

      容易发现当 $k=omega(log n)$ 时, $Theta(n k + n log(n\/k))=omega(n log n)$, 这样的 $k$ 值不满足题目要求.
    ]

  + Choose $k$ to be the largest length of sublist for which insertion sort is faster than merge sort. Use a small constant such as $5$ or $10$.

    #rev1_note[
      这里的主要问题是, 比较两个 $Theta$ 意义下相等的算法用时必须考虑常数, 实践中可以通过记录算法实际运算次数得到.
    ]
]

=== Question 4.2-3
What is the largest $k$ such that if you can multiply $3 times 3$ matrices using $k$ multiplications (not assuming commutativity of multiplication), then you can multiply $n times n$ matrices in $o(n^(log 7))$ time? What is the running time of this algorithm?

#ans[
  #rev1_note[
    稍微翻译一下题目:

    如果你有一个 $k$ 次乘法的 $3 times 3$ 矩阵乘法算法, 那么这样的算法是否能否构造一个, 在 $o(n^(log_2 7))$ 时间内完成 $n times n$ 矩阵乘法? 问满足条件的最大的 $k$ 是多少.

    递归式是 $T(n) = k T(n\/3) + O(n^2)$, 我们分类讨论来使用主定理:

    // - $k=27$ 时这就是最基本的矩阵分块算法. 我们不妨假设 $k<27$.

    - $log_3 k < 2$, 正则化条件: $k dot (n\/3)^2  < n^2$ 即 $k < 9$, 算法规模在 $T(n)=O(n^2)subset O(n^(log_2 7))$.

    - $log_3 k = 2$, 此时 $T(n)=O(n^2 lg n) subset O(n^(log_2 7))$.

    - $log_3 k > 2$, 为使 $T(n)=O(n^(log_3 k)) subset O(n^(log_2 7))$, 需要 $log_3 k < log_2 7$, 最大的 $k=21$.

    下面这个答案中递归式是错误的, 应该改正.
  ]

  Assuming $n = 3^m$. Use block matrix multiplication, the recursive running time is $T(n) = k T(n\/3) + O(1)$.

  When $log_3 k > 2 $, using master theorem, the largest $k$ to satisfy $log_3 k < lg 7$ is $k=21$.
]