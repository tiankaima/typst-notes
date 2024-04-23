== HW5
Due 2024.04.18
=== Question 7.13
7.13 本题考查子句盒蕴含语句之间的关系.

a. 证明子句 $(not P_1 or dots.c or not P_m or Q)$ 逻辑等价于蕴含语句 $(P_1 and dots.c and P_m) => Q$.

#text(fill: blue)[
  $
  &(not P_1 or dots.c or not P_m or Q) \
  eq.triple & ((not P_1 or dots.c or not P_m) or Q) \
  eq.triple & (not (P_1 and dots.c and P_m) or Q) space.quad & "De Morgan" \
  eq.triple & ((P_1 and dots.c and P_m) => Q) space.quad & "implication elimination"
  $
]
b. 证明每个子句 (不管正文字的数量) 都可以写成 $(P_1 and dots.c and P_m) => (Q_q or dot.c or Q_n)$ 的形式, 其中 $p_i$ 和 $Q_i$ 都是命题词. 由这类语句构成的知识库表示为 *蕴含范式* 或称 *Kowalski范式*.

#text(fill: blue)[
  将语句表达成 $(not P_1 or dots.c or not P_m or Q_1 or dots.c Q_n)$ 的形式, 则有:
  $
  & (not P_1 or dots.c or not P_m or Q_1 or dots.c Q_n) \
  eq.triple & (not P_1 or dots.c or not P_m or Q) \
  eq.triple & (P_1 and dots.c and P_m) => (Q_1 or dots.c or Q_n)
  $
]
c. 写出蕴含范式语句的完整归结规则.

#text(fill: blue)[
  $
  p_q and dots.c p_j and dots.c p_(n_1) => r_1 or dots.c or r_(n_2) \
  s_1 and dots.c s_(n_3) => q_1 or dots.c or q_k or dots.c or q_(n_4) \
  overline("SUBST"(theta, (p_1 or dots.c p_(j-1) or p_(j+1) or p_1 or p_(n_1) or s_1 or dots.c or s_(n_3) => r_1 or dots.c or r_(n_2) or q_1 or dots.c or q_k or dots.c or q_(n_4))))
  $
]

=== Question $VV$

证明. 证明前向链接算法的完备性.

#text(fill: blue)[
  证明前向链接算法的完备性, 即证明 FC 可以推出每个被 KB 蕴含的原子语句:
  - 考查 inferred 表的最终状态(FC 到达不动点之后, 不在出现新的推理), 将这个表推理出的所有符号设为 true, 其他符号设为 false, 将这个表视为一个逻辑模型 m.
  - 注意到原始 KB 的每个限定子句在这个模型下都为真
    - 考虑反证, 如果 $a_1 and dots.c a_k => b$ 在此模型下为假, 那么 $a_1 and dots.c a_k$ 为真, $b$ 为假, 与推理过程矛盾.
  - 因此 m 是 KB 的一个模型
  - $forall q, "KB" |= q$, q 在 KB 的所有模型必须为真.
    - $q$ 在 m 中为真 $=>$ 在 inferred 表中为真 $=>$ 被 FC 算法推理出来 $qed$
]