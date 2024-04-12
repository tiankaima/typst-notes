== HW4 (Week 5)
Due: 2024.04.07
== Question 14.4-2
Give pseudocode to reconstruct an LCS from te completed c table (See Theorem 14.1 Optimal substructure of an LCS) and the original sequences $X = angle.l x_1, x_2, dots.c, x_m angle.r$ and $Y = angle.l y_1, y_2, dots.c y_n angle.r$ in $O(m+n)$ time, without using the b table.

#text(fill: blue)[
  == Solution 14.4-2

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

== Question 14.4-5
Give an $O(n^2)$-time algorithm to find the longest monotonically increasing subsequence of a sequence of $n$ numbers.

#text(fill: blue)[
  == Solution 14.4-5

  Given a sequence of numbers $L$, make a copy and sort it, let the $L^'$ be the sorted array:
  $o(n^2)$ time to sort $L$

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