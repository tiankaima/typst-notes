== HW 2 (Week 3)
Due: 2024.03.24

#let ans(it) = [
  #pad(1em)[
    #text(fill: blue)[
      #it
    ]
  ]
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
#ans[
  + $O(n)$: Using SELECT, we can find $x$ to be the median of $S$.
  + $O(n)$: Subtract $x$ from each element in $S$.
  + $O(n)$: Use COUNTING-SORT to sort the absolute values of the differences.
  + $O(k)$: Return the first $k$ elements in the sorted array.

  This is the required $O(n)$-time algorithm.
]