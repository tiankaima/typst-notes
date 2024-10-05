#import "@preview/colorful-boxes:1.3.1": *

#set text(font: ("New computer Modern", "Source Han Serif SC", "Source Han Serif"))
#show raw: set text(font: "New Computer Modern Mono")
#set page(
  header: [
    USTC-ML-24 书面作业 #h(1fr) PB21000030 马天开
  ],
  footer: context [
    #let headings = query(selector(heading.where(level: 1)).before(here()))
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
#set heading(numbering: "1.")
#set par(first-line-indent: 1em)
#let problem = (title, it) => outline-colorbox(
  title: title,
  color: "blue",
  radius: 2pt,
  width: auto,
  centering: true,
  it,
)

#align(center)[
  #text(weight: "bold", size: 16pt)[
    Homework 1
  ]
]

#problem("1. Poisson Regression")[
  In this question we will construct another kind of a commonly used GLM, which is called Poisson
  Regression. In a GLM, the choice of the exponential family distribution is based on the kind of problem at hand. If we are solving a classification problem, then we use an exponential family distribution with support over discrete classes (such as Bernoulli or Categorical). Similarly, if the output is real valued, we can use Gaussian or Laplace (both are in the exponential family). Sometimes the desired output is to predict counts, for e.g., predicting the number of emails expected in a day, or the number of customers expected to enter a store in the next hour, etc. based on input features (also called covariates). You may recall that a probability distribution with support over integers (i.e. counts) is the Poisson distribution, and it also happens to be in the exponential family.
  In the following sub-problems, we will start by showing that the Poisson distribution is in the exponential family, derive the functional form of the hypothesis, derive the update rules for training models, and finally using the provided dataset train a real model and make predictions on the test set.
]

#problem("1.1")[
  Consider the Possion distribution parameterized by $lambda$:

  $
    p(y;lambda) = (e^(-lambda) lambda^y) / (y!)
  $

  (here $y$ have positive integer values and $y!$ is the factorial of $y$.) Show that the Possion distribution is in the exponential family, and clearly state the value for $b(y), eta, T(y)$, and $alpha(eta)$.
]

Recall, an exponential family distribution is of the form:

$
  p(y;bold(eta)) = b(y) exp(bold(eta) ^T T(y) - alpha(eta))
$

in this case, we have:

$
  p(
    y;lambda
  ) = underbrace(1 / (y!), b(y)) exp(underbrace(ln(lambda), eta) dot underbrace(y, T(y)) - underbrace(lambda, a(eta)))
$

thus, we have:

$
  cases(
  display(b(y) &= 1 / (y!)),
  eta &= ln(lambda),
  T(y) &= y,
  alpha(eta) &= lambda = e^(eta)
)
$

#problem("1.2")[
  Consider performing regression using a GLM model with a Possion response variable. What is the canonical response function for the family? (You may use the fact that a Possion random variable with parameter $lambda$ has mean $lambda$. )
]

$
  g(eta) = E[T(y); eta] = lambda = e^(eta)
$

#problem("1.3")[
  For a training set ${(x^(i), y^(i)); i = 1, ... n}$, let the log-likelihood of an example be $log(p(y^(i) mid(|) x^(i); theta))$. By taking the derivative of the log-likelihood with respect to $theta_j$, derive the stochastic gradient descent update rule when using a GLM model with Possion responses $y$ and the canonical response function.
]

To start with, we rewrite $p(y; lambda)$ to $p(y|x; theta)$ using $lambda = e^eta = e^(theta^T x)$:

$
  p(y|x; theta) = (e^(-e^(theta^T x)) (e^(theta^T x))^y) / (y!)
$

Therefore:

$
  ln p(y|x; theta) = (y dot theta^T x - e^(theta^T x)) - ln(y!)
$

Considering the log-likelihood of the entire dataset:

$
  partial / (partial theta_j) sum_(i=1)^(n) ln p(y^((i))|x^((i)); theta) = sum_(i=1)^(n) (
    y^((i)) - e^(theta^T x^((i)))
  ) dot x_j^((i))
$

For stochastic gradient descent, we update the parameters as follows:

$
  theta_j <- theta_j + alpha (y^((i)) - e^(theta^T x^((i)))) x_j^((i))
$

or simply put:

$
  theta_j <- theta_j + alpha (y - h_theta (x^((i)))) x_j^((i))
$

#problem("2. Convexity of Generalized Linear Models")[
  In this question we will explore and show some key properties of Generalized Linear Models, specifically those related to the use of Exponential Family Distributions to model the output.

  Most commonly, GLMs are trained by using the negative log-likelihood (NLL) as the loss function. This is broadly equivalent to Maximum Likelihood Estimation (i.e., maximizing the likelihood is the same as minimizing the negative log-likelihood). In this problem, our goal is to show that the NLLloss of a GLM is a convex function w.r.t the model parameters. As a reminder, this is convenient because a convex function is one for which any local minimum is also a global minimum, and there is xtensive research on how to optimize various convex loss functions efficiently with various algorithms such as gradient descent or stochastic gradient descent.

  To recap, an exponential family distribution is one whose probability density can be represented

  $
    p(y;eta) = b(y) exp(eta^T y - alpha(eta))
  $

  where $eta$ is the natural parameter of the distribution. Moreover, in a Generalized Linear Model, $eta$ is modeled as $eta^T x$, where $x in RR^d$ are the input features of the example, and $theta in RR^d$ are learnable parameters. In order to show that the NLL loss is convex for GLMs, we break down the process into sub-parts, and approach them one at a time. Our approach is to show that the second derivative (i.e., Hessian) of the loss w.r.t. the model parameters is Positive Semi-Definite (PSD) at all values of the model parameters. We will also show some nice properties of Exponential Family distributions as intermediate steps.

  For the sake of convenience we restrict ourselves to the case where η is a scalar. Assume

  $
    p(Y|X;theta) ~ "ExponentialFamily"(eta)
  $

  where $eta in RR$ is a scalar and $T(y)=y$. This makes the exponential family representation take the form

  $
    p(y;eta) = b(y) exp(eta y - alpha(eta))
  $
]

#problem("2.1")[
  Derive an expression for the mean of the distribution. Show that $EE[y;eta]=partial/(partial eta) a(eta)$ (note that $EE[Y;eta]=EE[Y|X;eta]$ since $eta=theta^T x$). In other words, show that the mean of an exponential family distribution is the first derivative of the log-partition function with respect to the natrual parameter ($eta$).

  *Hint*: Start by observing that:

  $
    partial / (partial eta) integral p(y;eta)dif y = integral partial / (partial eta) p(y;eta)dif y
  $
]

Notice that $forall eta, integral p(y;eta) dif y = 1$, thus:

$
  partial / (partial eta) integral p(y;eta) dif y = 0
$

// I'm still a bit confused on interchanging the derivative and integral sign, but I'll try to work it out.

For the right hand side, just plug in $p(y; eta)$:

$
  integral partial / (partial eta) p(y;eta) dif y &= integral partial / (partial eta) (
    b(y) exp(eta^T y - alpha(eta))
  ) dif y \
  &= integral p(y; eta) (y - (partial / (partial eta) alpha(eta))) dif y \
  &= integral y dot p(y; eta) dif y - integral (partial / (partial eta) alpha(eta) p(y; eta)) dif y \
  &= EE[y; eta] - partial / (partial eta) alpha(eta)\
  &= 0 quad qed
$

#problem("2.2")[
  Next, derive an expression for the variance of the distribution. In paticular, show that $display("Var"(Y) = (partial^2 a(eta))/(partial eta^2))$ (again, note that $"Var"(Y) = "Var"(Y|X; theta)$). In other words, show that the variance of an exponential family distribution is the second derivative of the log-partition function with respect to the natural parameter ($eta$).

  *Hint*: Build upon the result in the previous sub-problem can simplify the derivation.
]

// Thinking it's relationship to a generating function:

Using the same idea as before:

$
  (partial^2) / (partial eta^2) integral p(y; eta) dif y = integral (partial^2) / (partial eta^2) p(y; eta) dif y
$

For the right hand side, we have:

$
  partial^2 / (partial eta^2) p(y; eta) &= partial / (partial eta) (p(y; eta) (y - partial / (partial eta) a(eta))) \
  &=p(y; eta)(y - partial / (partial eta) a(eta))^2 - p(y; eta) partial^2 / (partial eta^2) a(eta) \
  &=p(y;eta)(
    y^2 - 2y partial / (partial eta) a(eta) + (partial / (partial eta) a(eta))^2 - partial^2 / (partial eta^2) a(eta)
  )\
$

Integrate both sides with respect to $y$:

$
  0 & = E[y^2;eta] - 2 E[y;eta] partial / (partial eta) a(eta) + (
    partial / (partial eta) a(eta)
  )^2 - partial^2 / (partial eta^2) a(eta) \
$

Plug in $display(E[y;eta] = (partial)/(partial eta) a(eta))$:

$
  E[y^2;eta] = (partial / (partial eta) a(eta))^2 + (partial^2) / (partial eta^2) a(eta)
$

So the variance is $display("Var"(Y) = (partial^2) / (partial eta^2) a(eta))$.

#problem("2.3")[
  Finally, write out the loss function $cal(l)(theta)$, the NLL of the distribution, as a function of $theta$. Then, calculate the Hessian of the loss with respect to $theta$, and show that it is always positive semi-definite. This concludes that the NILL loss of GLM is convex.

  *Hint1*: Use the chain rule of calculs along with the results of the previous parts to simplify your derivations.

  *Hint2*: Recall that variance of any probability distribution is always non-negative.
]

The loss function is:

$
  cal(l)(theta) = -sum_(i=1)^(n) ln p(y^((i))|x^((i)); theta)
$

let's first calculate $display((partial)/(partial theta_j)p(y^((i))|x^((i));theta))$:

$
  (partial) / (partial theta_j)p(
    y^((i))|x^((i));theta
  ) &= (partial p) / (partial eta) (partial eta) / (partial theta_j) \
  &= p(y^((i))|x^((i)); theta)(y^((i))-((partial a(eta)) / (partial eta))_(eta = theta^T x^((i))))x_j^((i))
$

Notice here $eta = theta^T x^((i))$. Thus,

$
  (partial cal(l)) / (partial theta_j) &= - sum_(i=1)^n 1 / (p(y^((i))|x^((i));theta)) dot p(y^((i))|x^((i));theta) (
    y^((i)) - lr((partial a(eta)) / (partial eta)|)_(eta = theta^T x^((i)))
  )x_j^((i)) \
  &= - sum_(i=1)^n (y^((i)) - lr((partial a(eta)) / (partial eta)|)_(eta = theta^T x^((i)))) x_j^((i))
$

One step further, we calculate $display((partial^2 cal(l))/(partial theta_j partial theta_k))$:

$
  (partial^2 cal(l)) / (partial theta_j partial theta_k) = sum_(i=1)^n lr(
    (partial^2 a(eta)) / (partial eta^2)|
  )_(eta = theta^T x^((
    i
  ))) x_j^((i)) x_k^((i))
$

The Hessian matrix is:

$
  H = (H_(j k)) = (partial^2 cal(l)) / (partial theta_j partial theta_k)
$

To show it's always positive semi-definite, we define $X = (x_(i j)) = (x_j^((i)))$, and $display(A = (a_(i j)) = lr((partial^2a (eta))/(partial eta^2)|)_(eta = theta^T x^((i))) dot delta_(i j))$, then we have:

$
  H = X^T A X
$

notice $A_(i i) = "Var"(Y^((i))) >= 0$ (Here $Y^((i))$ is a random variable with distribution $p(y^((i))|x^((i));theta)$), thus $A$ is positive semi-definite. To show $H=X^T A X$ is also semi-positive, use definition, forall $y in RR^n$:

$
  y^T H y = y^T X^T A X y = (X y)^T A (X y) >= 0
$

#problem("3. Multivariate Least Squares")[
  So far in class, we have only considered cases where our target variable y is a scalar value. Suppose that instead of trying to predict a single output, we have a training set with multiple outputs for each example:

  $
    {(x^((i)), y^((i))), i = 1, ... m}, quad x^((i)) in RR^n, y^((i)) in RR^p
  $

  Thus for each training example, $y^((i))$ is vector-valued, with $p$ entries. We wish to use a linear model to predict the outputs, as in least squares, by specifying the parameter matrix $Theta$ in:

  $
    y = Theta^T x
  $

  where $Theta in RR^(n times p)$.
]

#problem("3.1")[

  The cost function for this case is:

  $
    J(Theta) = 1 / 2 sum_(i=1)^m sum_(j=1)^p (Theta^T x^((i))_j - y^((i))_j)^2
  $

  Write $J(Theta)$ in matrix-vector notation (i.e., without any summations).

  *Hint*: Start with the $m times n$ design matrix

  $ X = mat((x^((i)))^T; (x^((2)))^T; ...; (x^((m)))^T) $

  and the $m times p$ target matrix:

  $ Y = mat((y^((1)))^T; (y^((2)))^T; ...; (y^((m)))^T) $

  and then work out how to express $J(Theta)$ in terms of these matrices.
]

Let's begin by "guessing" the form:

$
  J(Theta) &= 1 / 2 sum_(i=1)^m norm(Theta^T x^((i)) - y^((i)))_2^2\
  &= 1 / 2 sum_(i=1)^m (Theta^T x^((i)) - y^((i)))^T (Theta^T x^((i)) - y^((i)))\
  &= (...)\
  &= 1 / 2 tr((X Theta - Y) (X Theta - Y)^T)\
$

Now prove the guess:

$
  J(Theta) &= 1 / 2 tr((X Theta - Y) (X Theta - Y)^T)\
  &= 1 / 2 sum_(i=1)^m ((X Theta - Y) (X Theta - Y)^T)_(i i)\
  &= 1 / 2 sum_(i=1)^m (sum_(j=1)^p (X Theta - Y)_(i j) (X Theta - Y)_(j i)^T)\
  &= 1 / 2 sum_(i=1)^m sum_(j=1)^p (X Theta - Y)_(i j)^2 \
$

Notice:

$
  Y_(i j) &= y^((i))_j \
  X Theta &= ((x^((1)))^T, (x^((2)))^T, ..., (x^((m)))^T)^T dot Theta\
  &= Theta^T dot ((x^((1)))^T, (x^((2)))^T, ..., (x^((m)))^T)\
  &= (Theta^T x^((1)), Theta^T x^((2)), ..., Theta^T x^((m))) \
  => quad (X Theta)_(i j) &= (Theta^T x^((i)))_j
$

Thus, we have:

$
  J(Theta) &= 1 / 2 sum_(i=1)^m sum_(j=1)^p (Theta^T x^((i))_j - y^((i))_j)^2 quad qed
$

#problem("3.2")[
  Find the closed form solution for $Theta$ which minimizes $J(Theta)$. This is equivalent to the normal equations for the multivariate case.
]

Note that $tr(A^T A) = tr(A A^T)$, thus:

$
  J(Theta) = 1 / 2 tr((X Theta - Y) (X Theta - Y)^T) = 1 / 2 tr((Theta^T X^T - Y^T) (X Theta - Y))
$

Take the gradient with respect to $Theta$:

$
  nabla_Theta J(Theta) &= 1 / 2 nabla_Theta tr(Theta^T X^T X Theta - Theta^T X^T Y - Y^T X Theta + Y^T Y)\
  &=1 / 2 nabla_Theta tr(Theta^T X^T X Theta - 2 Theta^T X^T Y + Y^T Y)\
  &=1 / 2(X^T X Theta + X^T X Theta - 2 X^T Y)\
  &=X^T X Theta - X^T Y\
$

Setting $nabla_Theta J(Theta) = 0$, we obtain:

$
  Theta = (X^T X)^(-1) X^T Y
$

#problem("3.3")[
  Suppose instead of considering the multivariate vectors $u^((i))$ all at once, we instead compute each variable $y^((i))$ seprately for each $j=1,...p$. In this case, we have $p$ individual linear models, of the form

  $
    y_j^((i)) = theta_j^T x^((i)), quad j = 1, ..., p
  $

  (So here, each $theta_j in RR^n$.) How do the parameters from these $p$ independent least squares problems compare to the multivariate soulution?
]

For each subproblem $j$, we contrust a vector $y_j$ as the following:

$
  y_j = mat(y_j^((1)); y_j^((2)); ...; y_j^((m))); quad j = 1, ..., p
$

which then leads us to the $j$-th least squares problem:

$
  J(theta_j) = 1 / 2 norm(X theta_j - y_j)_2^2
$

which has the closed form solution:

$
  theta_j = (X^T X)^(-1) X^T y_j
$

Lining up all the $theta_j$, we have:

$
  mat(theta_1, theta_2, ..., theta_p) &= mat(X^T X)^(-1) X^T y_1, (X^T X)^(-1) X^T y_2, ..., (X^T X)^(-1) X^T y_p) \
  &= (X^T X)^(-1) X^T mat(y_1, y_2, ..., y_p) \
  &= (X^T X)^(-1) X^T Y\
  &= Theta
$

#box[
  #outline-colorbox(color: "green", title: "Note")[
    Another way of looking at this is to look at the overall $J(Theta)$, this is skipped in previous discussions, but $J(Theta)$ is just adding up all $(X Theta -Y)_(i j)^2$ for all $i$ and $j$. (which is why $tr(A A^T)=tr(A^T A)$ is mentioned cause they're just different orderings of the same sqaured sums.)

    With this prespective, the "independece" of each $theta_j$ is quite easy to find, we can re-write the sum to add $j = 1,..., p$ first instead of $i$, which is to say:

    $
      J(Theta) = 1 / 2 sum_(j=1)^p sum_(i=1)^m (Theta^T x^((i))_j - y^((i))_j)^2
    $

    which is essentially:

    $
      J(Theta) = sum_(j=1)^p J(theta_j)
    $

    Then you'll easily see that:

    $
      nabla_(theta_i) nabla_(theta_j) J(Theta) = 0, quad i != j
    $

    For a $Theta$ to satisfy $nabla_Theta J(Theta) = 0$, one must have $nabla_(theta_i) J(theta_j) = 0$ for all $i = 1, ..., p$, which is exactly the same as the multivariate solution.

    This doesn't count as a serious proof, but it's a good way to understand the problem.
  ]
]

#problem("4. Incomplete, Positive-Only Labels")[
  In this problem we will consider training binary classifiers in situations where we do not have full access to the labels. In particular, we consider a scenario, which is not too infrequent in real life, where we have labels only for a subset of the positive examples. All the negative examples and the rest of the positive examples are unlabelled.

  We formalize the scenario as follows: Let ${x^((i)), t^((i))}_(i=1)^n$ be a standard dataset of i.i.d distributed examples. Here $x^((i))$'s are the inputs/features and $t^((i))$'s are the labels. Now consider the situation where $t^((i))$'s are not observed by us. Instead, we only observe the lables of some of the positive examples. Concretely, we assume that we observe $y^((i))$'s that are generated by

  $
    forall x,quad p(y^((i))=1 | t^((i))=1, x^((i))=x)=alpha\
    forall x,quad p(y^((i))=0 | t^((i))=1, x^((i))=x)=1-alpha\
    forall x,quad p(y^((i))=0 | t^((i))=0, x^((i))=x)=0\
    forall x,quad p(y^((i))=1 | t^((i))=0, x^((i))=x)=1
  $

  where $alpha in (0,1)$ is some unknown scalar. In other words, if the unobserved "true" label $t^((i))$ is $1$, then with $alpha$ chance we observe a label $y^((i))=1$. On the other hand, if the unobserved "true" label $t^((i))$ is $0$, then we always observe $y^((i))=0$.

  Our final goal in the problem is to contruct a binary classifier $h$ of the true label $t$, with only access to the partial label $y$. In other words, we want to contruct $h$ such that $h(x^((i))) approx p(t^((i))=1 | x^((i)))$ as closely as possible, using only $x$ and $y$.

  in the following sub-questions, we will attempt to solve the problem with inly partial observations. That is, we only have access to ${(x^((i)), y^((i))}_(i=1)^n$, and will try to predict $p(t^((i))=1 | x^((i)))$.
]

#problem("4.1")[
  Show that under our assumptions, for any $i$,

  $
    p(t^((i)) = 1| y^((i))=1, x^((i))) = 1
  $

  That is, observing a positive partial label $y^((i))=1$ tells us for sure the hidden true label is $1$. Use Bayes rule to derive this (an informal explanation will not earn credit).
]

Using Bayes rule:

$
  p(t^((i))=1 | y^((i))=1, x^((i))) &= (p(t^((i)) =1 , y^((i)) = 1, x^((i)))) / (p(y^((i))=1 , x^((i))))\
  &= (p(t^((i)) =1 , y^((i)) = 1, x^((i)))) / (p(
    t^((i)) =1 , y^((i)) = 1, x^((i))
  ) + underbrace(p(
    t^((i)) = 0 , y^((i)) = 1, x^((i)))
  , "0")) \
  &= 1
$

Note:
$
  p(t^((i)) = 0, y^((i)) = 1, x^((i))) = p(y^((i))=1 | t^((i)) = 0, x^((i))) dot p(t^((i)) = 0, x^((i))) = 0
$

#problem("4.2")[
  Show that for any example, the probability that the true label $t^((i))$ is postive is $1\/alpha$ times the probability that the partial label is positve. That is, show that:

  $
    p(t^((i)) = 1 | x^((i))) = 1 / alpha p(y^((i)) = 1 | x^((i)))
  $

  Note that the euqation above suggests that if we know the value of $alpha$, then we can convert a function $h(dot)$ that approximately predicts the probability $h(x^((i)))approx p(y^((i))=1 | x^((i)))$ into a function that approximately predicts $p(t^((i))=1 | x^((i)))$ by multiplying the factor $1\/alpha$.
]

$
  p(y^((i)) = 1 | x^((i))) &= p(t^((i)) = 1, y^((i)) = 1 | x^((i))) \
  &= p(t^((i)) = 1 | x^((i))) dot p(y^((i)) = 1 | t^((i)) = 1, x^((i))) \
  &= p(t^((i)) = 1 | x^((i))) dot alpha quad qed
$

#problem("4.3")[
  The solution to estimate $p(t^((i)) | x^((i)))$ outlined in the previous sub-question requires the knowledge of $alpha$ which we don't have. Now we will design a way to estimate $alpha$ based on the function $h(dot)$ that approximately predicts $p(y^((i)) = 1 | x^((i)))$.

  To simplify the analysis, let's assume that we have magically obtained a function $h(x)$ that prefectly predicts the value of $p(y^((i)) = 1 | x^((i)))$, that is, $h(x^((i))) = p(y^((i)) = 1 | x^((i)))$.

  We make the crucial assumption that $p(t^((i)) = 1 | x^((i))) in {0,1}$. This assumption means the process of generating the "true" label $t^((i))$ is a noise-free process. This assumption is not very unreasoanle to make. Note, we are NOT assuming that the observed label $y^((i))$ is noise-free, which would be an unreasonable assumption!

  Now we will show that:

  $
    alpha = EE[h(x^((i))) | y^((i)) = 1]
  $

  To show this, prove that $h(x^((i))) = alpha$ when $y^((i)) = 1$.

  (The above result motivates the following algorithm to estimate $alpha$ by estimating the RHS of the equation above using samples: Let $V_+$ be the set of labeled (and hence postive) examples in the validation set $V$, given by $V_+={x^((i)) in V | y^((i)) = 1}$ Then we use $alpha approx sum_(x^((i)) in V^+) h(x^((i))).$)
]

This requires some probability theory techinques, Recall:
$
  EE[k | X = x] = integral k / p(x) p(x) dif x = k integral dif x = k
$

$
  EE[h(x^((i))) | y^((i)) = 1] &= EE[h(x^((i))) bb(1)_(y^((i)) = 1)] / p(y^((i)) = 1) \
  &= EE[EE[bb(1)_(y^((i))= 1) | x^((i))] dot h(x^((i)))] / EE[p(y^((i)) = 1 | x^((i)))] \
  &=EE[h(x^((i))) dot h(x^((i)))] / EE[h(x^((i)))] \
$

Note that:

$
  h(x^((i))) = alpha dot p(t^((i)) = 1 | x^((i))) in {0, alpha}
$

Assuming $p(h(x^((i))) = alpha) = beta$, we have:

$
  EE[h(x^((i))) | y^((i)) = 1] = (beta dot alpha^2) / (beta dot alpha) = alpha quad qed
$