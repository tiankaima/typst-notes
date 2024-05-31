#import "@preview/cetz:0.2.2": *
#import "@preview/diagraph:0.2.1": *

#set text(
  font: ("linux libertine", "Source Han Serif SC", "Source Han Serif"),
  size: 10pt,
)

#align(horizon + right)[
  #text(size: 12pt)[
    = USTC/ALGO24 人工智能基础 书面作业
  ]
  PB21000030 马天开

  #v(4em)

  2024 年 春季学期 中国科学技术大学 人工智能基础 课程书面作业.

  #v(4em)

  使用 Typst 编写而成, 代码托管在: #link("https://github.com/tiankaima/typst-notes")

  本文档以 CC BY-NC-SA 4.0 协议发布. 请遵守学术诚信, 不得用于商业用途.

  #image("imgs/sticker_1.jpg", width: 30%)
]

#pagebreak(weak: true)

#show math.equation: it => math.display(it)
#show image: it => align(center, it)
#show raw.where(block: true): it => rect(stroke: 0.02em, width: 100%, inset: 1em, it)
#set enum(numbering: "a)")

#include "hw1.typ"
#pagebreak()
#include "hw2.typ"
#pagebreak()
#include "hw3.typ"
#pagebreak()
#include "hw4.typ"
#pagebreak()
#include "hw5.typ"
#pagebreak()
#include "hw6.typ"
#pagebreak()
#include "hw7.typ"
#pagebreak()
#include "hw8.typ"