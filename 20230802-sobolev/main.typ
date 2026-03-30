#align(
  center,
  text(20pt, font: "New Computer Modern Math")[
    *Lecture Notes: Sobolev inequalities*
  ],
)
#align(
  center,
  text(12pt)[
    Tiankai Ma
  ],
)
#align(
  center,
  text(12pt)[
    #datetime.today().display("[year]-[month]-[day]")
  ],
)
#set math.equation(numbering: "(1)")

// = Abstract

// In this lecture, we will discuss the following problem:

// - Let $u in W^(1,p)(RR^n)$ be a nonnegative function, and $p > 1$. Show that there exists a constant $C(n, p)$ such that the following inequality holds:$ (integral_ (RR^n) abs(u)^(p^*) dif x)^(1/p^*) <= C(n, p) (integral_ (RR^n) abs(nabla u)^p dif x)^(1/p) $(where $p^*$ is the Sobolev conjugate of $p$. (i.e. $1/p - 1/p^* = 1/n$))
// - Discuss Sobolev inequality
// - Discuss Gagliardo-Nirenberg inequality
// - Discuss Talenti inequality

// #pagebreak()

#text(fill: blue)[
  *Text colored in blue were added after class.*
]
= Preknowledge
== Weak derivative

#text(fill: red)[
  *From now on, we'll refer to weak derivative as just derivative, and classical derivative as classical derivative.*
]

Weak derivative is introduced to generalize the concept of derivative to functions that are not differentiable in the classical sense.

Using _integration by parts theorem_, we can extend the definition of derivative to a larger class of functions (e.g. $u in L^1(Omega)$).

#rect(fill: yellow.lighten(80%))[
  *Definition:*
  $u in L^1_"loc" (Omega)$ is said to have a weak derivative $v in L^1_"loc" (Omega)$ if:

  $
  integral_Omega u(x) phi^prime (x) dif x eq.triple - integral_Omega v(
    x
  ) phi(x) dif x space.quad forall phi in CC_c^infinity (Omega)
  $

  In this case, we say $v$ is the weak derivative of $u$ and write $v = u^prime$.

  *Generalization:*
  In $n$ dimensons, and multi-index $alpha = (alpha_1, alpha_2, ..., alpha_n)$, if we have:

  $
  integral_Omega u(x) D^alpha phi(x) dif x eq.triple (-1)^(abs(alpha)) integral_Omega v(
    x
  ) phi(x) dif x space.quad forall phi in CC_c^infinity (Omega)
  $

  here $ D^alpha u = (diff^abs(alpha) u) / (diff x_1^(alpha_1) diff x_2^(alpha_2) ... diff x_n^(alpha_n)) $

  We say $v$ is the weak derivative of $u$ and write $v = D^alpha u$.
]

*Properties:*

Weak derivatives are well-defined in the sense that:

- if $u$ has a weak derivative $v$, then $v$ is unique.

$ cases(v_1 = D^alpha u, v_2 = D^alpha u) => v_1 eq.triple v_2 space.quad a.e. $

- If $u in C^k(Omega)$, then $D^alpha u = D^alpha u$ (classical derivative)

#pagebreak()
== Holder continuity

#rect(fill: yellow.lighten(80%))[
  *Definition:*
  $u$ is said to be Holder continuous with exponent $gamma$ if there exists a constant $C$ such that:

  $ abs(u(x) - u(y)) <= C abs(x-y)^gamma space.quad forall x,y in Omega $

  We write $u in C^(0, gamma)(Omega)$
]

Norm on Holder space is defined as:

$
norm(u)_(C^(0, gamma)(Omega)) = norm(u)_(C^(0) (Omega)) + [u]_gamma = sup u(
  x
) + sup_(x != y) abs(u(x) - u(y)) / abs(x - y)^gamma
$

*Properties:*

- A function on an interval satisfying the condition with $gamma > 1$ is constant.

*Proof:*
$
f: I -> Y \
f in C^(0, gamma)(I) => f in C^(0)(I)
$

If $f$ isn't constant, say $x != y, f(x) != f(y)$, then let:
$
x_i(n) &= x + i / n (y - x) space.quad i = 0, 1, ..., n, forall n in NN \
d_Y (f(y), f(x)) &<= sum_(i = 1)^n d_Y (f(x_i(n)), f(x_(i-1)(n))) \
&<= C sum_(i = 1)^n abs(x_i(n) - x_(i-1)(n))^gamma = C sum_(i = 1)^n abs(y - x)^gamma / n^gamma
$

So we have:
$ d_Y (f(y), f(x))<= C abs(y - x)^gamma n^(1-gamma) space.quad forall n in NN $

Since $d_n -> 0 (n -> infinity), 1 - gamma < 0$, we have that, for $epsilon = d_Y (f(y), f(x)) > 0, exists n_0$ that $d_(n_0) < epsilon$, which is a contradiction.

So $forall x, y in I, f(x) = f(y)$, which means $f$ is constant.

- If $gamma = 1$, then the condition is Lipschitz continuity.
- The condition implies uniform continuity.

#pagebreak()
= Note
== Introduction
=== Previous inequalities

- Triangle inequality: $ abs(x + y) <= abs(x) + abs(y) $
- Cauchy inequality: $ abs(x y) <= abs(x) abs(y) $
- Young inequality: $ x y <= x^p/p + y^q/q $ where $1/p + 1/q = 1$, $x, y >= 0$
- Holder inequality: $ integral_ (RR^n) abs(f g) dif x <= (integral_ (RR^n) abs(f)^p dif x)^(1/p) (integral_ (RR^n) abs(g)^q dif x)^(1/q) $ where $1/p + 1/q = 1$
- Jesen inequality: $ f(integral_ (RR^n) g) <= integral_ (RR^n) f(g) dif x $ where $f$ is a convex function

#pagebreak()
=== Background

To introduce the background of Sobolev inequality, we start by discussisng the following problem:

$ Delta u + f = 0 $

Here $f$ might not be continous, might just be $L^2$ function.

To solve this, we first find the minimizer of the following functional:

$ J(u) = 1 / 2 integral_(Omega) abs(nabla u)^2 dif x - integral_(Omega) f u dif x $
($u in CC^(infinity)_c (RR_n)$, meaning that $abs(u != 0) < infinity$)

We take:

$
J(u + epsilon phi) = 1 / 2 integral_(Omega) abs(nabla u + epsilon nabla phi)^2 dif x - integral_(Omega) f (
  u + epsilon phi
) dif x
$($u, phi in CC^(infinity)_c (RR_n)$)

When u is the minimizer, we have:

$ dif / (dif epsilon) J(u + epsilon phi) = 0 "at" epsilon = 0 $

$ dif / (dif epsilon) J(u + epsilon phi) = integral_(Omega) nabla u nabla phi dif x - integral_(Omega) f phi dif x $

Consider $ integral nabla u nabla phi + integral Delta u phi = integral_(diff Omega) nabla u dot phi eq.triple 0 $

we have:

$
integral_(Omega) Delta u phi dif x + integral_(Omega) f phi dif x & eq.triple 0, forall phi in CC_0^infinity (RR^n) \
=> Delta u + f &= 0
$

Thus leading to the weak solution of the PDE.

#rect(fill: aqua.lighten(80%))[
  #text(fill: red)[
    *Question:* When $f in L^2$, when does $integral u dot f$ make sense?
  ]

  #text(fill: blue)[
    *When $u in L^2$, $f in L^2$*, using Holder, we have $ integral u dot f <= (integral abs(u)^2)^(1/2) (integral abs(f)^2)^(1/2) < infinity $
  ]
]

#pagebreak()
=== Sobolev space

Sobolev space is introduced:

$
W^(1,2)(Omega) &= {u in L^2(Omega) | nabla u in L^2(Omega)} \
norm(u)_(W^(1,2)(Omega)) &= (integral abs(u)^2 + integral abs(nabla u)^2)^(1 / 2)
$

_Trivial_: $W^(1,2)(Omega)$ defines normed space.

#text(fill: blue)[

  We can also define $W^(1,p)(Omega)$ for $p > 2$ likewise:

  $
  W^(1,p)(Omega) = {u in L^p (Omega) | nabla u in L^p(Omega)}\
  norm(u)_(W^(1,p)(Omega)) = (integral abs(u)^p + integral abs(nabla u)^p)^(1 / p)
  $

  More generally, we can define $W^(k,p)(Omega)$ for $k in NN$:

  $
  W^(k,p)(Omega) = {u in L^p (Omega) | D^alpha u in L^p (Omega), forall 0 <= abs(alpha) <= k}\
  norm(u)_(W^(k,p)(Omega)) = (sum_(0 <= abs(alpha) <= k) integral abs(D^alpha u)^p)^(1 / p) \
  norm(u)_(W^(k, infinity)) = "esssup"_(x in Omega) sum_(0 <= abs(alpha) <= k) abs(D^alpha u(x))
  $

  _Note:_ Sobolev space is a Hilbert space, and it's a Banach space for $p > 1$.
]

#pagebreak()
== Sobolev inequality

#rect(fill: yellow.lighten(80%))[
  If Sobolev inequality holds, we have:

  $ norm(f)_(L^(p^*)(Omega)) <= C norm(f)_(W^(1,p)(Omega)) $

  That leads to the following statement:

  $ f in W^(1,p)(Omega) => f in L^(p^*)(Omega) $

  Notice $p^* > p$, thus Sobolev inequality is a statement about the integrability of the function.
]

*Discussions:*

- If and when does Sobolev inequality hold?
- What's the best constant $C(n,p)$?
- What's the extremal function of the inequality?
  - Existence
  - Expression

Previous works show that:

$ u(x) = 1 / ((a + b dot abs(x)^(p / (p-1)))^((n-p) / p)) $

$
C(n,p) = 1 / (sqrt(pi)n^(1 / p))((p-1) / (n-p))^(1-1 / p) (
  (Gamma(1 + n/2)Gamma(n)) / (Gamma(1 + n - n/p)Gamma(n/p))
)^(1 / n)
$

#rect(fill: aqua.lighten(80%))[
  #text(fill: red)[
    *Question:* For $1/p^* = 1/p - 1/n$ to hold, we must have $p<n$, what happens when $p=n$?
  ]

  #text(fill: blue)[
    *Theorem: $forall q >= n$, $ norm(u)_(L^q (RR^n)) <= (omega_(n-1))^(1/q - 1/n) ((q + 1 - q/n)/n)^(1/q - 1/n +1) norm(u)_(W^(1,n)(RR^n)) $where $omega_(n-1) = abs(SS^(n-1))$, volume of the unit sphere in $RR^n$.*
  ]
]

Approximation of the constant:

$ ((q + 1 - q / n) / n)^(1 / q - 1 / n +1) tilde.op q^((n-1) / n) (1 / n)^((n-1) / n) $

#text(fill: red.lighten(50%))[
  _The $1/n$ here is actually $1/n - 1/n^2$, I'm not sure if I've missed something or just doesn't matter._
]

Given by Trudinger in 1967, we have:

$ norm(u)_(L^q (RR^n)) <= C q^((n-1) / n) norm(u)_(W^(1,n)(RR^n)) $

We can show that:
$
integral e^u &= sum_(j=0)^infinity 1 / (j!) integral u^j = sum_(j=0)^infinity 1 / (j!) norm(u)_(L^j)^j\
&<= sum_(j=0)^infinity 1 / (j!) (C dot j^((n-1) / n) norm(u)_(L^n))^j\
&= C sum_(j=0)^infinity j^(j dot (n-1) / n) / (j!) norm(u)_(L^n)^j\
$

Using Strling's formula ($n! tilde.op n^n/e^n sqrt(2 pi n)$) , we have:

$ j^(j dot (n-1) / n) / (j!) tilde.op 1 / (e^(-j + j / n) n^(j / n + 1 / 2) (j / n)!) <= C^prime 1 / ((j / n)!) $

Rewrite the sum, we have:

$
sum_(j=0)^infinity j^(j dot (n-1) / n) / (j!) norm(u)_(L^n)^j <=C^' sum_(j=0)^infinity norm(u)_(L^n)^j / ((j / n)!)
= C' e^(norm(u)_(L^n)^n)
$

Thus we have:

$ integral e^u <= C e^(norm(u)_(L^n)^n) $

#rect(fill: yellow.lighten(80%))[
  This is called Orlicz-Sobolev inequality. Orlicz space is defined as:

  $ L^Phi (Omega) := {u in L^1(Omega) | integral Phi(abs(u)/lambda) dif x <= 1} $

  In 1971, Moser proved that:

  $
  sup_(norm(nabla u)_(L^n) <= 1) integral e^(alpha_n u^(n / (n-1))) <= infinity
  $ ($u in CC_0^infinity (Omega), alpha_n = n omega_(n-1)^(1/(n-1)), omega_(n-1) := abs(SS^(n-1))$)
]

Before we continue, let's prove the following inequalities:

#pagebreak()
=== Gagliardo-Nirenberg-Sobolev inequality

#rect(fill: yellow.lighten(80%))[
  _Goal:_ Say $1<= p < n$, there exisits $C(n,p)$ such that:
  $
  norm(u)_(L^(p^*)(RR^n)) <= C norm(D u)_(L^p (RR^n)) space.quad forall u in W^(1,p)(RR^n)
  $
]

*Proof:*

_Step 1:_ $p = 1, p^* = n/(n-1)$

$
abs(u(x)) &= abs(integral_(- infinity)^(x_i) diff _i u(x_1, ..., x_i, ..., x_n) dif x_i)
&<= integral_(- infinity)^infinity abs(nabla u) dif x_i
$

$
abs(u(x))^(n / (n-1)) &<= (product_(i=1)^n integral_(- infinity)^x_i abs(nabla u) dif x_i)^(1 / (n-1)) \
integral_(- infinity)^infinity abs(u(x))^(n / (n-1)) dif x_1
&<= integral_(- infinity)^infinity (
  product_(i=1)^n integral_(- infinity)^x_i abs(nabla u) dif x_i
)^(1 / (n-1)) dif x_1 \
&= (integral_(-infinity)^infinity abs(nabla u) dif x_1)^(1 / (n-1)) integral_(- infinity)^infinity (
  product_(i=2)^n integral_(- infinity)^infinity abs(nabla u) dif y_i
)^(1 / (n-1)) dif x_1 \
&<= (integral_(-infinity)^infinity abs(nabla u) dif x_1)^(1 / (n-1)) product_(i=2)^n (
  integral_(- infinity)^infinity integral_(- infinity)^infinity abs(nabla u) dif x_1 dif y_i
)^(1 / (n-1)) \
$

Repeating this process, it's trivial to show that:
$
integral_(RR^k) abs(u)^(n / (n-1)) dif x_1 dif x_2 ... dif x_k \
<= product_(i=1)^k (integral_(RR^k) abs(nabla u) dif x_1 dif x_2 ... dif x_k)^(1 / (n - 1))
product_(i=k+1)^n (integral_(RR^(k+1)) abs(nabla u) dif x_1 dif x_2 ... dif x_k dif y_i)^(1 / (n - 1))
$

Subsitute $k = n$, we have:
$
integral_(RR^n) abs(u)^(n / (n-1)) dif x &<= (integral_(RR^n) abs(nabla u) dif x)^(n / (n - 1)) \
(integral_(RR^n) abs(u)^(n / (n-1)) dif x)^((n - 1) / n) &<= integral_(RR^n) abs(nabla u) dif x \
$

_Step 2:_ $1 < p < n$

Subsitute $u$ with $u^gamma$, we have:
$
(integral_(RR^n) abs(u)^((gamma n) / (n-1)) dif x)^((n - 1) / n) &<= integral_(RR^n) abs(nabla abs(u)^gamma) dif x \
&= gamma integral abs(u)^(gamma - 1) abs(nabla u) dif x \
&<= gamma (integral abs(u)^(((gamma -1) p) / (p - 1)) dif x)^((p-1) / p) (integral abs(nabla u)^p dif x)^(1 / p)
$

Last inequality uses Holder inequality.

Letting $(gamma n)/(n-1) = ((gamma -1)p)/(p - 1)$, we have $ gamma = (p(n - 1))/(n - p)$, thus:
$(gamma n)/(n-1) = ((gamma -1)p)/(p - 1) = p^*$, leading to the final result.

#pagebreak()
#text(fill: blue)[
  === Morrey inequality
]

#rect(fill: yellow.lighten(80%))[
  _Goal:_ Assuming $n < p <= infinity$. Then there exists a constant $C= C(n,p)$ (depending only on $n$ and $p$, not with $u$), for every $u in C^1(RR^n) sect L^p (RR^n)$, we have:

  $ norm(u)_(C^(0,gamma)(RR^n)) <= C norm(u)_(W^(1,p)(RR^n)) space.quad gamma = 1 - n / p $

  Thus: if $u in W^(1,p) (RR^n)$, then $u$ is Holder continuous with exponent $gamma = 1 - n/p$.(after a possible redefinition on a set of measure zero)
]

*Proof:*

$forall x in RR^n, rho > 0, z in diff B_1, 0 < t < rho$,

$ abs(u(x+t z) - u(x)) = abs(integral_0^t dif / (dif s) u(x + s z) dif s) <= integral_0^t abs(nabla u(x + s z)) dif s $

$
integral_(diff B(0, 1)) abs(u(x+t z) - u(x)) dif z &<= integral_0^t integral_(diff B(
  0, 1
)) abs(nabla u(x + s z)) dif z dif s \
&= integral_(B(0, 1)) abs(nabla u(y)) / (abs(x - y)^(n - 1)) dif y
$

$
integral_(B (x, rho)) abs(u(y) - u(x)) dif y &= integral_0^rho dif s integral_(diff B(x, s)) abs(u(y) - u(x)) dif y \
&= integral_0^rho s^(n-1) dif s integral_(diff B(0, 1)) abs(u(x + s z) - u(x)) dif s \
&<= integral_0^rho s^(n-1) dif s integral_(B(x, rho)) abs(nabla u(y)) / (abs(x - y)^(n-1)) dif s \
&= rho^n / n integral_(B(x, rho)) abs(nabla u(y)) / (abs(x - y)^(n-1)) dif s
$

Setting $rho = 1$, we have:

$
abs(u(x)) &<= 1 / abs(B(0,1)) (integral_(B(0,1)) abs(u(x) - u(y)) + abs(u(y)) dif y) \
&<= 1 / n integral_(B(0,1)) abs(nabla u(y)) / (abs(x - y)^(n-1)) dif y + 1 / abs(B(0,1)) integral_(B(
  0,1
)) abs(u(y)) dif y \
&<= C_1 norm(nabla u)_(L^p) + C_2 norm(u)_(L^p (B(0,1))) \
&<= C norm(u)_(W^(1,p) (RR^n))
$

Equation holds for every $x$, thus we have:

$
sup_(x in RR^n) abs(u(x)) <= C norm(u)_(W^(1,p) (RR^n))
$

Estamating $abs(u(x) - u(y))$, take $rho = abs(x - y), O = B(x, rho) sect B(y, rho)$,

$
abs(u(x) - u(y)) <= 1 / abs(O) integral_O abs(u(x) - u(z)) dif z &+ 1 / abs(O) integral_O abs(u(y) - u(z)) dif z \
1 / abs(O) integral_O abs(u(x) - u(z)) dif z
&<= C 1 / abs(B(x, rho)) integral_(B(x, rho)) abs(u(x) - u(z)) dif z \
&<= C 1 / abs(B(x, rho)) rho^n / n integral_(B(x, rho)) abs(nabla u(z)) / (abs(x - z)^n) dif z \
&<= C rho^(1- n / p) norm(nabla u)_(L^p (B(x, rho)))
$

Given all that,

$
norm(u)_(C^(0, gamma) (RR^n)) <= C norm(u)_(W^(1,p) (RR^n)) space.quad gamma = 1-n / p
$

#pagebreak()
= Homework
== Question 1.1

#rect(fill: yellow.lighten(80%))[
  Why the power on the left hand side has to be such $p^*$

  #text(fill: red)[
    Hint: try replace $u(x)$ by $u(lambda x)$, after change of variables, you will see that in order to guarantee that Sobolev inequality are independent of the scaling of $u$, the power on the left hand side has to be $p^*$
  ]
]

== Answer
#text(fill: blue)[
  Subsitute $u$ with $u(lambda x)$, we have

  $
  "LHS" = (integral_(RR^n) abs(u(x))^(p^*) lambda^n dif x)^(1 / p^*)
  = lambda^(n / p^*) (integral_(RR^n) abs(u(x))^(p^*) dif x)^(1 / p^*)
  $

  $
  "RHS" = C(n, p) (integral_(RR^n) abs(nabla u(x))^p lambda^(p-n) dif x)^(1 / p)
  = lambda^(n / p - 1) C(n, p) (integral_(RR^n) abs(nabla u(x))^p dif x)^(1 / p)
  $

  Since $C(n,p) tilde.not u(x) \/ u(lambda x)$, we need $lambda^(n/p^*) eq.triple lambda^(n/p - 1) => n/p^* = n/p - 1$, which gives $1/p^* = 1/p - 1/n$.
]

== Question 1.2
#rect(fill: yellow.lighten(80%))[
  It has been shown during class that the extremal functions of Sobolev inequality should satisfy the following semilinear PDE:

  $ - "div"(abs(nabla u)^(p-2) nabla u) = C abs(u)^(p^*-2) u $

  On the other hand, applying the moving plane method, we can show the positive solution of the above equation has to be radially decreasing. Combinging the two results, please try to reduce the above equation to a second order ODE and solve it:
]

== Answer
#text(fill: blue)[
  // Using spherical coordinates, we have
  $
    // nabla u &= ((diff u)/(diff r), 1/r nabla_theta u) \
    -"LHS" &= nabla(abs(nabla u)^(p-2)nabla u) = (p-2)abs(nabla u)^(p-2)laplace u + abs(nabla u)^(p-2) laplace u = (p-1)abs(nabla u)^(p-2)laplace u \
    &= - C abs(u)^(p^*-2) u
    $

  Deducing to ODE: (and taking $p = 2, u > 0$)
  $
  (diff^2 u) / (diff x^2) = -C u^(2^* - 1)
  $

  General solution for this ODE is:
  $
  u =
  $
]

#text(fill: red)[
  #strike[
    Haven't come up with a solution yet, will update later
  ]
]

#pagebreak()
== Question 2
#rect(fill: yellow.lighten(80%))[
  Assuming the Sobolev inequalties:
  $ norm(u)_(L^q (Omega)) <= C q^((n-1) / n) norm(u)_(L^n(Omega)) $
  holds for any $q >= 1$, try to prove the following exponential type inequality (will need to use Stirling formula):
  $
  integral_Omega e^u dif x <= C e^(mu norm(u)_(L^n)^n) space.quad C, mu "are some constants"
  $
]

== Answer
#text(fill: blue)[
  _This is already proven in previous sections, copying the proof here for completeness:_

  We can show that:
  $
  integral e^u &= sum_(j=0)^infinity 1 / (j!) integral u^j = sum_(j=0)^infinity 1 / (j!) norm(u)_(L^j)^j\
  &<= sum_(j=0)^infinity 1 / (j!) (C dot j^((n-1) / n) norm(u)_(L^n))^j\
  &= C sum_(j=0)^infinity j^(j dot (n-1) / n) / (j!) norm(u)_(L^n)^j\
  $

  Using Strling's formula ($n! tilde.op n^n/e^n sqrt(2 pi n)$) , we have:

  $ j^(j dot (n-1) / n) / (j!) tilde.op 1 / (e^(-j + j / n) n^(j / n + 1 / 2) (j / n)!) <= C^prime 1 / ((j / n)!) $

  Rewrite the sum, we have:

  $
  sum_(j=0)^infinity j^(j dot (n-1) / n) / (j!) norm(u)_(L^n)^j <=C^' sum_(j=0)^infinity norm(u)_(L^n)^j / ((j / n)!)
  = C' e^(norm(u)_(L^n)^n)
  $

  Thus we have:

  $ integral e^u <= C e^(norm(u)_(L^n)^n) $

  Notice you could just take $C^prime = C e^mu$ for a cleaner formula.
]
