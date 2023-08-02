#align(center, text(20pt)[
    *Sobolev inequalities and related problems*
])
#align(center, text(12pt)[
    Tiankai Ma
])
#align(center, text(12pt)[
    #datetime.today().display("[year]-[month]-[day]")
])
#set math.equation(numbering: "(1)")




= Abstract

In this note, we will discuss the following problem:

- Let $u in W^(1,p)(RR^n)$ be a nonnegative function, and $p > 1$. Show that there exists a constant $C(n, p)$ such that the following inequality holds:$ (integral_ (RR^n) abs(u)^(p^*) dif x)^(1/p^*) <= C(n, p) (integral_ (RR^n) abs(nabla u)^p dif x)^(1/p) $(where $p^*$ is the Sobolev conjugate of $p$. (i.e. $1/p - 1/p^* = 1/n$))
- Discuss Sobolev inequality
- Discuss Gagliardo-Nirenberg inequality
- Discuss Talenti inequality





= Note
== Introduction
=== Previous inequalities

- Triangle inequality: $ abs(x + y) <= abs(x) + abs(y) $
- Cauchy inequality: $ abs(x y) <= abs(x) abs(y) $
- Young inequality: $ x y <= a^p/p + b^q/q $ where $1/p + 1/q = 1$, $x, y, a, b >= 0$
- Holder inequality: $ integral_ (RR^n) abs(f g) dif x <= (integral_ (RR^n) abs(f)^p dif x)^(1/p) (integral_ (RR^n) abs(g)^q dif x)^(1/q) $ where $1/p + 1/q = 1$
- Jesen inequality: $ f(integral_ (RR^n) g) <= integral_ (RR^n) f(g) dif x $ where $f$ is a convex function

#pagebreak()




=== Sobolev space

To introduce the background of Sobolev inequality, we discuss the following problem:

$ -Delta u = f $

here $f$ might not be continous, might just be $L^2$ function.

To solve this, we find the minimizer of the following functional:

$ J(u) = 1/2 integral_ (Omega) abs(nabla u)^2 dif x - integral_ (Omega) f u dif x $($u in CC^(infinity)_0(RR_n)$)

We take:

$ J(u + epsilon phi) = 1/2 integral_ (Omega) abs(nabla u + epsilon nabla phi)^2 dif x - integral_ (Omega) f (u + epsilon phi) dif x $($u, phi in CC^(infinity)_0(RR_n)$)

When u is the minimizer, we have:

$ d/(d epsilon) J(u + epsilon phi) = 0 "at" epsilon = 0 $

$ d/(d epsilon) J(u + epsilon phi) = integral_ (Omega) nabla u nabla phi dif x - integral_ (Omega) f phi dif x $

Consider $ integral nabla u nabla phi + integral Delta u phi = 0 $

we have: $ integral_ (Omega) Delta u phi dif x + integral_ (Omega) f phi dif x = 0 $

Since $phi$ is arbitrary, we have: $ -Delta u = f $

Thus leading to the weak solution of the PDE.

#rect(fill: aqua.lighten(80%))[
    #text(fill: red)[
        *Question:* When $f in L^2$, when does $integral u dot f$ make sense?
    ]

    #text(fill: blue)[
        *When $u in L^2$, $f in L^2$*, we have $ integral u dot f <= (integral abs(u)^2)^(1/2) (integral abs(f)^2)^(1/2) < infinity $
    ]
]

Thus the Sobolev space is introduced:

$ W^(1,2)(Omega) = { u in L^2(Omega) | nabla u in L^2(Omega) } $

Measure of $W^(1,2)(Omega)$ is defined as $ norm(f)_(W^(1,2)(Omega)) = (integral abs(f)^2 + integral abs(nabla f)^2)^(1/2) $

_Trivial_: $W^(1,2)(Omega)$ defines normed space.

We can also define $W^(1,p)(Omega)$ for $p > 2$ likewise: $ norm(f)_(W^(1,p)(Omega)) = (integral abs(f)^p + integral abs(nabla f)^p)^(1/p) $

#pagebreak()




== Sobolev inequality

#rect(fill: yellow.lighten(80%))[
    If Sobolev inequality holds, we have:

    $ norm(f)_(L^(p^*)(Omega)) <= C norm(f)_(W^(1,p)(Omega)) $

    That leads to the following statement:

    $ f in W^(1,p)(Omega) => f in L^(p^*)(Omega) $

    Notice $p^* > p$, thus Sobolev inequality is a statement about the integrability of the function.
]

*We want to discuss:*

When does Sobolev inequality hold?
- What's the best constant $C(n,p)$?
- What's the extremal function of the inequality?
    - Existence
    - Expression

Previous works show that:

$ u(x) = 1/((a + b dot abs(x)^(p/(p-1)))^((n-p)/p)) $

$ C(n,p) = 1/(sqrt(pi)n^(1/p))((p-1)/(n-p))^(1-1/p) ((Gamma(1 + n/2)Gamma(n)) / (Gamma(1 + n - n/p)Gamma(n/p)))^(1/n) $


#rect(fill: aqua.lighten(80%))[
    #text(fill: red)[
        *Question:* For $1/p^* = 1/p - 1/n$ to hold, we must have $p<n$, what happens when $p=n$?
    ]

    #text(fill: blue)[
        *Theorem: $forall q >= n$, $ norm(u)_(L^q(RR^n)) <= (omega_(n-1))^(1/q - 1/n) ((q + 1 - q/n)/n)^(1/q - 1/n +1) norm(u)_(W^(1,n)(RR^n)) $where $omega_(n-1) = abs(SS^(n-1))$, volume of the unit sphere in $RR^n$.*
    ]
]

Approximation of the constant:

$ ((q + 1 - q/n)/n)^(1/q - 1/n +1) tilde.op q^((n-1)/n) (1/n)^((n-1)/n) $

#text(fill: red.lighten(50%))[
    _The $1/n$ here is actually $1/n - 1/n^2$, I'm not sure if I've missed something or just doesn't matter._
]

Given by Trudinger in 1967, we have:

$ norm(u)_(L^q (RR^n)) <= C q^((n-1)/n) norm(u)_(W^(1,n)(RR^n)) $

#pagebreak()





== Further discussion

$ integral e^u &= sum_(j=0)^infinity 1/(j!) integral u^j = sum_(j=0)^infinity 1/(j!) norm(u)_(L^j)^j\
               &<= sum_(j=0)^infinity 1/(j!) (C dot j^((n-1)/n) norm(u)_(L^n))^j\
                &= C sum_(j=0)^infinity j^(j dot (n-1)/n) / (j!) norm(u)_(L^n)^j\ $

Using Strling's formula ($n! tilde.op n^n/e^n sqrt(2 pi n)$) , we have:

$ j^(j dot (n-1)/n) / (j!) tilde.op 1/(e^(-j + j/n) n^(j/n + 1/2) (j/n)!) <= C^prime 1/((j/n)!) $

Rewrite the sum, we have:

$ sum_(j=0)^infinity j^(j dot (n-1)/n) / (j!) norm(u)_(L^n)^j <=C^' sum_(j=0)^infinity norm(u)_(L^n)^j / ((j/n)!) 
  = C' e^(norm(u)_(L^n)^n) $

Thus we have:

$ integral e^u <= C e^(norm(u)_(L^n)^n) $

#rect(fill: yellow.lighten(80%))[
    This is called Orlicz-Sobolev inequality. Orlicz space is defined as:

    $ L^Phi(Omega) = { u in L^1(Omega) | integral Phi(abs(u)/lambda) dif x <= 1 } $

    In 1971, Moser proved that:

    $ sup_(norm(nabla u)_(L^n) <= 1) integral e^(alpha_n u^(n/(n-1))) <= infinity $ ($u in CC_0^infinity (Omega), alpha_n = n omega_(n-1)^(1/(n-1)), omega_(n-1) := abs(SS^(n-1))$)
]



#pagebreak()
















= Homework

== Question 1.1
#rect(fill: yellow.lighten(80%))[
    Why the power on the left hand side has to be such $p^*$

    #text(fill: blue)[
        Hint: try replace $u(x)$ by $u(lambda x)$, after change of variables, you will see that in order to guarantee that Sobolev inequality are independent of the scaling of $u$, the power on the left hand side has to be $p^*$
    ]
]

== Answer
#text(fill: blue)[
    Subsitute $u$ by $u(lambda x)$, we have

    $ "LHS" = (integral_ (RR^n) abs(u(x))^(p^*) lambda^n dif x)^(1/p^*)
            = lambda^(n/p^*) (integral_ (RR^n) abs(u(x))^(p^*) dif x)^(1/p^*) $

    $ "RHS" = C(n, p) (integral_ (RR^n) abs(nabla u(x))^p lambda^(p-n) dif x)^(1/p)
            = lambda^(n/p - 1) C(n, p) (integral_ (RR^n) abs(nabla u(x))^p dif x)^(1/p) $

    For independence of scaling, we need $n/p^* = n/p - 1$, which gives $1/p^* = 1/p - 1/n$. Q.E.D.
]

== Question 1.2
#rect(fill: yellow.lighten(80%))[
    It has been shown during class that the extremal functions of Sobolev inequality should satisfy the following semilinear PDE:

    $ - "div"(abs(nabla u)^(p-2) nabla u) = C abs(u)^(p^*-2) u $

    On the other hand, applying the moving plane method, we can show the positive solution of the above equation has to be radially decreasing. Combinging the two results, please try to reduce the above equation to a second order ODE and solve it:
]


== Answer
#text(fill: blue)[

    Let $u(x) = v(r)$, where $r = abs(x)$, then we have

    $ cases(
        nabla u = x/r v'(r),
        abs(nabla u) = v'(r)
    ) $

    $ "LHS" &= -"div"(abs(nabla u)^(p - 2) nabla u) = -"div"(v'(r)^(p - 2) x v'(r)) = -"div"(v'(r)^(p - 1) x)\
            &= -(p - 1) v'(r)^(p - 2) v''(r) - (p - 1) v'(r)^(p - 3) v''(r)\
            &= -(p - 1) v'(r)^(p - 3) v''(r) (v'(r) + (p - 2))\
    "RHS" &= C abs(u)^(p^* - 2) u\
            &= C v(r)^(p^* - 2) v(r) $

    Thus we have

    $ -(p - 1) v'(r)^(p - 3) v''(r) (v'(r) + (p - 2)) = C v(r)^(p - 2) v(r) $

    Simiplify it, we have

    $ -(p - 1) v'(r)^(p - 3) v''(r) (v'(r) + (p - 2)) = C v(r)^(p - 2) v(r) $
]

= References

#lorem(1000)
