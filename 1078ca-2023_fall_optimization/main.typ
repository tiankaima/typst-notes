#set text(
    font: "Source Han Serif SC",
    size: 10pt,
)

#align(center, text(20pt)[
    2023秋 运筹学 笔记 & 作业
])
#align(center, text(12pt)[
    马天开 PB21000030
])
#align(center, text(12pt)[
    上次修改：#datetime.today().display("[year]-[month]-[day]")
])

#set math.equation(numbering: "(1)")

#outline(depth:1)






#pagebreak()

= 第一次书面作业
```txt
1.1 1.2 2.1 2.2 2.3 2.4 2.5
```
== Q1.1
=== 问题

考虑稀疏优化问题，我们已经直观地讨论了在 $italic(l)_0,italic(l)_1,italic(l)_2$ 三种范数下问题的解的可能形式．针对一般的$italic(l)_p$范数”：
$
norm(x)_p := (sum_(i=1)^n abs(x_i)^p)^(1/p), quad 0<p<2
$
我们考虑优化问题：
$
min norm(x)_p, quad "s.t." A x = b
$
试着用几何直观的方式来说明当$p in (0,2)$取何值时，问题的解可能具有稀疏性。

=== 答案

如下图所示，绘制了题目中要求的$p in (0,2)$中六个参数点，由这样的几何直观，可以说明，当$p in (0,1]$时，问题的解可能具有稀疏性。

#align(center, image("./imgs/1.jpg", width: 60%))

== Q1.2
=== 问题
给定一个函数$f(x):RR^n -> RR$及其一个局部最优点$x^*$，则该点沿任何方向$d in RR^n$也是局部最优的，即$0$为函数$Phi(alpha):=f(x^*+alpha d)$的一个局部最优解。反之，如果$x^*$沿任何方向$d in RR^n$都是局部最优解，则$x^*$是否是$f(x)$的一个局部最优解？若是，请给出证明；若不是，请给出反例。

=== 答案
不成立，考虑一个沿任何径向均是局部最优解的函数，使其沿切向无穷震荡，即可构造出反例。

$
f(r,theta) = cases(
    r^2 dot.c sin(1/theta) quad& theta != 0,
    0 quad& theta = 0
)
$

== Q2.1
=== 问题
说明矩阵$F$范数不是算子范数（即它不可能被任何一种向量范数所诱导）。提示：算子范数需要满足某些必要条件，只需找到一个$F$范数不满足的必要条件即可。

=== 答案
考虑最简单的$I_n$，在任何算子范数意义下，$norm(I_n):= max_(norm(x)=1)norm(I_n dot.c x) eq.triple 1$，但在矩阵$F$范数意义下，$norm(I_n):= n != 1$，因此矩阵$F$范数不是算子范数。

== Q2.2
=== 问题
证明：矩阵 $A$ 的 $2$ 范数等于其最大奇异值，即
$
norm(A)_2 = max_(norm(x)_2=1) norm(A x)_2 = sqrt(lambda_max)
$

=== 答案
$
norm(A x)_2 = sqrt((A x)^T (A x)) = sqrt(x^T (A^T A) x)
$

同时注意到$A^T A$是半正定矩阵（因为$x^T A^T A x>=0$，特征值满足$lambda_1 >= dots.c >= lambda_n >= 0$），对应的特征向量$alpha_1 dots.c alpha_n$构成$RR^n$的一组标准正交基，那么设$x=sum_(i=1)^n k_i alpha_i$，因为$norm(x)=1$，所以有$sum_(i=1)^n k_i^2=1$

带入上式，有
$
A^T A x = A^T A dot.c (sum_(i=1)^n k_i alpha_i) = sum_(i=1)^n k_i A^T A alpha_i = sum_(i=1)^n k_i lambda_i alpha_i
$
则
$
x^T A^T A x = sum_(i=1)^n k_i^2 lambda_i <= max_i lambda_i
$
因此
$
sqrt((A x)^T (A x)) <= sqrt(lambda_max)
$
显然当$x=alpha_1$时，等号成立，因此
$
norm(A x)_2 = max_(norm(x)_2=1) norm(A x)_2 = sqrt((A x)^T (A x)) = sqrt(lambda_max)
$

== Q2.3
证明如下有关矩阵范数的不等式：
$
& (a) quad norm(A B)_F <= norm(A)_2 norm(B)_F \
& (b) quad abs(angle.l A "," B angle.r) <= norm(A)_2 norm(B)_* \
$

== 答案
=== (a)

对$A^T A$进行正交对角化：
$
A^T A = Q Lambda Q^T
$
在此基础上，
$
norm(A B)_F^2 = tr((A B)^T(A B)) = tr(B^T A^T A B) = tr(B^T Q Lambda Q^T B) = tr(Q^T B B^T Q Lambda) = tr(Z Z^T Lambda)
$
其中$Z:=Q^T B$

根据$tr$的定义，容易看出上式小于等于$sum_(i=1)^n lambda_i z_i^2$，其中$lambda_i$是$Lambda$的对角元（其最大值为$A$的2-范数的平方，最大奇异值），而$z_i^2$是$Z Z^T$的第$i$个对角元（$Q$是正交矩阵，因此$Z Z^T$的对角元最大值为$B$的F-范数的平方），因此有
$
norm(A B)_F^2<=norm(A)_2^2 norm(B)_F^2
$

=== (b)

对$B$进行SVD分解：
$
B = U Sigma V^T
$
带入内积定义：
$
angle.l A , B angle.r = tr(A B^T) = tr(A^T U Sigma V^T) = tr(V^T A^T U Sigma)
$
设$Z:=V^T A^T U$，则
$
angle.l A , B angle.r = tr(Z dot.c Sigma)
$

同样按照上面的证明思路，上式小于等于$sum_(i=1)^n z_i sigma_i$，其中$z_i$是$Z$的第$i$个对角元（在正交变化下保证2-范数不变），而$sigma_i$是$Sigma$的第$i$个对角元（其最大值为$B$的核范数），因此有

$
angle.l A , B angle.r <= norm(A)_2 norm(B)_*
$

== Q2.4
=== 问题
设矩阵$A$为
$
A = mat(
    I, B;
    B^T, I;
)
$
其中$norm(B)_2 < 1$，$I$为单位矩阵。证明$A$可逆且
$
norm(A)_2 norm(A^(-1))_2 = (1+norm(B)_2)/(1-norm(B)_2)
$

=== 答案
$
A^(-1) = 1/abs(I-B B^T) mat(
    I, -B;
    -B^T, I;
)
$

实在是没什么思路，sorry，后面会补上的。

== Q2.5
=== 问题

计算下面矩阵变量函数的导数

- $f(X) = a^T X b$
- $f(X) = tr(X^T A X)$
- $f(X) = ln(det(X)), det(X)>0$

=== 答案

- $nabla f(X) = a b^T$
- $nabla f(X) = (A + A^T)X$
- $nabla f(X) = X^(-T)$