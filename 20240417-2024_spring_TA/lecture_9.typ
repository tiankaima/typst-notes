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

#let Q_A(Q_it, A_it) = [
  #let blue = rgb("#0000bb")

  #box(width: 100%)[
    #Q_it
  ]
  #rect(width: 100%, stroke: 0.005em + blue, height: 0em)
  #pad(x: 1.5em)[
    #set text(fill: blue)
    *Answer*

    #A_it
  ]
  #rect(width: 100%, stroke: 0.005em + blue, height: 0em)
  #v(4em)
]

#align(center)[
  = 习题课 9 讲义
  2024 Spring 数学分析(B2)

  Tiankai Ma
]

== 作业答案

#Q_A([
  === P193 1(3)

  $
  x=a cos t,y=a sin t,z=a ln(cos t) space (0<=t<=pi / 4)
  $
])[
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

#Q_A([
  === 1(4)

  $
  z^2=2a x, 9y^2=16x z quad O(0,0,0) -> A(2a,8 / 3 a, 2a)
  $
])[
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

#Q_A([
  === 1(5)

  $
  4a x=(y+z)^2, 4x^2+3y^2=3z^2 quad O(0,0,0) -> A(x,y,z)
  $
])[
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

#Q_A([
  === 2(2)

  $
  integral_L z^2 / (x^2+y^2) dif s, L: x=a cos t, y=a sin t, z=a t space (0<=t<=2pi)
  $
])[
  $
  &r(t)&=&(a cos t,a sin t,a t)\
  &r'(t)&=&(-a sin t,a cos t,a)\
  // &abs(r'(t))^2&=&a^2 sin^2 t+a^2 cos^2 t+a^2=a^2(1+1)=2a^2\
  &abs(r'(t))&=&sqrt(2)a
  $

  $
  integral_L z^2 / (x^2+y^2) dif s=sqrt(2)a integral_0^(2pi) t^2 dif t= 8 / 3 sqrt(2) pi^3 a
  $
]

#Q_A([
  === 2(5)

  $
  &integral_L (x+y+z) dif s\ L: &A(1,1,0)->B(1,0,0)\ &B C: x=cos t, y=sin t, z=t space (0<=t<=2pi)
  $
])[
  $L_1$:

  $
  integral_(L_1) (x+y+z) dif s=integral_0^1 (1+t) dif t=3 / 2
  $

  $L_2$:

  $
  integral_(L_2) (x+y+z) dif s=integral_0^(2pi) (cos t+sin t+t) sqrt(2) dif t=2 sqrt(2) pi^2
  $

  $
  => integral_L (x+y+z) dif s=integral_(L_1) + integral_(L_2)=3 / 2 + 2 sqrt(2) pi^2
  $
]

#Q_A([
  === 2(9)

  $
  integral_L x sqrt(x^2-y^2)dif s, L: (x^2+y^2)^2=a^2(x^2-y^2) space (x>=0)
  $
])[
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
  =&integral_(-pi / 4)^(pi / 4) a^3 cos theta cos 2 theta dif theta\
  =&(2sqrt(2)) / 3 a^3
  $
]

#Q_A([
  === 2(10)

  $
  integral_L (x^2+y^2+z^2)^n dif s quad L: x^2+y^2=a^2, z=0
  $
])[
  This is a simple one. We don't need to parametrize the curve, since the function always equal to $a^(2n)$, multiplied by $2pi a$(the length of the curve):

  $
  integral_L (x^2+y^2+z^2)^n dif s=(a^2)^n dot 2pi a=2pi a^(2n+1)
  $
]

#Q_A([
  === 2(11)

  $
  integral_L x^2 dif s quad L: x^2+y^2+z^2=a^2, x+y+z=0
  $
])[
  Just for demostration, you still can parametrize the curve, being a intersection of a sphere and a plane, it's obviously a circle.

  With a little imagination, we can find the center of the circle $P$ is $(0,0,0)$, and the radius is $a$. We find two perpendicular vectors on the plane, $v_1=(1,-1,0)$ and $v_2=(1,0,-1)$, then the parametric equation of the circle is:

  $
  r(theta) &= cos theta dot (sqrt(2) / 2 a ,-sqrt(2) / 2 a ,0)+sin theta dot (sqrt(2) / 2 a ,0,-sqrt(2) / 2 a) + (
    0,0,0
  )\
  &= sqrt(2) / 2 a dot (cos theta+sin theta,-cos theta, -sin theta)
  $

  The rest is just plug in the formula:

  $
  r'(theta) &= sqrt(2) / 2 a dot (-sin theta+cos theta, sin theta, -cos theta)\
  abs(r'(theta)) &= sqrt(2) / 2 a dot sqrt(2 - 2 cos theta sin theta)
  $

  I'll leave the rest to you.

  But we can also use the symmetry of the curve to solve this problem:

  $
  integral_L x^2 dif s = 1 / 3 integral_L (x^2+y^2+z^2) dif s = 1 / 3 a^2 dot 2pi a = 2 / 3 pi a^3
  $

  This is something we've already shown multiple times in previous homeworks.
]
#Q_A([
  === 2(12)

  $
  integral_L (x y + y z+ x z) dif s quad L: x^2+y^2+z^2=a^2, x+y+z=0
  $
])[
  Since $(x+y+z)^2=x^2+y^2+z^2+2(x y + y z + x z)$

  $
  integral_L (x y + y z+ x z) dif s = -1 / 2 a^2 dot 2pi a = -pi a^3
  $
]

#Q_A([
  === P200 1(1)

  $
  "surface area of" space z=sqrt(x^2+y^2) quad "inside" x^2+y^2=2x
  $

])[
  I actually recommend *against* you reciting the textbook style of calculating $E=r'_u^2 ...$. It's time consuming and error-prone.

  _But if you do use them, DO NOT CHANGE SYMBOLS. The textbook uses $r(u,v), r_u, r_v, E, F, G$, they comes from the field of differential geometry, use the exact same symbols to avoid confusion._

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

  _The real idea behind this question is the idea to generalize $dif S$ on $(r, theta, z)$, much as the textbook done with $(r, theta, phi)$ on page 197, let's discuss it here:_

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

#Q_A([
  === 1(2)

  $
  "surface area of" space x^2+y^2=a^2 quad "intersected by" x+z=0, x-z=0
  $
])[
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

#Q_A([
  === 1(5)

  $
  "surface area of" space x=1 / 2(2y^2+z^2) quad "inside" 4y^2+z^2=1
  $

])[
  This is nothing more than changing $x y$ to $y z$... use the second formula:

  $
  dif S&=sqrt(1+f_y^2+f_z^2) dif y dif z\
  &=sqrt(1+(2y)^2+z^2) dif y dif z\
  &=sqrt(4y^2+z^2+1) dif y dif z\
  &= sqrt(r^2 + 1) dot r / 2 dif r dif theta
  $

  If you have doubts about the last step, you can parametrize the surface:

  $
  hat(r)(r,theta)&=(1 / 2 r cos theta, r sin theta, 1 / 4 r^2 cos^2 theta+1 / 2 r^2 sin^2 theta)\
  hat(r)'_r&=(1 / 2 cos theta, sin theta, 1 / 2 r cos^2 theta+ r sin^2 theta)\
  hat(r)'_theta&=(-1 / 2 r sin theta, r cos theta, 1 / 2 r^2 sin theta cos theta)\
  hat(r)'_theta times hat(r)'_r&=(1 / 2 r^2 cos theta, 1 / 2 r^2 sin theta, -1 / 2 r)\
  abs(hat(r)'_theta times hat(r)'_r)&=r sqrt(1+r^2 cos^2 theta+r^2 sin^2 theta)=r / 2 dot sqrt(r^2+1)
  $

  $
  integral.double_S dif S = integral_0^(2pi) dif theta integral_0^1 sqrt(r^2+1) dot r / 2 dif r = (2sqrt(2)-1) / 3 pi
  $
]
#Q_A([
  === 2(2)

  $
  integral.double_S x y z dif S quad S: x+y+z=1, x,y,z>0
  $
])[
  $
  dif S = sqrt(1+f_x^2+f_y^2) dif x dif y = sqrt(3) dif x dif y\
  integral.double_S dif S = sqrt(3) integral_0^1 dif x integral_0^(1-x) x y (1-x-y) dif y = sqrt(3) / 120
  $
]

#Q_A([
  === 2(3)

  $
  integral.double_S (x^2+y^2) dif S quad S: "surrounded by" z=sqrt(x^2+y^2), z=1
  $
])[
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
#Q_A([
  === 2(6)

  $
  integral.double_S (dif S) / (r^2) quad S: x^2+y^2=R^2, z in [0,H]
  $
])[
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

#Q_A([
  === 2(7)

  $
  integral.double_S abs(x y z) dif S quad S: z=x^2+y^2, z in [0,1]
  $
])[
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
]

#Q_A([
  === 3(1)

  $
  integral.double_S (x^2+y^2) dif S quad S: x^2+y^2+z^2=R^2
  $
])[
  $
  integral.double_S (x^2+y^2) dif S = integral.double_S (y^2+z^2) dif S = integral.double_S (z^2+x^2) dif S
  $

  $
  => integral.double_S (x^2+y^2) dif S = 2 / 3 integral.double_S (x^2+y^2+z^2) dif S = 2 / 3 (
    4 pi R^2 dot R^2
  ) = 8 / 3 pi R^4
  $
]

#Q_A([
  === 3(2)

  $
  integral.double_S (x+y+z) dif S, quad S: x^2+y^2+z^2=a^2 (z>=0)
  $

])[
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

#Q_A([
  === 4

  $G$ is a bounded, closed region on plane $A x+B y+C z+D=0 space (C!=0)$, its projection on $O x y$ is $G_1$. Show that
  $
  sigma(G) / sigma(G_1)=sqrt((A^2+B^2+C^2)/C^2)
  $
])[
  $
  z=-A / C x-B / C y-D / C\
  dif S=sqrt(1+f_x^2+f_y^2) dif x dif y=sqrt(1+A^2/C^2+B^2/C^2) dif x dif y
  $

  $
  integral.double_G dif S = integral.double_(G_1) sqrt(1+A^2/C^2+B^2/C^2) dif x dif y = sqrt((A^2+B^2+C^2)/C^2) integral.double_(G_1) dif x dif y\
  => sigma(G) = sqrt((A^2+B^2+C^2)/C^2) sigma(G_1)
  $
]

#Q_A([
  === P215 1(3)

  $
  integral_L (-x dif y+y dif x) / (x^2+y^2) quad L:x^2+y^2=a^2 "counter-clockwise"
  $

])[
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

#Q_A([
  === (4)

  $
  integral_L y^2 dif x + x y dif y + x z dif z quad L: O(0,0,0)->A(1,0,0)->B(1,1,0)->C(1,1,1)
  $
])[
  $
  integral_(L_1) y^2 dif x = 0\
  integral_(L_2) x y dif y=1 / 2\
  integral_(L_3) x z dif z=1 / 2\
  integral_L arrow(v) dot dif arrow(r) = integral_(L_1) + integral_(L_2) + integral_(L_3) = 1
  $
]

#Q_A([
  === 2(6)

  $
  integral_L y dif x+z dif y + z dif z quad L: x+y=0, x^2+y^2+z^2=2(x+y)
  $

])[
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

#Q_A([
  === 2

  $
  bold(v)=(y+z)bold(i)+(z+x)bold(j)+(x+y)bold(k)\
  L: x=a sin^2t,y=2a sin t cos t,z=a cos^2 t space (0<=t<=pi)
  $
])[
  $
  integral_L bold(v)dot dif bold(r) &= integral (y+z)dif x+(z+x)dif y+(x+y)dif z\
  &=integral dif(x y +y z+x z)\
  &=integral dif (a sin^2 t dot 2a sin t cos t+2a sin t cos t dot a cos^2 t+a cos^2 t dot a sin^2 t)\
  &=0\
  $
]

#Q_A([
  === 4

  Use Green's theorem to calculate the following integral:

  (2) $
  integral.cont_L (x y+x+y)dif x+(x y+x-y)dif y quad L:x^2+y^2=1 "counter-clockwise"
  $

  (3) $
  integral.cont_L (y x^3+e^y)dif x+(x y^3+x e^y-2y)dif y quad L:"symmetric with respect to x and y axis"
  $

  (4) $
  integral.cont sqrt(x^2+y^2)dif x+y[x y+ln(x+sqrt(x^2+y^2))]dif y quad L: y^2=x-1, x=2
  $

  (6) $
  integral_(A M O)(e^x sin y-m y)dif x+(e^x cos y-m)dif y\
  "AMO": A(a,0) -> O(0,0), x^2+y^2=a x (a>0) "upper half"
  $
])[
  (2) $
  integral_L bold(v) dot dif bold(r) = integral.double_S ((diff Q)/(diff x)-(diff P)/(diff y)) dif S = integral.double_S (y+1)-(x+1) dif x dif y = 0
  $

  (3) $
  integral_L bold(v) dot dif bold(r) = integral.double_S ((diff Q)/(diff x)-(diff P)/(diff y)) dif S = integral.double_S (y^3+e^y)-(x^3+e^y) dif x dif y = 0
  $

  (4) $
  integral_L bold(v) dot dif bold(r) = integral.double_S ((diff Q)/(diff x)-(diff P)/(diff y)) dif S &= integral.double_S y(y+1/sqrt(x^2+y^2)) - y/sqrt(x^2+y^2) dif x dif y\
  &= integral_1^2 dif x integral_(-sqrt(x-1))^(sqrt(x-1)) y^2 dif y\
  &= integral_0^1 2/3 x^(3/2) dif x\
  &=4/15
  $

  (6) $
  integral.cont = integral.double_S (e^x cos y)-(e^x cos y - m) dif x dif y = m/8 pi a^2\
  integral_0^a (e^x sin y - m y) dif x = 0\
  => integral_(A M O) = m/8 pi a^2
  $
]

#Q_A([
  === 5

  Calculate the following area:

  (1) $
  x=a cos^3 t, y=a sin^3 t space (0<=t<=2pi)
  $

  (2) $
  x=a(t-sin t), y=a(1-cos t) space (0<=t<=2pi)
  $
])[

  (1) $
  sigma(D)=integral_0^(2pi) x dif y=integral_0^(2pi) a cos^3 t dot 3 a sin^2 t cos t dif t=3/8 pi a^2
  $

  (2) $
  sigma(D)=-integral_(2pi)^0 y dif x + integral_0^(2pi a) 0 dif x=integral_0^(2pi) a^2 (1-cos t)^2 dif t = 3 pi a^2
  $
]

#Q_A([
  === 6

  Calculate the following integral: $
    integral_L (-y dif x+ x dif y)/(x^2+y^2)
  $

  (1) From $A(-a,0)->B(a,0)$, $y=sqrt(a^2-x^2), space a>0$

  (2) From $A(-1,0)->B(3,0)$, $y=4-(x-1)^2$
])[
  This is still something we already encountered multiple times:

  $
  gradient(arctan(y/x)) = (-y / (x^2+y^2), x / (x^2+y^2)) quad x>0
  $

  The scalar field can be extended to the $RR^2\\{(0,y)mid(|)y<=0}$ as the following:

  $
  &phi(x,y) = arctan(y/x) quad &x>0\
  &phi(0,y) = pi / 2 quad &y>0\
  &phi(x,y) = arctan(y/x)+pi quad &x<0\
  $

  Given that two path don't cross the negative y-axis, we just need to calculate $phi(x,y)$ at the following points:

  $
  A_1(-a,0) quad B_1(a,0) quad A_2(-1,0) quad B_2(3,0)
  $

  Thus,

  $
  phi(A_1) = pi, phi(B_1) = 0 => integral_L_1 = -pi\
  phi(A_2) = pi, phi(B_2) = 0 => integral_L_2 = -pi
  $
]

