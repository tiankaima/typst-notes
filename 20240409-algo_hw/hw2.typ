#import "utils.typ": *

== HW 2 (Week 3)
Due: 2024.03.24

#rev1_note[
  + Review: 最大堆/最小堆

    最大堆是一种满足性质 $A["PARENT"(i)] >= A[i]$ 的二叉树, 其中 $"PARENT"(i) = floor(i\/2)$, 两个子节点分别是 $2i, 2i+1$. 最小堆是则满足性质 $A["PARENT"(i)] <= A[i]$.

    插入过程: 向最下一层、最右侧节点插入新叶节点 (实际上就是在数组结尾添加), 添加之后向上调整, 使其重新满足最大(小)堆的性质. 调整时间复杂度 $O(log n)$

    删除过程: 向下调整, 在子节点中寻找最大(小)值, 与当前节点交换, 递归调整. 调整时间复杂度 $O(log n)$

    建堆过程: 从最后一个非叶节点开始, 依次向前调整, 使其满足最大(小)堆的性质. 时间复杂度 $O(n)$, 主要考虑从叶到根开始「合并」已经建好的堆, 每次都是向下调整, 时间复杂度 $O(log n - k)$, 总时间复杂度 $O(n log n) - sum log i=O(n)$

  + Review: 计数排序

    一个保证稳定性的思路如下, 考虑数据长度 $n$, 范围 $[0,k]$.
    - 开辟一个 $[0,k]$ 的数组 $C$. 清零
    - 对于原数据 $n$, 遍历一遍并加入到这个计数的数组中
    - 计算前缀和: $C[i] = C[i] + C[i-1]$
    - 从原数据的尾部开始, 将数据放入到 $C$ 中对应的位置, 并将 $C$ 中的值减一, 这样每次从 $C$ 中取得的数字总是不同的.

    总时间复杂度: $O(n+k)$.

  + Review: 基数排序

    假设每个数据有 $k$ 个关键字, 每个关键字有自己的排序方式, 以第一个关键字开始, 从小到大排序, 第一个关键字相同的情况下比较第二个关键字. 以此类推, 直到最后一个关键字.

    在下面这个问题中, 内层排序方式使用计数排序, 相当于每层排序 $l$ 组共计 $n$ 个元素的关键字, 按照计数排序, 每层的复杂度在 $O(n)$. 三层也还是 $O(n)$.

  + Review: 比较排序方法复杂度下限

    基于比较的排序方法的下界是 $Omega(n log n)$, 证明方法是通过决策树模型: 对于 $n$ 个不同元素, 有 $n!$ 种不同的排列方式, 因此决策树至少有 $n!$ 个叶节点来表示排序结果.

    因此可以得到层高 $h$ 满足: $h>=log_2(n!)=Theta(n log n)$, 最好情况就是比较 $h$ 次, 所以比较排序的下界是 $Omega(n log n)$.
]

=== Question 6.2-6
The code for MAX-HEAPIFY is quite efficient in terms of constant factors, except possibly for the recursive call in line 10, for which some compilers might produce inefficient code. Write an efficient MAX-HEAPIFY that uses an iterative control construct (a loop) instead of recursion.

#ans[
  Consider the following pseudocode code:
  ```txt
  MAX-HEAPIFY(A, i)
      while true
          l = LEFT(i)
          r = RIGHT(i)
          if l <= A.heap-size and A[l] > A[i]
              largest = l
          else
              largest = i
          if r <= A.heap-size and A[r] > A[largest]
              largest = r
          if largest != i
              exchange A[i] with A[largest]
              i = largest
          else
              break
  ```

]

=== Question 6.5-9
Show how to implement a first-in, first-out queue with a priority queue. Show how to implement a stack with a priority queue. (Queues and stacks are defined in Section 10.1.3.)

#ans[
  - For stack, add element with increasing priority, and pop the element with the highest priority, pseudocode:

    ```txt
    PUSH(S, x)
        S.top = S.top + 1
        S[S.top] = x
    POP(S)
        if S.top < 1
            error "underflow"
        else
            S.top = S.top - 1
            return S[S.top + 1]
    ```

  - For queue, add element with decreasing priority, and pop the element with the highest priority, pseudocode:

    ```txt
    ENQUEUE(Q, x)
        Q.tail = Q.tail + 1
        Q[Q.tail] = x
    DEQUEUE(Q)
        if Q.head > Q.tail
            error "underflow"
        else
            return Q[Q.head]
    ```

]

=== Question 7.4-6
Consider modifying the PARTITION procedure by randomly picking three elements from subarray $A[p : r]$ and partitioning about their median (the middle value of the three elements). Approximate the probability of getting worse than an $alpha$-to-$(1 - alpha)$ split, as a function of $alpha$ in the range $0 < alpha < 1/2$.

#rev1_note[
  认为元素可以重复取得, 或者认为 $r-p$ 足够大, 这样可以保证三次选取独立.

  考虑三个变量中位数的分布, 只要它落在 $[0,alpha]union[1-alpha,1]$ 之间, 这样的 $q$ 的选取就不如 $(0,alpha)union(alpha,1)$, 由于对称性, 我们只需要计算左边的部分, 共有两种情况能使得中位数落在 $[0,alpha]$:

  - 前两个数和最后一个分别落在 $[0,alpha],[alpha,1]$中: $vec(2,3) times alpha^2(1-alpha)$

  - 三个数均落在 $[0,alpha]$ 中: $alpha^3$

  容易证明这些情况是无交的, 并且列举了所有可能的「中位数落在...」的情况, 乘 $2$ 即可:
]

#ans[
  *Assuming the same element could be picked more than once*(which should be the case in real world).

  The probability of getting worse than an $alpha$-to-$(1 - alpha)$ split is the probability of picking the smallest or the largest element as the median.

  $
    P = 2 * [binom(2,3) times alpha^2(1 - alpha) + alpha^3] = 6 alpha^2 - 4 alpha^3
  $

]

=== Question 8.2-7
Counting sort can also work efficiently if the input values have fractional parts, but the number of digits in the fractional part is small. Suppose that you are given n numbers in the range $0$ to $k$, each with at most $d$ decimal (base $10$) digits to the right of the decimal point. Modify counting sort to run in $Theta(n + 10^d k)$ time.

#ans[
  To achieve $Theta(n + 10^d k)$ time, we first use $Theta(n)$ time to multiply each number by $10^d$, then change the $C[0, k]$ to $C[0, 10^d k]$, and finally use $Theta(10^d k)$ time to sort the numbers.

  With other part of the counting sort unchanged, the pseudocode is as follows:
  ```txt
  COUNTING-SORT(A, B, k, d)
      let C[0, 10^d k] be a new array
      for i = 0 to 10^d k
          C[i] = 0
      for j = 1 to A.length
          C[A[j] * 10^d] = C[A[j] * 10^d] + 1
      for i = 1 to 10^d k
          C[i] = C[i] + C[i - 1]
      for j = A.length downto 1
          B[C[A[j] * 10^d]] = A[j]
          C[A[j] * 10^d] = C[A[j] * 10^d] - 1
  ```

  This is the required $Theta(n + 10^d k)$ time algorithm.
]

=== Question 8.3-5
Show how to sort $n$ integers in the range $0$ to $n^3 - 1$ in $O(n)$ time.

#ans[
  First convert each number to base $n$, then use counting sort to sort the numbers.

  Since each number would now have at most $log_n n^3 = 3$ digits, 3 passes of counting sort would be enough to sort the numbers, during which each pass would take $O(n)$ time since there's only $n$ numbers.

]

=== Question 9.3.9
Describe an $O(n)$-time algorithm that, given a set $S$ of $n$ distinct numbers and a positive integer $k <= n$, determines the $k$ numbers in $S$ that are closest to the median of $S$.

#rev1_note[
  下面的回答中需要更正: Step 2 中, 对于每个元素 $y$ 计算的是 $abs(y-x)$. 然后记录这个作为 key, 原来的值作为 value, 进行计数排序, 最后取前 $k$ 个元素即可.
]

#ans[
  + $O(n)$: Using SELECT, we can find $x$ to be the median of $S$.

  + $O(n)$: Subtract $x$ from each element in $S$.

  + $O(n)$: Use COUNTING-SORT to sort the absolute values of the differences.

  + $O(k)$: Return the first $k$ elements in the sorted array.

  This is the required $O(n)$-time algorithm.
]