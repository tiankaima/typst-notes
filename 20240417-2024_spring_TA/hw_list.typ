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
      *作业答案汇总*
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
  = 作业答案汇总
  2024 Spring 数学分析 B2

  马天开 #h(1em) 刘国瑞 #h(1em) 刘董
]

- Week 1:
  - 2.26 P14 67 19 21

  - 2.28 P14 8 12 24 27 P23 2 5

  - 3.1 P24 7(1) 8(1) 10 11 14 15 18 19(2) 23(1) 27 28 33 35

- Week 2:
  - 3.4 P36 1(1)(5) 3(1)(3) 4 5 8 9 10 11

  - 3.6 P43 3 5 6

  - 3.8 P62 2 6

- Week 3:
  - 3.11 P62 12 14(3)(4)(8)(10)(11)(12) 15 17(1)(3)(4) 15 17(1)(3)(4) 18 21

  - 3.13 P80 1(3) 2(2)(5)(8) 3 4 6 13(4)(5) 15 16 17

  - 3.15 P81 9(2)(5) 11 12 22 23 24

- Week 4:
  - 3.18 P82 19(3)(4) 20(3)(4) 25 27 30 32 33 34 36(2)(5)

  - 3.20 P95 2(1)(2)(4) 3

  - 3.22 P95 4(2)(4) 7 9 10 11(3) 12(2) 13

- Week 5:
  - 3.25

  - 3.27 P109 6(1) 8(2) 9 10 11 15 17(2)

  - 3.29 P124 1(1) 2(2) 3 4(1)(2)(5) 5

- Week 6:
  - 4.1 P125 7(3)(4)(5)

  - 4.3 P125 9 10(3)(4) 11(1)(3) 13 18 19 20 21

  // - 4.5

- Week 7:
  // - 4.7

  - 4.8 P156 2(1)(2)(3)(6)(7)(8)

  - 4.10 P156 1(2)(3)(5)(6) 3 5 6 7

  - 4.12 P166 1(1)(4)(5) 2(2)(5)(8) 3(2)(3) 4 6 7

- Week 8:
  - 4.15 P180 1(2)(3)(4) 2(2)(4) 3(1)(2)(3)(5)(6)(8)

  - 4.17 P181 4(3)(5)(6) 5(2)(4)(6)(7) 6 7 8 9

  // - 4.19

- Week 9:
  - 4.22 P193 1(3)(4)(5) 2(2)(5)(9)(10)(11)(12)

  - 4.24 P199 1(1)(2)(5) 2(2)(3)(6)(7) 3 4

  - 4.26 P214 1(3)(4)(6) 2

- Week 10:
  - 4.29 P215 4(2)(3)(4)(6) 5 6

  // - 5.1

  // - 5.3

- Week 11:
  - 5.6

    +
      $
        I = integral_L (x-y) / (x^2+y^2) dif x + (x+y) / (x^2+y^2) dif y
      $

      $L$: 从 $A(-a,0)$ 经过上半椭圆 $x^2/a^2+y^2/b^2=1 space (y>=0)$ 到 $B(a,0)$ 的一段曲线

    +
      $
        I = integral.cont_Gamma e^y / (x^2+y^2)[(x sin x+y cos x) dif x\ +(y sin x - x cos x) dif y]
      $

      $Gamma: x^2+y^2=1$, 逆时针方向

  - 5.8 P227 1(1)(3)(5)(6)(7) 2

    补充:

    设 $S$ 为 $z-c=sqrt(R^2-(x-a)^2-(y-b)^2)$ 的上侧, 计算:

    $
      I = integral.double_S x^2dif y dif z+y^2 dif z dif x+(x-a)y z dif x dif y
    $

  - 5.10 P233 1(3)(5)(6) 2 3 4 7

  - 5.11 P234 9(2)(4)(5)(6) 10 11 12

- Week 12:

  - 5.13 P241 3

  - 5.15 P247 2(1) 3(1) 4 5(2) 6(2)(6) 7 9 10 11 12(1)

  // - 5.17

- Week 13:
  - 5.20 P269 1(1)(2) 2(1)(3)

  - 5.22 P269 3(1)(3) 4 5 8 9

  - 5.24 P279 1 2 3 5 6

- Week 14:
  - 5.27 P285 1 4 5 6 8 9

  - 5.29 P294 1(2) 2(2) 3 4 5

  // - 5.31

- Week 15:
  - 6.3 P307 1(1)(2)(3)(9)(10)(12) 2(3)(4)(5) 3 4

  - 6.5 P317 1(2) 2(2)(4) 4(1)(2)(4)

  - 6.7

    设 $f(x)in C[0,1]$ 讨论 $F(t)=integral_0^1 t/(x^2+t^2) f(x) dif x$ 连续性

- Week 16:

  // - 6.10

  - 6.12 P331 1(3)(5)(6) 2(2)(4)(5)(6) 3

  - 6.14 P331 6 7(2)(5)(6) 8(1)(3)(6)

- Week 17 (无需提交):

  - 6.17 P340 1 2 3(2)(3)(4)(8)(9)(10)

  // - 6.19