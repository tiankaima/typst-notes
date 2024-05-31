#import "@preview/cetz:0.2.2": *
== HW6
Due 2024.04.28

#let ans(it) = [
  #pad(1em)[
    #text(fill: blue)[
      #it
    ]
  ]
]

=== Question 8.13

解释下面给出的 Wumpus 世界中相邻方格的定义存在什么问题:

$
  forall x,y "Adjacent"([x,y], [x+1,y]) and "Adjacent"([x,y], [x,y+1])
$

#ans[
  这个定义没有考虑到边界情况, 即当 $x = 4$ 或 $y = 4$ 时, $[x+1,y]$ 或 $[x,y+1]$ 可能会超出边界.
]

=== Question 8.17

用一个相容的词汇表(需要你自己定义)在一阶逻辑中表示下列语句:

+ 某些学生在 2001 年春季学期上法语课.
+ 上法语课的每个学生都通过了考试.
+ 只有一个学生在 2001 年春节学期上希腊语课.
+ 希腊语课的最好成绩总是比法语课的最好成绩高.
  #ans[
    定义词汇表如下: (防止赘述, 我们省略一些不必说明的定义)
    - Takes(student, course, semester)
    - Passes(student, course, semester)
    - Score(student, course, semester, score)
    - x > y (x 比 y 大)

    那么上面的四个语句可以分别表示如下:

    + $exists x, "Student"(x) and "Takes"(x, "French", "Spring2021")$
    + $forall x, "Student"(x) and "Takes"(x, "French", "Spring2021") => "Passes"(x, "French", "Spring2021")$
    + $exists x, "Student"(x) and "Takes"(x, "Greek", "Spring2021") and (
          forall y, "Student"(y) and "Takes"(y, "Greek", "Spring2021") => x = y
        )$
      - 注: 上述描述 = 存在这样的一个学生, 而且对于所有满足这样条件的学生, 都是同一个学生.
    + $forall s, x, exists y, "Semester"(s) and "Student"(x) and "Student"(y) and "Takes"(x, "Greek", s) and "Takes"(
          y, "French", s
        ) => "Score"(x, "Greek", s) > "Score"(y, "French", s)$
  ]
+ 每个买保险都是聪明的.
+ 没有人会买昂贵的保险.
+ 有一个代理, 他只向那些没投保的卖保险.
  #ans[
    定义词汇表如下: (防止赘述, 我们省略一些不必说明的定义)
    - BuyInsurance(agent, insurance)
    - Expensive(insurance)
    - Smart(agent)
    - SellInsurance(agent, agent, insurance)
    - Insured(agent)

    那么上面的三个语句可以分别表示如下:

    #set enum(start: 5)
    + $forall x, exists y, "Agent"(x) and "Policy"(y) and "BuyInsurance"(x, y) => "Smart"(x)$
    + $forall x,y, "Agent"(x) and "Policy"(y) and "Expensive"(y) => not "BuyInsurance"(x, y)$
    + $exists x, "Agent"(x) and (forall y, forall z, "Policy"(z) and "SellInsurance"(x, y, z)) => "Agent"(y) and (
          not "Insured"(y)
        )$
  ]
+ 镇上有一个理发师, 他给所有不自己刮胡子的人刮胡子.

  #ans[
    定义词汇表如下: (防止赘述, 我们省略一些不必说明的定义)
    - Barber(agent)
    - Shave(A, B) (A 给 B 刮胡子)
    - SelfShave(agent)

    那么上面的语句可以表示如下:
    #set enum(start: 8)
    + $exists x, "Agent"(x) and (forall y, "Agent"(y) and not "SelfShave"(y)) => "Shave"(x, y)$
  ]
+ 在英国出生的人, 如果其双亲都是英国公民或者永久居住者, 那么此人生来就是一个英国公民.
+ 在英国以外的地方出生的人, 如果其双亲生来就是英国公民, 那么此人血统上是一个英国公民.
  #ans[
    定义词汇表如下: (防止赘述, 我们省略一些不必说明的定义)
    - BornIn(agent, place)
    - BritishCitizen(agent)
    - PermanentResident(agent)
    - Parent(agent, agent)
    - BloodCitizen(agent)

    那么上面的两个语句可以分别表示如下:
    #set enum(start: 9)

    + $forall x, "Agent"(x) and "BornIn"(x, "UK") and (
          forall y, "Parent"(y, x) => ("BritishCitizen"(y) or "PermanentResident"(y))
        ) => "BritishCitizen"(x)$
    + $forall x, "Agent"(x) and not "BornIn"(x, "UK") and (
          forall y, "Parent"(y, x) => "BritishCitizen"(y)
        ) => "BloodCitizen"(x)$
  ]

=== Question 9.3

假定知识库中只包括一条语句: $exists x, "AsHighAs"(x, "Everest")$. 下列哪个语句是应用存在量词实例化之后的合法结果?

+ $"AsHighAs"("Everest", "Everest")$
+ $"AsHighAs"("kilimanjaro", "Everest")$
+ $"AsHighAs"("kilimanjaro", "Everest") and "AsHighAs"("benNevis", "Everest")$

#ans[
  仅 b & c.

  a: Everest 已经出现在命题中, 应该进行标准化分离(重新命名)以避免混淆.
]

=== Question 9.4

对于下列每对原子语句, 如果存在请给出最一般的合一置换:

+ $P(A,B,B), P(x,y,z)$
  #ans[
    ${x\/A, y\/B, z\/B}$
  ]
+ $Q(y,G(A,B)), Q(G(x,x),y)$
  #ans[
    不存在, $x$ 不可能同时置换为 $A$ 和 $B$.
  ]
+ $:"Older"("Father"(y),y), "Older"("Father"(x), "John")$
  #ans[
    ${x\/"John", y\/"John"}$
  ]
+ $"Knows"("Father"(y),y), "Knows"(x,x)$
  #ans[
    不存在, $x$ 不可能同时置换为 $"Father"(y)$ 和 $y$.
  ]

=== Question 9.6

#ans[
  #show math.equation.where(block: true): it => box(width: 100%, it)
  + 马, 奶牛, 猪都是哺乳动物.
    $
      &"Horse"(x) => "Mammal"(x) \
      &"Cow"(x) => "Mammal"(x) \
      &"Pig"(x) => "Mammal"(x)
    $
  + 马的后代是马.
    $
      "Offspring"(x,y) and "Horse"(y) => "Horse"(x)\
    $
  + Bluebeard 是马.
    $
      "Horse"("Bluebeard")
    $
  + Bluebeard 是 Charlie 的家长.
    $
      "Parent"("Bluebeard", "Charlie")
    $
  + 后代与家长是相互的.
    $
      &"Offspring"(x,y) => "Parent"(y,x)\
      &"Parent"(x,y) => "Offspring"(y,x)\
    $
  + 所有哺乳动物都有家长.
    $
      "Mammal"(x) => "Parent"(S(x), x)
    $
    其中 $S$ 是 Skolem 函数.
]

=== Question 9.13
本题中需要用到你在习题 9.6 中写出的语句, 运用反向链接算法来回答问题.

+ 画出用穷举反向链接算法为查询 $exists h, "horse"(h)$ 生成的证明树, 其中子句按照给定的顺序进行排序
+ 对于本领域, 你注意到了什么?
+ 实际上从你的语句中得出了多少个 $h$ 的解?

#ans[
  + 证明树如下:
    #let data = (
      [Horse(h)],
      (([Offspring(h, y)]), [Parent(y,h)]),
      (
        [Horse(Bluebeard)],
        (
          [Offspring(Bluebeard, y)],
          (
            [Parent(y, Bluebeard)],
            (
              [Offspring(y, Charlie)],
              [$dots.v$],
              [],
            ),
            [],
          ),
          [],
        ),
        [],
      ),
    )

    #canvas(
      length: 0.9cm,
      {
        import draw: *

        set-style(
          content: (padding: .2),
          fill: gray.lighten(70%),
          stroke: gray.lighten(70%),
        )

        tree.tree(
          data,
          spread: 2.,
          grow: 1.5,
          draw-node: (node, ..) => {
            content((), node.content)
          },
          draw-edge: (from, to, ..) => {
            line(
              (a: from, number: .6, b: to),
              (a: to, number: .6, b: from),
              mark: (end: ">"),
            )
          },
          name: "tree",
        )
      },
    )
  + 上面的证明树会陷入无限循环, 因为 $"Offspring"(x,y) and "Horse"(y) => "Horse"(x)$
  + 两个 $"Horse"("Bluebeard") $, $"Horse"("Charlie")$
]