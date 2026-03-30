Notes on this post:

$
  1=lim_(n->0)sqrt(n+sqrt(n+sqrt(n+ ...)))
$

Some argues it's $0$ or $1$, that's simply because the form is ill-defined and the post is misleading intentionally, here's another way to look at this:

define $f_m$ as a series of functions:

$
  f_m (x) = underbrace(sqrt(x+sqrt(x+sqrt(x+...))), "m times")
$

In this form we have two ways to write the original limit:

$
  lim_(n->0) lim_(m->oo) f_m (n)
$

or

$
  lim_(m->oo) lim_(n->0) f_m (n)
$

Limits are not interchangeable by default, and orders matter, when $display(lim_(n->0) f_m (n))$ comes first it's undoubtedly $0$, when $display(lim_(m->oo) f_m (n))$ comes first it's $1$.

Here's how $f_m (x)$ looks like with $m=1,2,3,4,5$: (Credit: WolframAlpha)

#image("image.png")

I hope this clears things up.