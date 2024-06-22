#set text(
  font: ("linux libertine", "Source Han Serif SC", "Source Han Serif"),
  size: 10pt,
)
#show math.equation: it => text(size: 10pt, math.display(it))
#let dcases(..args) = {
  let dargs = args.pos().map(it => math.display(it))
  math.cases(..dargs)
}

#show image: it => align(center, it)
#show heading.where(level: 3): it => highlight(it)

#let Real = "Re"
#let Imaginary = "Im"

#set page(
  header: context [
    #h(1fr)
    #if counter(page).get().first() > 1 [
      *Homework 16 Ans*
    ]
  ],
  footer: context [
    #let headings = query(selector(heading.where(level: 2)).before(here()))
    #if headings.len() > 0 {
      text(size: 8pt, headings.last().body)
    }
    #h(1fr)
    #counter(page).display(
      "1/1",
      both: true,
    )
  ],
)

#align(center)[
  = Homework 16 Ans
  2024 Spring 数学分析 B2

  Ma.
]

== 6.12 Ans

=== 1(3)

$
  integral_2^(+oo) (dif x) / (x^u ln x)
$

+ $u<=1$, then $1/(x^u ln x)>=1/(x ln x)$, we have:
  $
    integral_2^(+oo) (dif x) / (x^u ln x) >= integral_2^(+oo) (dif x) / (x ln x) = lim_(t->+oo) ln ln t = +oo
  $

+ $u>1$, since $ln x$ is strictly increasing, we have:

  $
    integral_2^(+oo) (dif x) / (x^u ln x) <= integral_2^(+oo) (dif x) / (x^u ln 2) < +oo
  $

  Or more generally, since $1/(ln x) -> 0 quad (x->+oo)$, and $integral_2^(+oo) (dif x)/(x^u)<+oo$, with Dirchelet (Page 301, Theorem 13.7), we can show that:

  $
    integral_2^(+oo) (dif x) / (x^u ln x) < +oo
  $

So the integral converges for $u>1$.

=== 1(5)

$
  integral_0^(+oo) (sin^2 x) / (x^alpha (1+x)) dif x
$

First split the integral into two parts:

$
  I = I_1 + I_2 =integral_0^1 (sin^2 x) / (x^alpha (1+x)) dif x + integral_1^(+oo) (sin^2 x) / (x^alpha (1+x)) dif x
$

// Note than when $I=integral_0^(+oo)dif x$ converges, a necessary & sufficient condition is that both $I_1=integral_0^1 dif x$ and $I_2=integral_1^(+oo)dif x$ converge. (This differs from splitting into, say $I_1=integral_0^(+oo) f_1 dif x$ and $I_2=integral_0^(+oo) f_2 dif x$, where the in-convergance of $I$ is not guaranteed by the convergance of $I_1$ and $I_2$, or vice versa.)

+ We start by discussing $I_1$:

  $
    (sin^2 x) / (x^alpha (1+x)) tilde x^2 / x^alpha = x^(2-alpha)
  $

  So integral $I_1 = integral_0^1 (sin^2 x)/(x^alpha (1+x))$ and $integral_0^1 1/(x^(alpha - 2))$ have the same convergance, and the latter converges if $alpha - 2 < 1$, i.e. $alpha < 3$.

+ The second part $I_2$ requires some techniques.

  + Let's first show the case for $alpha>0$:

    $
      integral_1^(+oo) (sin^2 x) / (x^alpha (1+x)) dif x = 1 / 2 integral_1^(+oo) (1-cos x) / (x^alpha (1+x)) = 1 / 2(
        integral_1^(+oo)1 / (2x^alpha (1+x)) dif x-integral_1^(+oo) (cos 2x) / (2x^alpha (1+x)) dif x
      ) = 1 / 2 (I_3 + I_4)
    $

    // This is what I meant by in-convergance of $I_1, I_2$ can't deduce the in-convergance of $I$, luckily in this case we can prove both are under $alpha >=0$

    It's trivial to prove $I_3$ converges with $alpha >0$. For $I_4$, since $integral_1^A cos 2x dif x$ is always bounded, $1/(x^alpha (1+x))$ is strictly decreasing, with Dirchelet, we can show that $I_4$ converges for $alpha >=0$.

  + With $alpha=0$:

    $I_3=integral_1^(+oo)1/(1+x)dif x$ no longer converges, but $I_4$ remains convergent, so $I_2$ diverges for $alpha=0$

  + Then there's the case for $alpha<0$:

    $
      integral_1^(+oo) (sin^2 x) / (x^alpha (1+x)) dif x >= integral_1^(+oo) (sin^2 x) / (1+x) dif x -> +oo
    $

    Thus $I_2$ diverges for $alpha<0$.

To sum up, $I$ converges for $0<alpha<3$.

=== 1(6)

$
  integral_0^(+oo) ln(1+x^2) / x^alpha dif x
$

The idea is shared:

$
  I= I_1 + I_2 = integral_0^1 ln(1+x^2) / x^alpha dif x + integral_1^(+oo) ln(1+x^2) / x^alpha dif x
$

+ For $I_1$, as $x->0$:

  $
    ln(1+x^2) / x^alpha tilde x^2 / x^alpha = x^(2-alpha)
  $

  So $I_1$ converges if $2-alpha > -1$, i.e. $alpha < 3$.

+ For $I_2$, the key is to use *logrithm is smaller than any power function when $x->+oo$*, so for $alpha> 1$

  $
    0<(ln (1+x^2)) / x^alpha <= x^((alpha-1) / 2) / x^alpha = 1 / x^((alpha+1) / 2)
  $

  We can show $I_2$ is convergent, for $alpha<=1$, use simple inequality:

  $
    ln(1+x^2) / x^alpha >= 1 / x^alpha >0
  $

  Thus $I_2$ diverges for $alpha<=1$. To sum up, $I$ converges for $1<alpha<3$.

=== 2(2)

$
  integral_0^(+oo) e^(alpha x) sin(beta x) dif x
$

+ When $0<alpha_0<=alpha<+oo$:

  $
    abs(e^(alpha x) sin(beta x))<=e^(alpha_0 x)
  $

  With the fact that $integral_1^(+oo)e^(alpha_0 x)dif x$ is convergent and Weierstrass M-test, we can show that $integral_0^(+oo)e^(alpha x) sin(beta x) dif x$ uniformly converges.

+ When $0<alpha<+oo$, except for $beta=0$ (which is a trivial case), we can show that $ integral_0^(+oo)e^(alpha x) sin(beta x) dif x $ doesn't uniformly converges (with Q3).

For this question, we can actually calculate the integral:

$
  integral e^(alpha x) sin(beta x) = integral Imaginary(e^(alpha x) dot e^(i beta x)) = Imaginary(integral e^(alpha + i beta x)) = Imaginary(-1/(alpha + i beta)) = - Imaginary(alpha - i beta) / (alpha^2-beta^2) = beta / (alpha^2 - beta^2)
$

This would provide the same result as above.


=== 2(4)

$
  integral_1^(+oo) (ln (1+x^2)) / (x^alpha) dif x quad (1< alpha<+oo)
$

This depends on Q4 as well. As shown in Q1(6), $integral_1^(+oo) (ln (1+x^2)) / (x^alpha)$ converges on $alpha>1$, but not $alpha=1$. So the integral is *not* uniformly convergent.

=== 2(5)

$
  integral_1^(+oo) e^(-alpha x) (cos x) / x^p dif x quad (0<=alpha<+oo, p>0)
$

Given that $abs(e^(-alpha x)) <=1 quad forall 1<x<+oo space.quad 0<=alpha <+oo$ is decreasing and strictly bounded, we now proof $integral_1^(+oo) (cos x)/x^p dif x$ is uniformly convergent (with respect to $alpha$), which is to say we just need to prove its convergance. With these two facts, we can show that the integral is uniformly convergent using Abel's Theorem.

+ For $p>1$:

  Given $abs(integral_1^A cos x)<2$ and $1/x^p arrow.br 0$, using Dirchelet, we can show that $integral_1^(+oo) (cos x) / x^p dif x$ converges.

+ For $0<p<=1$, use integrate by parts:

  $
    integral_1^(+oo) (cos x) / x^p dif x = [(sin x) / x^p]_1^(+oo) + p integral_1^(+oo) (sin x) / x^(p+1) dif x
  $

  That turns the discussion from $p in (0,1]$ to $p+1 in (1,2]$, as above.

+ Another much faster solution for this:

  Consider splitting $x$ based on $cos x < 0$ or $cos x >0$:

  $
    integral_1^(+oo) (cos x) / (x^p) = integral_1^(pi / 2) (cos x) / (x^p) + sum_(n=1)^oo integral_(pi / 2 + (
      n-1
    ) pi)^(pi / 2 + n pi) (cos x) / (x^p)
  $

  This is a alternating series, after this step, don't use Mean Value Theorem for integrals, which you have no control of $xi_n$ over $[pi/2+(n-1)pi, pi/2+n pi]$. Instead, for each nearby interval, subtract them directly, then one would have:

  $
    integral_(pi / 2+(n-1)pi)^(pi / 2+n pi) (cos x) / (x^p) + (cos (x+pi / 2)) / ((x+pi / 2)^p) >0
  $

So the alternating series have a decreasing absolute value, and the integral converges. Thus for $p>0$, the integral uniformly converges.

=== 2(6)

$
  integral_0^(+oo) (sin(x^2)) / (1+x^p) dif x quad (0<=p<+oo)
$

Same as above, we just prove $integral_0^(+oo) sin(x^2) dif x <+oo$, alongside the fact that $1/(1+x^p) arrow.br quad (p>0)$ (also bounded), this would enough to show uniformly convergent with Abel's Theorem.

To save some time, we use the same method as above, to turn the integral to a alternating series. However directly invoking the mothod won't work:

$
  integral_0^(+oo) sin(x^2) = sum_(n=0)^(+oo) integral_(sqrt(n pi))^(sqrt((n+1) pi)) sin(x^2)
$

Consider substitute $x^2 -> u$:

$
  integral_0^(+oo) sin(x^2) dif x &= integral_0^(+oo) (sin x) / (2 sqrt(x)) dif x\
  &= sum_(n=0)^(+oo) integral_(2 n pi)^(2 (n+1) pi) sin(x) / (2 sqrt(x)) dif x
$

With the same idea, we subtract the nearby intervals:

$
  &quad integral_(2 n pi)^(2 (n+1) pi) sin(x) / (2 sqrt(x)) dif x + integral_(2 (n+1) pi)^(2 (
    n+1
  ) pi) sin(x) / (2 sqrt(x)) dif x \
  &=integral_(2 n pi)^(2 (n+1) pi) sin(x) / (2 sqrt(x)) - sin(x) / (2 sqrt(x+pi)) dif x\
  & > 0
$

(skipping some details.)

Thus the integral converges, and uniformly converges for $p>0$.

=== 3

If $f(x,u)$ is continous on $a<=x<+oo, alpha<=u<=beta$. For every $u in [alpha, beta)$, integral $integral_a^(+oo) f(x,u) dif x$ converges, but not when $u=beta$, which is to say $integral_a^(+oo) f(x, beta) dif x$. Prove that $integral_a^(+oo)f(x,u) dif x$ mustn't be uniformly convergent on $[alpha, beta)$.

As scary it might seems, this isn't that hard to prove. Using contradiction, let's first say $integral_a^(+oo)f(x,u) dif x$ is uniformly convergent on $[alpha, beta)$, then $forall epsilon > 0, exists X > a, forall A_1,A_2 > X &$
$
  & abs(integral_(A_1)^(A_2) f(x,u) dif x)<epsilon / 2 quad forall u in [alpha, beta)
$

(Cauchy Criterion for uniform convergent)

Given $f(x,u)$ 's continoutiy on $[a,+oo)times[alpha, beta]$, $u->beta^-$, we have:

$
  forall epsilon' > 0, exists delta_u>0, forall u in (beta - delta_u, beta) quad abs(f(x,u) - f(x,beta))<epsilon'
$

Take $epsilon' = epsilon/(2 (A_2 - A_1))$, then we have

$
  abs(integral_(A_1)^A_2 f(x,beta) dif x) &<= abs(integral_(A_1)^(A_2) f(x,u) dif x) + abs(integral_(A_1)^(A_2) f(x,beta) - f(x, u) dif x)\
  &= epsilon / 2 + epsilon / (2 (A_2 - A_1)) dot (A_2 -A_1) < epsilon
$

This is contradictory to $integral_a^(+oo) f(x, beta)$'s divergance, thus the original assumption is wrong, and $integral_a^(+oo) f(x,u) dif x$ mustn't be uniformly convergent on $[alpha, beta)$.

== 6.14 Ans

=== 6

Prove that $F(alpha):=integral_0^(+oo) (cos x)/(1+(x + alpha)^2)$ is continous and differentiable on $alpha in [0, +oo)$.

- Continuity:

  $
    abs((cos x)/(1+(x+alpha)^2)) <= 1 / (1+x^2) quad x,alpha >=0
  $

  Since $integral_0^(+oo) 1/(1+x^2)$ is convergent, based on Weierstrass, we know that $F(alpha)$ is unifromly convergent on $[0,+oo)$, thus $F(alpha)$ is continous.

- Differentiable:

  $
    diff / (diff alpha) ((cos x) / (1+(x+alpha)^2)) = cos x dot (- (2 (x+a)) / ((1+(x+alpha)^2)^2))
  $

  Control the sizes:

  $
    abs(diff/(diff alpha) ((cos x)/(1+(x+alpha)^2))) <= 2 dot (x+a) / (1+(x+alpha)^2)^2
  $

  Below is a solution I copied from someone's homework

  $
    integral_0^(+oo) 2 dot (x+a) / (1+(x+alpha)^2)^2 dif x = 2 integral_a^(+oo) x / (
      1+x^2
    )^2 dif x = integral_sqrt(a)^(+oo) (dif u) / (1+u)^2 <integral_0^(+oo) (dif u) / (1+u)^2 <+oo
  $

  Based on Weierstrass, we know $integral_0^(+oo) (diff)/(diff alpha)((cos x)/(1+(x+alpha)^2)) dif x$ is uniformly convergent, thus $F(alpha)$ is differentiable on $[0,+oo)$.

  Note: *THIS IS WRONG*. To use Weierstrass, one would have to strictly construct a $abs(f(x,u))<g(x), forall u$, otherwise it's still pointwise than uniform.

  Quick way to do fix this is by comparing $(x+a)/((1+(x+a)^2)^2)$ with $x/(1+x^2)^2$, note that $x/(1+x^2)^2$ is strictly decreasing at $x>1$, so the correct way to do so is just:

  $
    integral_1^(+oo) 2 dot (x+a) / (1+(x+alpha)^2)^2 dif x < 2 dot integral_1^(+oo) x / (1+x^2)^2 dif x
  $

  The range for $alpha$ isn't changed here, only the starting point of the integral, unifromly convergance holds. For proof, recall: uniformly convergent $<=>$
  $
    lim_(A->+oo) sup_(u in [alpha, beta]) abs(integral_A^(+oo) f(x,u) dif x) = 0
  $

  Or if one could figure it out, use inequality like this:
  $
    2 dot (x+a) / (1+(x+alpha)^2)^2 <= 2 dot (x+a) / (1+(x+alpha)^4) <= 3 / (1+(x+alpha)^3) <= 3 / (1+x^3)
  $

  The following inequality is used here:
  $
    3+3(x+alpha)^4>=2(x+alpha)^4+4(x+alpha)>=2(x+alpha^4)+2(x+alpha)=2(x+alpha)(1+(x+alpha)^3)
  $

=== 7(2)

$
  integral_0^(+oo) (1-e^(-a x)) / (x e^x) dif x
$


$
  integral_0^(+oo) (1-e^(-a x)) / (x e^x) dif x &= integral_0^(+oo) (e^(-1 dot x) - e^((-a -1) x)) / (x)dif x\
  &=integral_0^(+oo) dif x integral_(-a-1)^(-1) e^(k x) dif k
$

$
  &phi(k) = integral_0^(+oo) e^(k x) dif x = -1 / k quad k <= k_0 < 0 \
$

Consider that: $e^(k x) <= e^(k_0 x)$, also $integral_0^(+oo) e^(k_0 x) <+oo$. $phi(k)$ is uniformly convergent on $[-a-1, -1]$, thus:

$
  integral_0^(+oo) (1-e^(-a x)) / (x e^x) dif x &= integral_0^(+oo) dif x integral_(-a-1)^(-1) e^(k x) dif k\
  &= integral_(-a-1)^(-1) phi(k) dif k\
  &= [-ln (-k)]_(k=-a-1)^(k=-1) = ln(a+1)
$

=== 7(5)

$
  integral_0^(+oo) (arctan a x) / (x (1+x^2)) dif x
$

$
  (arctan a x) / (x (1+x^2)) &= 1 / (x (1+x^2)) arctan x u |_(u = 0)^(u=a) \
  &=integral_0^a 1 / ((1+u^2 x^2)(1+x^2)) dif u
$

$
  phi(u) = integral_0^(+oo) 1 / ((1+u^2 x^2)(1+x^2)) dif x
$

Consider $1 / ((1+u^2 x^2)(1+x^2)) <= 1/(1+x^2)$. With Weierstrass, $phi(u)$ is uniformly convergent on $[0,a]$, thus:

$
  integral_0^(+oo) dif x integral_0^a 1 / ((1+u^2 x^2)(1+x^2)) dif u = integral_0^(+a) dif u integral_0^(+oo) 1 / ((
    1+u^2 x^2
  )(1+x^2)) dif x
$

$
  integral_0^(+oo) 1 / ((1+u^2 x^2)(
    1+x^2
  )) dif x &= - u^2 / (1-u^2) integral_0^(+oo) 1 / (1+u^2x^2) dif x + 1 / (1-u^2) integral_0^(+oo) 1 / (1+x^2) dif x\
  &= - u / (1-u^2) arctan u x|_0^(+oo) + 1 / (1-u^2) arctan x|_0^(+oo) \
  &= pi / 2(-u / (1-u^2) + 1 / (1-u^2))\
  &= pi / 2 1 / (1+u)
$

So the original intergral becomes:

$
  integral_0^a 1 / (1+u) dif u = pi / 2 ln(a+1)
$

=== 7(6)

$
  integral_0^(+oo) [e^(-(a^2\/x^2))- e^(-(b^2\/ x^2))] dif x
$

Wihtout substituting variables, after a few tries, you can see it's impossible to make the form.
$
  &(diff) / (diff u) e^(-u^2\/x^2) = -(2u) / x^2 e^(-u^2\/x^2)\
  &(diff) / (diff u) (1 / u e^(-u^2\/x^2)) = (-(2u) \/ x^2 dot e^(-u^2\/x^2)dot u-e^(-u^2\/x^2)) / (u^2) \
  &(diff) / (diff u) (u e^(-u^2\/x^2)) = e^(-u^2\/x^2) - 2u^2 / x^2 e^(-u^2\/x^2)
$

Consider substitute $1\/x -> y$:

$
  &integral_(oo)^0 [e^(-a^2 y^2)-e^(-b^2 y^2)] (dif y) / (y^2)\
  &=integral_0^(+oo) [e^(-a^2 y^2) - e^(-b^2 y^2)] / (-y^2) dif y\
$

$
  (diff) / (diff v) e^(-v dot y^2) = -y^2 dot e^(-v dot y^2)
$

$
  [e^(-a^2 y^2) - e^(-b^2 y^2)] / (-y^2) = integral_b^a e^(-v y^2) dif v
$

$
  phi(v) = integral_0^(+oo) e^(-v y^2) dif y = sqrt(pi) / (2 sqrt(v))
$

$
  e^(-v y^2) <= e^(-b y^2) quad forall v in [a,b]
$

$
  integral_0^(+oo) [e^(-a^2 y^2) - e^(-b^2 y^2)] / (-y^2) dif y = integral_(a^2)^(b^2) phi(v) dif v = sqrt(pi) dot (b-a)
$

=== 8(1)

$
  &quad integral_(-oo)^(+oo) x / (sigma sqrt(2 pi)) exp(-1/2 ((x-a)/sigma)^2) dif x \
  &=integral_(-oo)^(+oo) (x+a) / (sigma sqrt(2 pi)) exp(-1/2 ((x)/sigma)^2) dif x\
  &=integral_(-oo)^(+oo) x / (sigma sqrt(2 pi)) exp(-1/2 ((x)/sigma)^2) dif x + integral_(-oo)^(+oo) a / (sigma sqrt(2 pi)) exp(-1/2 ((x)/sigma)^2) dif x\
  &= 0 + a / (sigma sqrt(2pi)) integral_(-oo)^(+oo) exp(-1/2 ((x)/sigma)^2) dif x\
  &= a
$

This is the expectation of the normal distribution, which is its mean.

=== 8(3)


$
  integral_0^(+oo) (sin a x cos b x) / x dif x &= integral_0^(+oo) (sin (a+b)x + sin(a-b)x) / (2x) dif x\
  &=dcases(
  1/2(pi/2 + pi/2) &= pi/2 quad & a!=b,
  1/2(pi/2 + 0) &= pi/4 quad &a=b,
)
$

*Note:*

$
  integral_0^(+oo) (sin A x) / x dif x = dcases(
  integral_0^(+oo) (sin A x)/(A x) dif (A x) = pi/2 quad& A!=0,
  0 quad& A = 0
)
$


=== 8(6)

$
  integral_0^(+oo) (sin^4 x) / (x^2) dif x &= integral_0^(+oo) 1 / x^2 (sin^2 x-1 / 4sin^2 2x) dif x\
  &=integral_0^(+oo) ((sin^2 x) / x^2 - (sin^2 2x) / (2x)^2) dif x\
  &=integral_0^(+oo) (sin^2 x) / x^2 dif x - 1 / 2 integral_0^(+oo) (sin^2 2x) / (2x)^2 dif (2x)\
  &=1 / 2integral_0^(+oo) (sin^2 x) / x^2 dif x\
  &=1 / 2integral_o^(+oo) sin^2 x dif (-1 / x)\
  &=1 / 2[-(sin^2 x) / x |_0^(+oo) - integral_0^(+oo)2 / x sin x cos x dif x]\
  &=1 / 2 integral_0^(+oo) (sin 2x) / (2x) dif (2x)\
  &=pi / 4
$
