#set text(
    font: "Source Han Serif SC",
    size: 10pt,
)

= USTC/ALGO24 算法基础 书面作业

PB21000030 马天开

== HW 1
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