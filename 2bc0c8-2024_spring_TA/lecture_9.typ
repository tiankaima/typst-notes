#set text(
  font: ("linux libertine", "Source Han Serif SC", "Source Han Serif"),
  size: 10pt,
)
#show math.equation: set text(11pt)
#show math.equation: it => [
  #math.display(it)
]

#let dcases(..args) = {
  let dargs = args.pos().map(it => math.display(it))
  math.cases(..dargs)
}

#show image: it => [
  #set align(center)
  #it
]

#let ans(it) = [
  // #box(width: 100%, inset: 1em, stroke: blue + 0.03em)[
  // #align(center)[
  #pad(x: 1.5em)[
    #set text(fill: blue)
    #it
  ]
  // ]
  // ]
]

#align(center)[
  = 习题课 9 讲义
  2024 Spring 数学分析(B2)

  Tiankai Ma
]

== 作业答案

=== P193 1(3)

$
x=a cos t,y=a sin t,z=a ln(cos t) space (0<=t<=pi / 4)
$

#ans[
  $
  &r(t)&=&(a cos t,y=a sin t, a ln(cos t))\
  &r'(t)&=&(-a sin t,a cos t,-a tan t)\
  &abs(r'(t))^2&=&a^2(1+tan^2 t)=a^2 sec^2 t\
  &abs(r'(t))&=&a sec t\
  $
  $
  integral_L dif s&=integral_0^(pi / 4) a sec t dif t=a ln(sqrt(2)+1)
  $

  Notice that $1/2 ln(3+2sqrt(2))=ln(sqrt(2)+1)$ are equivalent.

  *Recall:* $integral sec t dif t=ln(sec t+tan t)+C=1/2 ln((1+sin t)/(1-sin t))+C$

  Do recite the formula, here's a quick proof in case you forget it:

  $
  integral sec t dif t=integral (dif t) / (cos t) = integral (cos t dif t) / (cos^2 t)=integral (dif (
    sin t
  )) / (1-sin^2t) \
  = integral 1 / 2 (1 / (1-sin t) + 1 / (1+sin t)) dif t=1 / 2 ln((1+sin t)/(1-sin t))+C
  $
]

=== 1(4)

$
z^2=2a x, 9y^2=16x z space O(0,0,0) -> A(2a,8 / 3 a, 2a)
$

#ans[
  The key here is to turn the implict function into a parametric one.

  Since the goal is to make the result come as simple as possible, we can pick $x=2a t^2$ to make the first equation easier to solve:

  $
  x=2a t^2, z^2=2a x=4a^2 t^2 quad &=> quad z=2a t space (z>0)\
  9y^2=16x z= 64 a^2 t^3 quad &=> quad y=8 / 3 a t^(3 / 2)
  $

  Then:

  $
  &r(t)&=&(2a t^2,8 / 3 a t^(3 / 2),2a t)\
  &r'(t)&=&(4a t,4 a t^(1 / 2),2a)\
  &abs(r'(t))^2&=&16a^2 t^2+16a^2 t+4a^2=4a^2(4t^2+4t+1)=4a^2(2t+1)^2\
  &abs(r'(t))&=&2a(2t+1)
  $

  $
  integral_L dif s=integral_0^1 2a(2t+1) dif t=4a
  $
]

=== 1(5)

$
4a x=(y+z)^2, 4x^2+3y^2=3z^2 space O(0,0,0) -> A(x,y,z)
$

#ans[
  As mentioned in the previous question, we can turn the implict function into a parametric one. Take $x=a t^2$:

  $
  x=a t^2, (y+z)^2=4a^2t^2 quad &=> quad y+z=2a t\
  3(y-z)(y+z)=-4a^2 t^2 quad &=> quad y-z=-2 / 3 a t^3\
  $

  $
  &r(t)&=&(a t^2,a t-1 / 3 a t^3,a t+1 / 3 a t^3)\
  &r'(t)&=&(2a t,a-a t^2,a+a t^2)\
  &abs(r'(t))^2&=&4a^2 t^2+a^2(1+t^4)+a^2(1+t^4)=2a^2(t^4+2t^2+1)=2a^2(t^2+1)^2\
  &abs(r'(t))&=&sqrt(2)a(t^2+1)
  $

  $
  integral_L dif s=integral_0^t sqrt(2)a(t^2+1) dif t=sqrt(2)a(1 / 3 t^3+t)
  $
]

=== 2(2)

$
integral_L z^2 / (x^2+y^2) dif s, L: x=a cos t, y=a sin t, z=a t space (0<=t<=2pi)
$

#ans[
  $
  &r(t)&=&(a cos t,a sin t,a t)\
  &r'(t)&=&(-a sin t,a cos t,a)\
  // &abs(r'(t))^2&=&a^2 sin^2 t+a^2 cos^2 t+a^2=a^2(1+1)=2a^2\
  &abs(r'(t))&=&sqrt(2)a
  $

  $
  integral_L z^2 / (x^2+y^2) dif s=sqrt(2)a integral_0^(2pi) t^2 dif t= 8 / 3 sqrt(2) pi a^3
  $
]

=== 2(5)

$
&integral_L (x+y+z) dif s\ L: &A(1,1,0)->B(1,0,0)\ &B C: x=cos t, y=sin t, z=t space (0<=t<=2pi)
$

#ans[
  $L_1$:

  $
  integral_(L_1) (x+y+z) dif s=integral_0^1 (1+t) dif t=3 / 2
  $

  $L_2$:

  $
  integral_(L_2) (x+y+z) dif s=integral_0^(2pi) (cos t+sin t+t) sqrt(2) dif t=2 sqrt(2) pi^2
  $
]

=== 2(9)

$
integral_L x sqrt(x^2-y^2)dif s, L: (x^2+y^2)^2=a^2(x^2-y^2) space (x>=0)
$

#ans[
  Here's an example of bad parametrization:
  $
  x^2-y^2= t^2, space x^2+y^2=a t\
  => x^2=1 / 2 (a t+t^2), y^2=1 / 2 (a t-t^2)\
  r(t) = (sqrt(2) / 2 sqrt(a t+t^2), sqrt(2) / 2 sqrt(a t-t^2))\
  r'(t) = (sqrt(2) / 2 (a+2t) / (2sqrt(a t+t^2)), sqrt(2) / 2 (a-2t) / (2sqrt(a t-t^2)))\
  $

  This is going to take forever to integrate. Instead, we can use the polar coordinate:

  $
  x=r cos theta, y=r sin theta space (-pi / 4<=theta<=pi / 4)\
  r^4=a^2r^2 cos 2 theta => r=a sqrt(cos 2 theta)\
  $

  $
  &r(theta) &=& (a cos theta sqrt(cos 2 theta), a sin theta sqrt(cos 2 theta))\
  &r'(theta) &=& (-(sin 3 theta) / (sqrt(cos 2theta)), (cos 3 theta) / (sqrt(cos 2theta)))\
  &abs(r'(theta)) &=& 1 / sqrt(cos 2 theta)
  $

  Then,
  $
  integral_L x sqrt(x^2-y^2)dif s=&integral_(-pi / 4)^(pi / 4) a cos theta sqrt(cos 2 theta) dot (
    r^2 cos 2 theta
  ) dot 1 / sqrt(cos 2 theta) dif theta\
  =&integral_(-pi / 4)^(pi / 4) a^3 cos theta cos^2 2 theta dif theta\
  =&8 / 15sqrt(2) a^3
  $
]

=== 2(10)

$
integral_L (x^2+y^2+z^2)^n dif s, L: x^2+y^2=a^2, z=0
$

#ans[
  This is a simple one. We don't need to parametrize the curve, since the function always equal to $a^(2n)$, multiplied by $2pi a$(the length of the curve):

  $
  integral_L (x^2+y^2+z^2)^n dif s=(a^2)^n dot 2pi a=2pi a^(2n+1)
  $
]

=== 2(11)

$
integral_L x^2 dif s, L: x^2+y^2+z^2=a^2, x+y+z=0
$

#ans[
  Just for demostration, you still can parametrize the curve, being a intersection of a sphere and a plane, it's obviously a circle.

  With a little imagination, we can find the center of the circle $P$ is $(0,0,0)$, and the radius is $a$. We find two perpendicular vectors on the plane, $v_1=(1,-1,0)$ and $v_2=(1,0,-1)$, then the parametric equation of the circle is:

  $
  r(theta) &= cos theta dot (1,-1,0)+sin theta dot (1,0,-1) + (0,0,0)\
  &= (cos theta+sin theta,-cos theta, -sin theta)
  $

  The rest is just plug in the formula:

  $
  r'(theta) &= (-sin theta+cos theta, sin theta, -cos theta)\
  abs(r'(theta)) &= sqrt(2 - 2 cos theta sin theta)
  $

  I'll leave the rest to you.

  But we can also use the symmetry of the curve to solve this problem:

  $
  integral_L x^2 dif s = 1 / 3 integral_L (x^2+y^2+z^2) dif s = 1 / 3 a^2 dot 2pi a = 2 / 3 pi a^3
  $

  This is something we've already shown multiple times in previous homeworks.
]

=== 2(12)

$
integral_L (x y + y z+ x z) dif s, L: x^2+y^2+z^2=a^2, x+y+z=0
$

#ans[
  Since $(x+y+z)^2=x^2+y^2+z^2+2(x y + y z + x z)$

  $
  integral_L (x y + y z+ x z) dif s = -1 / 2 a^2 dot 2pi a = -pi a^3
  $
]

=== P200 1(1)

$
"surface area of" space z=sqrt(x^2+y^2) quad "inside" x^2+y^2=2x
$

#ans[
  I recommend against you recite the textbook style of calculating $E=r'_u^2 ...$. It's time consuming and error-prone.

  But if you do use them, DO NOT CHANGE SYMBOLS. The textbook uses $r(u,v), r_u, r_v, E, F, G$, they comes from the field of differential geometry, use the exact same symbols to avoid confusion.

  Here's two formula you should recite to make your life easier:

  1. For the general surface, $r=r(u,v)$ $dif S = abs(r_u times r_v) dif u dif v$.

  2. Given a $z=f(x,y)$, $dif S = sqrt(1+f_x^2+f_y^2) dif x dif y$.

  For this question, we can use the second formula:

  $
  f_x = x / sqrt(x^2+y^2), f_y = y / sqrt(x^2+y^2)\
  dif S = sqrt(1+x^2/(x^2+y^2)+y^2/(x^2+y^2)) dif x dif y = sqrt(2) dif x dif y
  $

  So the surface area would just be $sqrt(2)$ times the area of the projection of the surface on the $x y$ plane:

  $
  sigma(S) = sqrt(2) sigma(S_(x y)) = sqrt(2) pi
  $

  To make your life more troublesome, you can parametrize the surface:

  $
  &(x-1)^2+y^2=1 => x=1+r cos theta, y=r sin theta
  $
  $
  z&=sqrt(x^2+y^2)=sqrt(1+2r cos theta+r^2)\
  hat(r)(r,theta)&=(1+r cos theta,r sin theta,sqrt(1+2r cos theta+r^2))\
  hat(r)'_r&=(cos theta,sin theta,(cos theta+r) / sqrt(1+2r cos theta+r^2))\
  hat(r)'_theta&=(-r sin theta,r cos theta,0)\
  $

  I really must stop here before I have a heart attack, but you can continue to calculate the surface area by $abs(hat(r)'_r times hat(r)'_theta)$. Then integrate it over the region of $r,theta$.

  The $hat(r)$ is introduced to avoid confusion with the $r$ in the polar coordinate. here $hat(r)$ means nothing more than a "collection of $x,y,z$".

  Another way to parametricize the surface without a heart attack is to use a real polar coordinate, origin at $(0,0)$. You get a better $z(r,theta)$ this time, but you now have to interate over a varing $r(theta)$. *It's recommended you try it yourself using this method.*

  The real idea behind this question is the idea to generalize $dif S$ on $(r, theta, z)$, much as the textbook done with $(r, theta, phi)$ on page 197, let's discuss it here:

  Assuming we're fixing it on $r=r_0$:

  $
  hat(r)&=(r_0 cos theta, r_0 sin theta, z)\
  hat(r)'_theta&=(-r_0 sin theta, r_0 cos theta, 0)\
  hat(r)'_z&=(0,0,1)\
  hat(r)'_theta times hat(r)'_z&=(r_0 cos theta, r_0 sin theta, 0)\
  abs(hat(r)'_theta times hat(r)'_z)&=r_0
  $

  Try draw a picture of these vectors on a cylinder, you'll get a better understanding of $hat(r)'_theta, hat(r)'_z$ and the cross product, try imagine the meaning behind the direction of these vectors.

  For this problem, it's really $z=z(r,theta)$ not $r=r_0$:

  $
  hat(r)&=(r cos theta, r sin theta, r)\
  hat(r)'_r&=(cos theta, sin theta, 1)\
  hat(r)'_theta&=(-r sin theta, r cos theta, 0)\
  hat(r)'_r times hat(r)'_theta&=(r cos theta, r sin theta, r)\
  abs(hat(r)'_r times hat(r)'_theta)&=r sqrt(1+cos^2 theta+sin^2 theta)=sqrt(2) r
  $

  So the surface area could be calculated as:
  $
  integral.double_S dif S &= integral_0^(2pi) dif theta integral_0^(r(theta)) sqrt(2) r dif r\, space r(
    theta
  )=cos 2 theta\
  &= sqrt(2) pi
  $

  Note it's much worse if you calculate it the other way around:
  $
  integral.double_S dif S = integral_0^1 dif r integral_(-theta(r))^(theta(r)) sqrt(2) r dif theta, space theta(r)=arccos(r/2)
  $

  In this chapter and later, much more calculate techniques are introduced to make your life easier, use them wisely, a personal advice.
]

=== 1(2)

$
"surface area of" space x^2+y^2=a^2 quad "intersected by" x+z=0, x-z=0
$

#ans[
  With the discussion above, it's a "$r=r_0$ fixed type":

  $
  hat(r)(theta, z)&=(a cos theta, a sin theta, z)\
  hat(r)'_theta&=(-a sin theta, a cos theta, 0)\
  hat(r)'_z&=(0,0,1)\
  hat(r)'_theta times hat(r)'_z&=(a cos theta, a sin theta, 0)\
  abs(hat(r)'_theta times hat(r)'_z)&=a
  $

  The upper and lower bound for $z$ are determined by the two planes, so the surface area is:

  $
  integral.double_S dif S = integral_0^(2pi) dif theta integral_(-a abs(cos theta))^(a abs(cos theta)) a dif z = integral_0^(2pi) 2a^2 abs(cos theta) dif theta = 8 a^2
  $

  The absolute value is easily noticed during calculation, one shall get confused to get a $0$ result if otherwise. These are the checks you should "unconsiously" perform during calculation.
]

=== 1(5)

$
"surface area of" space x=1 / 2(2y^2+z^2) quad "inside" 4y^2+z^2=1
$

#ans[
  This is nothing more than changing $x y$ to $y z$... use the second formula:

  $
  dif S&=sqrt(1+f_y^2+f_z^2) dif y dif z\
  &=sqrt(1+(2y)^2+z^2) dif y dif z\
  &=sqrt(4y^2+z^2+1) dif y dif z\
  &= sqrt(2) dif y dif z
  $

  You can stop here, the area is $sqrt(2)$ times the area of the projection of the surface on the $y z$ plane, which is a elipse with $a=1/2, b=1$, whose area is $pi / 2$. Thus the surface area is $sqrt(2) /2 pi$.
]

=== 2(2)

$
integral.double_S x y z dif S, quad S: x+y+z=1, x,y,z>0
$

#ans[
  $
  dif S = sqrt(1+f_x^2+f_y^2) dif x dif y = sqrt(3) dif x dif y\
  integral.double_S dif S = sqrt(3) integral_0^1 dif x integral_0^(1-x) x y (1-x-y) dif y = sqrt(3) / 120
  $
]

=== 2(3)

$
integral.double_S (x^2+y^2) dif S, quad S: "surrounded by" z=sqrt(x^2+y^2), z=1
$

#ans[
  $S_1: {(x,y) mid(|) x^2+y^2<=1} times {1}$

  $
  integral.double_(S_1) (x^2+y^2) dif S = integral_0^(2pi) dif theta integral_0^1 r^3 dif r = pi / 2
  $

  $S_2: {(x,y,z) mid(|) x^2+y^2<=1, z=sqrt(x^2+y^2)}$

  $
  dif S = sqrt(1+f_x^2+f_y^2) dif x dif y = sqrt(2) dif x dif y\
  integral.double_(S_2) (...) dif S = sqrt(2) integral.double_(S_1) (...) dif S = sqrt(2) / 2 pi
  $

  Adding them up:

  $
  integral.double_S dif S = integral.double_(S_1) + integral.double_(S_2) = (sqrt(2)+1) / 2 pi
  $
]

=== 2(6)

$
integral.double_S (dif S) / (r^2) quad S: x^2+y^2=R^2, z in [0,H]
$

#ans[
  $
  hat(r)(theta, z)&=(R cos theta, R sin theta, z)\
  hat(r)'_theta&=(-R sin theta, R cos theta, 0)\
  hat(r)'_z&=(0,0,1)\
  hat(r)'_theta times hat(r)'_z&=(R cos theta, R sin theta, 0)\
  abs(hat(r)'_theta times hat(r)'_z)&=R
  $

  $
  integral.double_S (dif S) / (r^2) = integral_0^(2pi) dif theta integral_0^H (R dif z) / (R^2+z^2) = 2pi arctan(H/R)
  $

  If you recall, you might already done similar execise in your electrodynamics course, where you calculate the electric field of a infinite cylinder.
]

=== 2(7)

$
integral.double_S abs(x y z) dif S, quad S: z=x^2+y^2, z in [0,1]
$

#ans[
  $
  dif S = sqrt(1+f_x^2+f_y^2) dif x dif y = sqrt(4x^2+4y^2+1) dif x dif y
  $

  Further, transform this to cylinder coordinate:

  $
  dif S = sqrt(4 r^2 + 1) dot r dif r dif theta
  $

  This requires prove though:

  $
  hat(r)(r,theta)&=(r cos theta, r sin theta, r^2)\
  hat(r)'_r&=(cos theta, sin theta, 2r)\
  hat(r)'_theta&=(-r sin theta, r cos theta, 0)\
  hat(r)'_r times hat(r)'_theta&=(2 r^2 cos theta, 2 r^2 sin theta, r)\
  abs(hat(r)'_r times hat(r)'_theta)&=r sqrt(1+ 4r^2 cos^2 theta+4r^2 sin^2 theta)=sqrt(4 r^2+1) dot r
  $

  Then the integral is:

  $
  integral.double_S abs(x y z) dif S = integral_0^(2pi) dif theta integral_0^1 abs(cos theta sin theta) dot r^5 sqrt(4 r^2+1) dif r = 1 / 420 (
    125 sqrt(5) - 1
  )
  $

  // WTF IS THIS REALLY THE ANSWER?
  // TODO: CROSS CHECK WITH THE TEXTBOOK
]

=== 3(1)

$
integral.double_S (x^2+y^2) dif S, quad S: x^2+y^2+z^2=R^2
$

#ans[
  $
  integral.double_S (x^2+y^2) dif S = integral.double_S (y^2+z^2) dif S = integral.double_S (z^2+x^2) dif S
  $

  $
  => integral.double_S (x^2+y^2) dif S = 2 / 3 integral.double_S (x^2+y^2+z^2) dif S = 2 / 3 (
    4 pi R^2 dot R^2
  ) = 8 / 3 pi R^4
  $
]

=== 3(2)

$
integral.double_S (x+y+z) dif S, quad S: x^2+y^2+z^2=a^2 (z>=0)
$

#ans[
  Reverse $S->S'$, this essentially means we take a new parametrization of the upper half of the sphere, namely $(x,y)->(-x,-y,sqrt(a^2-x^2-y^2))$

  Changing the parametrization shouldn't result in a change of the integral value, so:
  $
  integral.double_S (x+y+z) dif S = integral.double_S' (-x-y+z) dif S = integral.double_S z dif S
  $

  Then it's the good old formula 2:

  $
  z&=sqrt(a^2-x^2-y^2)\
  dif S&=sqrt(1+f_x^2+f_y^2) dif x dif y\
  &=sqrt(1+x^2/(a^2-x^2-y^2)+y^2/(a^2-x^2-y^2)) dif x dif y\
  &=a / z dif x dif y
  $

  This cancels out the $z$ in the integral, so the result is:

  $
  integral.double_S z dif S = integral.double_S_(x y) z dot a / z dif x dif y = a dot pi a^2 = pi a^3
  $
]

=== 4

$G$ is a bounded, closed region on plane $A x+B y+C z+D=0 space (C!=0)$, its projection on $O x y$ is $G_1$. Show that
$
sigma(G) / sigma(G_1)=sqrt((A^2+B^2+C^2)/C^2)
$

#ans[
  $
  z=-A / C x-B / C y-D / C\
  dif S=sqrt(1+f_x^2+f_y^2) dif x dif y=sqrt(1+A^2/C^2+B^2/C^2) dif x dif y
  $

  $
  integral.double_G dif S = integral.double_(G_1) sqrt(1+A^2/C^2+B^2/C^2) dif x dif y = sqrt((A^2+B^2+C^2)/C^2) integral.double_(G_1) dif x dif y\
  => sigma(G) = sqrt((A^2+B^2+C^2)/C^2) sigma(G_1)
  $
]

=== P215 1(3)

$
integral_L (-x dif y+y dif x) / (x^2+y^2) quad L:x^2+y^2=a^2 "counter-clockwise"
$

#ans[
  $
  x=a cos t, y=a sin t quad t: 0->2pi
  $

  $
  integral.cont.ccw_L (-x dif y+y dif x) / (x^2+y^2) = integral_0^(2pi) (-a cos t a cos t+a sin t a sin t) / a^2 dif t = integral_0^(2pi) - cos(2t) dif t = 0
  $

  Notice you can't use green's theorem here, since the region is not simply connected. (The region is a circle with a hole in the middle.)

  // $
  // arrow(v)&=(-x / (x^2+y^2), y / (x^2+y^2))\
  // gradient times v &= (diff / (diff x), diff / (diff y)) times (P,Q)\
  // &= (diff Q) / (diff x) - (diff P) / (diff y)\
  // &= (-2x y) / (x^2+y^2) + (2x y) / (x^2+y^2)\
  // & = 0
  // $
]

=== (4)

$
integral_L y^2 dif x + x y dif y + x z dif z quad L: O(0,0,0)->A(1,0,0)->B(1,1,0)->C(1,1,1)
$

#ans[
  $
  integral_(L_1) y^2 dif x = 0\
  integral_(L_2) x y dif y=1 / 2\
  integral_(L_3) x z dif z=1 / 2\
  integral_L arrow(v) dot dif arrow(r) = integral_(L_1) + integral_(L_2) + integral_(L_3) = 1
  $
]

=== 2(6)

$
integral_L y dif x+z dif y + z dif z quad L: x+y=0, x^2+y^2+z^2=2(x+y)
$

#ans[
  The key again falls back onto the parametrization:

  We treat L as intersection between $x+y=1$ and $x^2+y^2+z^2=4$

  So the ceter is $(1,1,0)$ and the radius is $sqrt(2)$. Two perpendicular vectors on the plane are $v_1=(1,-1,0)$ and $v_2=(0,0,1)$, so the parametrization is:

  $
  r(t) &= cos t dot (1,-1,0)+sin t dot (0,0,sqrt(2)) + (1,1,0)\
  &= (cos t+1, -cos t+1, sqrt(2) sin t)\
  r'(t) &= (-sin t, sin t, sqrt(2) cos t)\
  $

  $
  &quad integral_L y dif x+z dif y+x dif z\
  = &- integral_0^(2pi) (-cos t+1)(- sin t)+(sqrt(2) sin t)(sin t)+(cos t+1)(sqrt(2) cos t) dif t\
  = &-2 sqrt(2) pi
  $
]