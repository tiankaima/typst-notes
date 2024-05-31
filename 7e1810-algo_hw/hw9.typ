== HW9 (Week 11)
Due: 2024.05.19

#let ans(it) = [
  #pad(1em)[
    #text(fill: blue)[
      #it
    ]
  ]
]

=== Question 32.4-1
Compute the prefix function $pi$ for the pattern `ababbabbabbababbabb`.

#ans[
  $
    pi={0,0,1,2,0,1,2,0,1,2,0,1,2,3,4,5,6,7,8}
  $
]

=== Question 32.4-6
Show how to improve KMP-MATCHER by replacing the occurrence of $pi$ in line 5(but now line 10) by $pi'$, where $pi'$ is defined recusively for $q=1,2...,m-1$ by the equation
$
  pi'[q]=cases(0 quad & "if" pi[q]=0, pi'[pi[q]] quad &"if" pi[q]!=0 "and" P[pi[q]+1]=P[q+1], pi[q] quad & "otherwise")
$

Explain why the modified algorithm is correct, and explain in what sense this change constitutes an improvement.

#ans[
  If $P[q+1]!=T[i] "and" P[pi[q]+1]=P[q+1]!=T[i]$, there's no need to compare $P[pi[q]+1]$ with $T[i]$, because $P[pi[q]+1]$ is the same as $P[q+1]$, so we can directly compare $P[q+1]$ with $T[i]$. This change improves the efficiency of the algorithm.
]