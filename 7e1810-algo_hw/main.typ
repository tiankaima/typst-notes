#set text(
  font: ("Source Han Serif SC", "Source Han Serif"),
  size: 10pt,
)

= USTC/ALGO24 算法基础 书面作业

PB21000030 马天开

== HW 3 (Week 4)
Due: 2024.03.31
== Question 12.2-3
Write the `TREE-PREDECESSOR` procedure(which is symmetric to `TREE-SUCCESSOR`).

#set text(fill: blue)
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

#set text(fill: black)

== Question 13.1-5
Show that the longest simple path from a node $x$ in red-black tree to a descendant leaf at most twice that of the shortest simple path from node $x$ to a descendant leaf.

#set text(fill: blue)
=== Solution 13.1-5

Consider the longest simple path $(a_1, ... ,a_s)$ & the shortest simple path $(b_1, ... ,b_t)$, they have equal number of black nodes (Property 5).
Neither of the paths can have repeated red node (Property 4).
Thus at most $floor((s - 1) / 2)$ of the nodes in the longest path are red, so $ t >= ceil((s+1)/2) $ If by way of contradiction, we had $s > t dot 2$, then $ t >= ceil((s+1) / 2) >= ceil(t+1) = t+1 $ which is a contradiction.

#set text(fill: black)

== Question 17.1-7
Show how to use an order-statistic tree to count the number of inversions in an array of $n$ distinct elements in $O(n lg n)$ time.

#set text(fill: blue)
=== Solution 17.1-7

$O(n lg(n))$ time is required to build a red-black treem so everytime we insert a node, we can calculate the number of inversion using $"OS-RANK"$ (which is the rank of the node, thus calculating inversions).

#set text(fill: black)

== Question 17.3-2
Describe an efficient algorithm that, given an interval $i$, returns an interval overlapping $i$ that has the minimum low endpoint, or $T."nil"$ if no such interval exists.

#set text(fill: blue)
=== Solution 17.3-2

Modify the usual interval search not to break out the loop when a overlap is found, but to keep track of the minimum low endpoint. Return the interval with the minimum low endpoint if found, otherwise return $T."nil"$.

#set text(fill: black)

#pagebreak()

== HW 2 (Week 3)
Due: 2024.03.24
=== Question 6.2-6
The code for MAX-HEAPIFY is quite efficient in terms of constant factors, except possibly for the recursive call in line 10, for which some compilers might produce inefficient code. Write an efficient MAX-HEAPIFY that uses an iterative control construct (a loop) instead of recursion.

#set text(fill: blue)
==== Solution 6.2-6

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

#set text(fill: black)

=== Question 6.5-9
Show how to implement a first-in, first-out queue with a priority queue. Show how to implement a stack with a priority queue. (Queues and stacks are defined in Section 10.1.3.)

#set text(fill: blue)
==== Solution 6.5-9

- For stack, add element with increasing priority, and pop the element with the highest priority, pseudocode:
//     ```txt
//     PUSH(S, x)
//         S.top = S.top + 1
//         S[S.top] = x
//     POP(S)
//         if S.top < 1
//             error "underflow"
//         else
//             S.top = S.top - 1
//             return S[S.top + 1]
//     ```
- For queue, add element with decreasing priority, and pop the element with the highest priority, pseudocode:
//     ```txt
//     ENQUEUE(Q, x)
//         Q.tail = Q.tail + 1
//         Q[Q.tail] = x
//     DEQUEUE(Q)
//         if Q.head > Q.tail
//             error "underflow"
//         else
//             return Q[Q.head]
//     ```

#set text(fill: black)

=== Question 7.4-6
Consider modifying the PARTITION procedure by randomly picking three elements from subarray $A[p : r]$ and partitioning about their median (the middle value of the three elements). Approximate the probability of getting worse than an $alpha$-to-$(1 - alpha)$ split, as a function of $alpha$ in the range $0 < alpha < 1/2$.

#set text(fill: blue)
==== Solution 7.4-6

*Assuming the same element could be picked more than once*(which should be the case in real world).

The probability of getting worse than an $alpha$-to-$(1 - alpha)$ split is the probability of picking the smallest or the largest element as the median.

$
P = 2 * [binom(2,3) times alpha^2(1 - alpha) + alpha^3] = 6 alpha^2 - 4 alpha^3
$

#set text(fill: black)

=== Question 8.2-7
Counting sort can also work efficiently if the input values have fractional parts, but the number of digits in the fractional part is small. Suppose that you are given n numbers in the range $0$ to $k$, each with at most $d$ decimal (base $10$) digits to the right of the decimal point. Modify counting sort to run in $Theta(n + 10^d k)$ time.

#set text(fill: blue)
==== Solution 8.2-7

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

#set text(fill: black)

=== Question 8.3-5
Show how to sort $n$ integers in the range $0$ to $n^3 - 1$ in $O(n)$ time.

#set text(fill: blue)
==== Solution 8.3-5

First convert each number to base $n$, then use counting sort to sort the numbers.

Since each number would now have at most $log_n n^3 = 3$ digits, 3 passes of counting sort would be enough to sort the numbers, during which each pass would take $O(n)$ time since there's only $n$ numbers.

#set text(fill: black)

=== Question 9.3.9
Describe an $O(n)$-time algorithm that, given a set $S$ of $n$ distinct numbers and a positive integer $k <= n$, determines the $k$ numbers in $S$ that are closest to the median of $S$.

#set text(fill: blue)
==== Solution 9.3.9

+ $O(n)$: Using SELECT, we can find $x$ to be the median of $S$.
+ $O(n)$: Subtract $x$ from each element in $S$.
+ $O(n)$: Use COUNTING-SORT to sort the absolute values of the differences.
+ $O(k)$: Return the first $k$ elements in the sorted array.

This is the required $O(n)$-time algorithm.

#set text(fill: black)

#pagebreak()

== HW 1 (Week 2)
Due: 2024.03.17
=== Question 2.3-5

You can also think of insertion sort as a recursive algorithm. In order to sort $A[1 : n]$, recursively sort the subarray $A[1 : n – 1]$ and then insert $A[n]$ into the sorted subarray $A[1 : n – 1]$. Write pseudocode for this recursive version of insertion sort. Give a recurrence for its worst-case running time.

#set text(fill: blue)
=== Solution 2.3-5

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

The recurrence for its worst-case running time is

$
T(n) = cases(T(n - 1) + Theta(n) space.quad & n>1, Theta(1) & n=1)
$

The solution to the recurrence is $Theta(n^2)$ worst-case time.

#set text(fill: black)

=== Question 2-1 Insertion sort on small arrays in merge sort

Although merge sort runs in $Theta(n lg n)$ worst-case time and insertion sort runs in $Theta(n^2)$ worst-case time, the constant factors in insertion sort can make it faster in practice for small problem sizes on many machines. Thus it makes sense to coarsen the leaves of the recursion by using insertion sort within merge sort when subproblems become suffificiently small. Consider a modifification to merge sort in which $n\/k$ sublists of length $k$ are sorted using insertion sort and then merged using the standard merging mechanism, where $k$ is a value to be determined.

- a. Show that insertion sort can sort the $n\/k$ sublists, each of length $k$, in $Theta(n k)$ worst-case time.
- b. Show how to merge the sublists in $Theta(n lg(n\/k))$ worst-case time.
- c. Given that the modifified algorithm runs in $Theta(n k + n lg(n\/k))$ worst-case time, what is the largest value of $k$ as a function of $n$ for which the modifified algorithm has the same running time as standard merge sort, in terms of $Theta$-notation?
- d. How should you choose $k$ in practice?

#set text(fill: blue)
=== Solution 2-1

- a. For each sublist, the insertion sort can sort the $k$ elements in $Theta(k^2)$ worst-case time. Thus, the insertion sort can sort the $n\/k$ sublists, each of length $k$, in $Theta(n k)$ worst-case time.
- b. Given $n\/k$ sorted sublists, each of length $k$, the recurrence for merging the sublists is
$
T(n) = cases(2 dot.c T(n\/2) + Theta(n) space.quad & n>k, 0 & n=k)
$
The solution to the recurrence is $Theta(n lg(n\/k))$ worst-case time.

*This could also be viewed as a tree with $lg(n\/k)$ levels with $n$ element in each level. Worst case would be $Theta(n lg (n\/k))$*

- c. Take $Theta(n k + n lg(n \/ k)) = Theta(n lg n)$, consider $k = Theta(lg n)$:
$
Theta(n k + n lg(n \/ k))
&= Theta (n k + n lg n - n lg k) \
&= Theta (n lg n + n lg n - n lg (lg n)) \
&= Theta (n lg n)
$
- d. Choose $k$ to be the largest length of sublist for which insertion sort is faster than merge sort. Use a small constant such as $5$ or $10$.

#set text(fill: black)

=== Question 4.2-3
What is the largest $k$ such that if you can multiply $3 times 3$ matrices using $k$ multiplications (not assuming commutativity of multiplication), then you can multiply $n times n$ matrices in $o(n lg 7)$ time? What is the running time of this algorithm?

#set text(fill: blue)
==== Solution 4.2-3

Assuming $n = 3^m$. Use block matrix multiplication, the recursive running time is $T(n) = k T(n\/3) + O(1)$.

Using master theorem, the largest $k$ to satisfy $log_3 k < lg 7$ is $k=21$.

#set text(fill: black)