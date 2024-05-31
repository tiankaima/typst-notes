== HW8
Due 2024.05.31

#import "@preview/diagraph:0.2.1": *
#let ans(it) = [
  #pad(1em)[
    #text(fill: blue)[
      #it
    ]
  ]
]
#show math.equation: it => [
  #math.display(it)
]
#show image: it => align(center, it)

=== Q1

试证明对不含冲突数据集 (即特征向量完全相同但标记不同) 的训练集, 必存在与训练集一致 (训练误差为 0) 的决策树

#ans[
  由于训练集中不含有冲突数据, 即特征向量完全相同但标记不同的数据, 那么对于每一个特征向量, 都有唯一的标记与之对应. 因此, 我们可以构造一个决策树, 使得每一个叶子节点对应一个特征向量, 并且该叶子节点的标记与该特征向量的标记一致. 这样, 我们就得到了一个与训练集一致的决策树.
]

=== Q2

最小二乘学习方法在求解 $min_w (X w-y)^2$ 问题后得到闭式解 $w^*=(X^T X)^(-1)X^T y$ (为简化问题, 我们忽略误差项 $b$). 如果我们知道数据中部分特征有较大的误差, 在不修改损失函数的情况下, 引入规范化项 $lambda w^T D w$, 其中 $D$ 为对角矩阵, 由我们取值. 相应的最小二乘分类学习问题转换为以下形式化的优化问题:

$
  min_w [(X w-y)^2 + lambda w^T D w]
$

+ 请说明选择规范化项 $w^T D w$ 而非 $L_2$ 规范化项 $w^T w$ 的理由是什么. $D$ 的对角线元素 $D_(i i)$ 有何意义, 它的取值意味着什么?

  #ans[
    选择规范化项 $w^T D w$ 而非 $L_2$ 规范化项 $w^T w$ 的理由是因为 $D$ 可以用来指定特征的重要性. 例如, 如果我们知道某些特征的误差较大, 那么我们可以将 $D$ 的对角线元素 $D_(i i)$ 设置为较大的值, 从而使得对应的特征在优化过程中受到更大的惩罚. 这样, 我们就可以在不修改损失函数的情况下, 通过引入规范化项 $w^T D w$ 来调整特征的重要性.

    $D$ 的对角线元素 $D_(i i)$ 的取值意味着对应特征的重要性. 如果 $D_(i i)$ 的取值较大, 那么对应的特征在优化过程中受到的惩罚也较大, 从而使得该特征在最终的模型中的权重较小. 反之, 如果 $D_(i i)$ 的取值较小, 那么对应的特征在优化过程中受到的惩罚也较小, 从而使得该特征在最终的模型中的权重较大.
  ]
+ 请对以上问题进行求解:
  #ans[
    $
      L(w) &= (X w-y)^2 + lambda w^T D w\
      (diff L) / (diff w) &= 2 X^T (X w-y) + 2 lambda D w = 0\
      w &= (X^T X + lambda D)^(-1) X^T y
    $
  ]

=== Q3

假设有 $n$ 个数据点 $x_1, ... x_n$ 以及一个映射 $phi: x->phi(x)$, 以此定义核函数 $K(x,x')=phi(x) dot phi(x')$. 试证明由该核函数决定的核矩阵 $K: (k_(i j)) quad k_(i j) = K(x_i, x_j)$ 有以下性质:

+ $K$ 是一个对称矩阵
+ $K$ 是一个半正定矩阵

#ans[
  考虑 $k_(i j) = phi(x_i) dot phi(x_j)$, $k_(i j)=k_(j i)$ #highlight[对称性是显然的], 并且有:

  $
    K = phi dot phi^T = (phi(x_1), ... ,phi(x_n))^T dot (phi(x_1), ... ,phi(x_n))
  $

  因此有:

  $
    forall x in RR^n quad x^T K x = x^T phi dot phi^T x = (phi^T x)^T phi^T x = norm(phi^T x)^2 >= 0
  $

  得到$K$ 是半正定矩阵.
]

=== Q4

已知正例点 $x_1=(1,2)^T,x_2=(2,3)^T, x_3=(3,3)^T$, 负例点 $x_4=(2,1)^T, x_5=(3,2)^T$, 试求 Hard Margin SVM 的最大分割超平面和分类决策树, 并在图上画出分离超平面、间距边界以及支持向量.

#ans[
  考虑分类结果的 Margin 由以下两个超平面确定:
  $
    w^T x + alpha = 0
    w^T + beta = 0
  $

  优化目标是: $max_(w,b) (abs(alpha-beta))/norm(w)$, 不失一般性的, 我们可以转变为讨论 $max_(w,b) 1/norm(w)$, 或者为方便计算梯度, 采用下面的形式:
  $
    min_(w,b) 1 / 2 norm(w)^2 = min_(w,b) 1 / 2 w^T w
  $

  约束条件是正确分类, 即正例点满足 $w^T x+b>0$, 负例点满足 $w^T x+b<0$. 由此我们可以得到以下约束:
  $
    y_i dot (w^T x_i+b) >= 1
  $

  因此我们可以得到以下优化问题:
  $
    &min_(w,b) 1 / 2 w^T w\
    s.t. quad & y_i (w^T x_i+b) >= 1
  $

  考虑对偶问题, 我们可以得到以下拉格朗日函数:
  $
    L(w,b,alpha) = 1 / 2 w^T w - sum alpha_i (y_i dot (w^T x_i+b) - 1)
  $

  此时优化问题:

  $
    min_(w,b) max_(alpha_i >=0) L(w,b,alpha) = max_(alpha_i >=0) min_(w,b) L(w,b,alpha)
  $

  计算梯度, 我们可以得到以下结果:
  $
    (diff L) / (diff w) = w - sum alpha_i y_i x_i = 0\
    (diff L) / (diff b) = -sum alpha_i y_i = 0\
  $

  代入得到:
  $
    &max_(alpha_i>=0) [-1 / 2 sum_(i,j) alpha_i alpha_j y_i y_j x_i^T x_j + sum_i alpha_i]\
    &s.t. quad sum_i alpha_i y_i = 0
  $

  计算得到: $w=(-1,2)^T, b = -2$, 超平面方程: $-x+2y-2=0$

  #image("./img/Solution_HW8_Q4.png", width: 70%)
]

=== Q5

计算 $diff_(w_j) L_(C E)(w,b)$, 其中:

$
  L_(C E)(w,b)=-[y log sigma(w dot x+b)+(1-y)log(1-sigma(w dot x+b))]
$

已知:
$
  diff_z sigma(z) = diff_z (1 / (1+e^(-z))) = e^(-z) / (1+e^(-z))^2 = sigma(z) (1-sigma(z))
$

#ans[
  $
    &-diff_(w_j) L_(C E)\
    &= y / (sigma(w dot x+b)) dot (diff_(w_j) sigma(w dot x+b)) + (1-y) / (1-sigma(w dot x+b)) dot (
      diff_(w_j) (1-sigma(w dot x+b))
    )\
    &=x_j dot (
      y / (cancel(sigma(w dot x+b))) dot cancel(sigma(w dot x + b)) (
        1-sigma(w dot x+b)
      ) - (1-y) / cancel(1-sigma(w dot x+b)) dot sigma(w dot x + b) (cancel(1-sigma(w dot x+b)))
    )\
    &=(y-sigma(w dot x+b))dot x_j
  $

  因此
  $
    diff_(w_j) L_(C E) = (sigma(w dot x+ b) -y) dot x_j
  $
]

=== Q6

K-means 算法是否一定会收敛? 如果是, 给出证明过程; 如果不是, 给出说明

#ans[
  只需考虑优化目标随优化次数的序列 ${L_i}$, 即经过 $i$ 次优化, 数据划分为: $(w_1, ..., w_k)$, 此时优化目标:
  $
    L_i = sum_(j=1)^k sum_(x in w_j) norm(x - mu_j)^2
  $

  容易发现 $L_(i+1) < L_i$, 且 $L_i >=0$, 根据单调有界定理, 我们可以得到 $L_i$ 收敛. 因此 K-means 算法一定会收敛.
]