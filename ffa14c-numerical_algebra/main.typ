#set text(
  font: "Source Han Serif SC",
  size: 10pt,
)
#set math.equation(numbering: "(1)")

#align(
  center,
  text(20pt)[
    2023秋 数值代数
  ],
)
#align(
  center,
  text(12pt)[
    马天开 PB21000030
  ],
)
#align(
  center,
  text(12pt)[
    上次修改：#datetime.today().display("[year]-[month]-[day]")
  ],
)
#outline(depth: 1)

#pagebreak()
= 第一次书面作业
== 1.1

给出求下三角阵的逆矩阵的详细算法。

#text(fill: blue)[
  *解答*

  设下三角阵 $L$ 的逆矩阵为 $T$，对 $T$ 进行分块：
  $
  T = [T_1, T_2, dots.c, T_n]
  $

  注意到：
  $
  L T = [L T_1, L T_2, dots.c, L T_n] = [e_1, e_2, dots.c, e_n] = I
  $

  对每个 $L T_i = e_i$，$L$ 是下三角阵，利用算法1.1.1，分别计算出 $T_1, T_2, dots.c, T_n$。
]

#text(fill: red)[
  *算法*

  ```txt
  for j=1:n
      for k=1:n-1
          T(k,j)=T(k,j)/L(k,k);
          T(k+1:n,j)=T(j+1:n,j)-T(k,j)L(k+1:n,k);
      end
      T(n,j)=T(n,j)/L(n,n);
  end
  ```
]

== 1.2
设 $S, T in RR^(n times n)$ 为两个上三角阵，而且线性方程组 $(S T - lambda I)x=b$ 是非奇异的。给出一种运算量为 $O(n^2)$ 的算法来求解该方程组。

#text(fill: blue)[
  *解答*

  - $O(n^2)$ 计算$hat(S) = (S T - lambda I)$，注意到$S$与$T$都是上三角阵，所以$hat(S)$也是上三角阵
  - $O(n^2)$ 回代法求解$hat(S) x = b$，线性方程组非奇异
]

== 1.3
证明：如果 $L_k=I-l_k e_k^T$ 是一个Gauss变换，那么 $L_k^{-1}=I+l_k e_k^T$ 也是一个Gauss变换。

#text(fill: blue)[
  *解答*

  根据定义，容易说明 $L^prime = I+l_k e_k^T$ 是Gauss变换，只需证明 $L^prime L_k = I$ 即可。
  注意到：
  $
  (I-l_k e_k^T)(I+l_k e_k^T) = I - l_k e_k^T + l_k e_k^T - l_k e_k^T l_k e_k^T = I- l_k e_k^T l_k e_k^T
  $
  而 $ l_k = (0,dots.c,0,l_(k+1,k),dots.c,l_(n,k))^T $
  显然得到$e_k^T l_k &= 0$，因此
  $
  L^(-1)= I+l_k e_k^T
  $
]

== 1.4
确定一个 $3 times 3$ Gauss变换 $L$，使得：
$
L mat(delim:"[",2;3;4) = mat(delim:"[",2;7;8)
$

#text(fill: blue)[
  *解答*

  显然如下变换满足要求：
  $
  L = mat(delim:"[",
1;
2,1;
2,0,1;
)
  $
]

== 1.5
证明：如果 $A in RR^(n times n)$ 有三角分解，并且是非奇异的，那么 $A = L U$ 的分解中 $L$ 和 $U$ 都是唯一的。

#text(fill: blue)[
  *解答*

  设 $A = L_1 U_1 = L_2 U_2$，其中 $L_1, L_2$ 是单位下三角阵，$U_1, U_2$ 是上三角阵。

  于是成立：
  $
  L_2^(-1) L_1 = U_2 U_1^(-1)
  $
  容易说明 $L_2^(-1)$ 也是单位下三角阵，$U_1^(-1)$ 也是上三角阵。同时，$L_2^(-1) L_1$ 是单位下三角阵，$U_2 U_1^(-1)$ 是上三角阵。
  在两侧相等的情况下，只可能均等于对角矩阵，同时左侧又是单位下三角阵，因此只能是单位对角阵，即 $ L_2^(-1) L_1 = U_2 U_1^(-1) = I $
  从而$ L_1 = L_2, U_1 = U_2 $
]

== 1.6
设$A = (a_(i j)) in RR^(n times n)$ 的定义如下：
$
a_(i j) = cases(
    1 quad& i = j or j = n,
    -1 quad& i > j,
    0 quad& "else"
)
$
证明 $A$ 有满足 $abs(l_(i j)) <=1$ 和 $u_(n n) = 2^(n-1)$ 的三角分解

#text(fill: blue)[
  *解答*

  设 $L = (l_(i j)) in RR^(n times n)$ 是单位下三角阵，$U = (u_(i j)) in RR^(n times n)$ 是上三角阵，满足 $A = L U$。

  其中
  $
  l_(i j) = cases(
    0 quad& i < j,
    1 quad& i = j,
    -1 quad& i > j,
)
  $
  $
  u(i j) = cases(
    2^(i-1) quad& j=n,
    1 quad& i = j,
    0 quad& "else"
)
  $

  容易证明 $A = L U$，同时 $abs(l_(i j)) <=1$ 和 $u_(n n) = 2^(n-1)$ju
]