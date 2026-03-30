#show math.equation: it => math.display(it)

= $L^1$ norm minimization problem

*Def 7.2*

A finite-dimensional linear $L^1$ norm minimization problem is defined as:

$
&O_(alpha, B) = { k | k = "argmin"_k norm(a-k B)_1 } quad quad a in RR^n, k in RR^m, B in RR^(m times n)\
// &O_B = {k | k in O_(alpha, B) | forall alpha in RR^n } = union_(alpha in RR^n) O_(alpha, B)\
$

*Def 7.3*

The characteristic function space of the set $O_(alpha, B)$ is defined as:

$
Lambda_B &= {f | f in RR^m, \#f(O_(alpha,B)) = 1, forall alpha in RR^n } subset V(RR^n)\
$

Here we treat $f(k) = f dot k$ ($L^2$ inner product) as a function $f: RR^m -> RR$

*Prop 7.2*

Notice that the characteristic function space of the optimization problem is a linear space:

$
forall f, g in Lambda_B, forall alpha, quad quad & \# f(O_(alpha,B)) = \# g(O_(alpha,B)) = 1\
forall a,b in RR, quad quad & (a dot f + b dot g)(k) := a dot f(k) + b dot g(k)\
=>& \# (a dot f + b dot g)(O_(alpha, B)) = 1\
$

*Prop 7.3*

If the matrix $B=(b_(i,j))_(1<=i<=m, 1<=j<=n)$
- contains at most one nonzero element than one row (let it be the $j_0$-th row)

- $forall i, forall n_j in {0,1}(forall j) quad sum_(j=1)^n (-1)^(n_j) b_(i,j) != 0$

then we can show $f=(b_(i,j_0)) in RR^m$ is a characteristic linear function of the optimization problem, which is to say $f in Lambda_B$

*Proof:*

Use induction:

- $m=1$

  The target function $g_alpha (k) = sum_(j=1)^n abs(a_(j) - k b_(j))$ is a piecewise convex function of $k$, since the slope at each piece $(dif g_alpha)/(dif k) = sum_(j=1)^n (-1)^(n_j) b_(j) !=0 quad forall n_j in {0,1}(forall j)$, (For $k = a_j\/b_j$ points, its left and right derivitives holds the same property) which means $g_alpha (k)$ is a stricly convex function.

  Provided that the solution exists, using contradiction, we can show the solution is unique, so $ forall alpha quad \# O_(alpha, B) = 1 $ which would mean $ forall f: RR -> RR quad \# f(O_(alpha, B)) = 1 $ then $f_j (k) = b_j dot k$ is a characteristic function of the optimization problem. ($forall j$), a even stronger statement for $m = 1$

  $qed$

- Assumng the statement holds for $forall m < M$, let $b_(M,j_0) != 0$.

  Consider $k_i, i={1,dots.c, M-1}$ are fixed, $g_alpha (k) = g_alpha (k_1, dots.c, k_(M-1), k_M) = g_alpha (k_M)$ is a stricly convex piecewise function of $k_M$, which could be shown similarly to the $m=1$ case:

  $
  (diff g_alpha)/(diff k_M) = sum_(j=1)^(n) (-1)^(n_j) b_(M,j) != 0
  $

  The best $k_M$ could be any turning point as $k_i, i={1, dots, M-1}$ varies, which can be written as:

  $
  & k_M in {a_l/b_(i,j_0) | b_(i,l)!=0 quad forall i} := S_(M,l) quad exists l != j_0\
  "or" quad & k_M = 1/b_(M,j_0) (a_(j_0) - sum_(i=1)^(M-1) k_i b_(i,j_0))\
  $

  If $k_M$ in the optimal set $O_alpha$ is unique, by induction $f_0(k) = sum_(i=1)^(M-1) k_i dot b_(i,j_0)$ is unique, then $ f(k) = sum_(i=1)^M k_i dot b_(i,j_0) $ is unique.

  Otherwise consider $k_(M 1) != k_(M 2)$ in $O_alpha$, we denote:

  $
  k_1 = (k_11, k_21, dots.c, k_(M 1)) \
  k_2 = (k_12, k_22, dots.c, k_(M 2)) \
  $

  Take a mapping $lambda in [0,1] -> RR^m$ using the convex combination:

  $
  k_lambda = lambda k_1 + (1-lambda) k_2 = (k_i)_i
  $

  By convex property of $O_alpha$, we have $k_lambda in O_alpha$. Select a $lambda$ with the following conditions: (which is the case for $forall lambda in [0,1]quad a.e$)

  $
  &lambda k_(M 1) + (1-lambda) k_(M 2) in.not S_(M, l) quad forall l != j_0\
  => & k_M := lambda k_(M 1) + (1-lambda) k_(M 2) = 1/b_(M,j_0) (a_(j_0) - sum_(i=1)^(M-1) k_i b_(i,j_0))\
  $

  Then

  $
  sum_(i=1)^M (lambda k_(i 1) + (1-lambda) k_(i 2)) b_(i,j_0) = a_(j_0) quad forall lambda in [0,1] quad a.e.\
  $

  Consider the mapping $[0,1] ->^lambda RR^m ->^(g_(a )) RR$ is continous, $[0,1] subset RR$ is compact, we can expand the result to $RR$ (considering it's constant at each segaments (finite), and continous in $RR$)
  $
  sum_(i=1)^M (alpha k_(i 1) + (1-alpha) k_(i 2)) b_(i,j_0) = a_(j_0) quad forall alpha in RR
  $

  So the linear function $f(k)=sum_(i=1)^M k_i b_(i, j_0)$ is the characteristic function of the optimization problem.

  $qed$