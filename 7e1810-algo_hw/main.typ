#import "@preview/cetz:0.2.2": *
#import "@preview/diagraph:0.2.1": *

#import "utils.typ": *

#set text(
  font: ("linux libertine", "Source Han Serif SC", "Source Han Serif"),
  size: 10pt,
)

#align(horizon + right)[
  #text(size: 12pt)[
    = USTC/ALGO24 算法基础 书面作业
  ]
  PB21000030 马天开

  #v(4em)

  2024 年 春季学期 中国科学技术大学 算法基础 课程书面作业.

  #v(4em)

  使用 Typst 编写而成, 代码托管在: #link("https://github.com/tiankaima/typst-notes")

  本文档以 CC BY-NC-SA 4.0 协议发布. 请遵守学术诚信, 不得用于商业用途.

  #rev1_note[
    \* Revision 2024/06/11: 随期末复习增加了一些注释性内容, 以红色标注.

    参考了助教答案中的部分内容, 在此表示感谢.
  ]

  #image("imgs/sticker_1.jpg", width: 30%)
]

#pagebreak(weak: true)

#set page(
  header: [
    #h(1fr)
    *USTC/ALGO24 算法基础 书面作业*
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

#show math.equation: it => math.display(it)
#show image: it => align(center, it)
#show raw.where(block: true): it => text(fill: blue.lighten(40%), it)

#include "hw1.typ"
#pagebreak(weak: true)
#include "hw2.typ"
#pagebreak(weak: true)
#include "hw3.typ"
#pagebreak(weak: true)
#include "hw4.typ"
#pagebreak(weak: true)
#include "hw5.typ"
#pagebreak(weak: true)
#include "hw6.typ"
#pagebreak(weak: true)
#include "hw7.typ"
#pagebreak(weak: true)
#include "hw8.typ"
#pagebreak(weak: true)
#include "hw9.typ"