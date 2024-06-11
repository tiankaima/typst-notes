#import "utils.typ": *
== HW4 (Week 5)
Due: 2024.04.07

=== Question 14.4-2
Give pseudocode to reconstruct an LCS from te completed c table (See Theorem 14.1 Optimal substructure of an LCS) and the original sequences $X = angle.l x_1, x_2, dots.c, x_m angle.r$ and $Y = angle.l y_1, y_2, dots.c y_n angle.r$ in $O(m+n)$ time, without using the b table.

#rev1_note[
  Review: 最长公共子序列

  考虑状态转移方程:

  $
    c[i,j] = cases(
        c[i-1, j-1] + 1\, & "if" x_i = y_j,
        max(c[i-1, j], c[i, j-1])\, & "otherwise"
    )
  $

  通过这个方程, 可以得到最长公共子序列的长度, 但是无法直接得到最长公共子序列的内容. 通过构造一个二维数组 $b$, 可以在 $O(m+n)$ 的时间内得到最长公共子序列的内容:

  - 如果 $x_i = y_j$, 那么 $b[i,j] = "TOP_LEFT"$

  - 如果 $c[i-1, j] >= c[i, j-1]$, 那么 $b[i,j] = "TOP"$

  - 否则, $b[i,j] = "LEFT"$

  回溯时, 只需要根据 $b$ 数组的内容, 从 $c[m,n]$ 开始, 依次回溯到 $c[0,0]$, 当 $b$ 为 "TOP_LEFT" 时, 输出 $x_i$, 否则, 根据 $b$ 的内容选择回溯方向.

  接下来我们考虑如何不使用 $b$ 数组, 直接输出最长公共子序列的内容.

  通过观察, 我们可以发现, 当 $x_i = y_j$ 时, $c[i,j] = c[i-1, j-1] + 1$, 否则, $c[i,j] = max(c[i-1, j], c[i, j-1])$. 这意味着, 当 $x_i = y_j$ 时, $x_i$ 一定在最长公共子序列中, 否则, $x_i$ 一定不在最长公共子序列中.
]

#ans[
  Consider the following pseudocode:

  ```txt
  PRINT-LCS(X, Y, i, j, c)
      if c[i,j] == 0
          return
      if X[i] == Y[j]
          PRINT-LCS(X, Y, i-1, j-1, c)
          print X[i]
      else if c[i-1, j] > c[i, j-1]
          PRINT-LCS(X, Y, i-1, j)
      else
          PRINT-LCS(X,Y, i, j-1, c)
  ```
]

=== Question 14.4-5
Give an $O(n^2)$-time algorithm to find the longest monotonically increasing subsequence of a sequence of $n$ numbers.

#rev1_note[
  思路: 给定一个序列 $L$, 复制一份并排序, 记为 $L^'$, $O(n lg n)$ 时间排序 $L$

  计算 $L$ 和 $L^'$ 的最长公共子序列, 由于最长公共子序列一定是单调递增的(是 $L^'$ 的子序列), 且最长, 所以最长公共子序列即为 $L$ 的最长单调递增子序列.

  特别的, 考虑此问题的一个变种, 如果要求严格递增子序列, 可以对排序结果去重, 然后再计算最长公共子序列.

  另一种思路也是 DP, 构建这样一组 $c[n]$, 其中 $c[i]$ 是 $A[1:i]$ 子问题中上升子列的长度, 转移方程:

  $
    c[i] = max_(j<i) {c[j] + 1 | A[j] < A[i]}
  $
]

#ans[
  Given a sequence of numbers $L$, make a copy and sort it, let the $L^'$ be the sorted array:
  $O(n lg n)$ time to sort $L$

  Then consider the following pseudocode:

  ```txt
  PRINT-LCS(X, Y, c)
      n = c[X.length, Y.length]
      s = new array[n]
      i = X.length
      j = Y.length
      while i > 0 and j > 0
          if x[i] == y[j]
              s[n] = x[i]
              n--
              i--
              j--
          else if c[i - 1, j] >= c[i, j - 1]
              i--
          else
              j--
      print s

  MEMO-LCS(X, Y, c, b)
      m = X.length
      n = Y.length
      if c[m, n] != 0 or m == 0 or n == 0
          return
      if x[m] == y[n]
          b[m, n] = TOP_LEFT
          c[m, n] = MEMO-LCS(X[1..m - 1], Y[1..n - 1], c, b) + 1
      else if MEMO-LCS(X[1..m - 1], Y, c, b) >=
              MEMO-LCS(X, Y[1..n - 1], c, b)
          b[m, n] = TOP
          c[m, n] = MEMO-LCS(X[1..m - 1], Y, c, b)
      else
          b[m, n] = LEFT
          c[m, n] = MEMO-LCS(X, Y[1..n - 1], c, b)

  c = new array[X.length][Y.length]
  b = new array[X.length][Y.length]
  MEMO-LCS(X,Y,c,b)
  ```

  Then the porblem could be turned into running LCS on these two lists ($L$ and $L^'$), since the longest common subsequence must be monotone increasing (being subsequence of $L^'$), and longest (the restriction is only on monotone increasing).

  The final runtime would be $o(n^2) + O(L."length" * L^'."length") = O(n^2)$.
]