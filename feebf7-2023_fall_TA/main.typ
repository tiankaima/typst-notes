#set text(
  font: "Source Han Serif SC",
  size: 10pt,
)
#set page(
  paper: "a4",
  margin: (x: 1.8cm, y: 1.5cm),
)
#set par(first-line-indent: 15pt)
#set heading(numbering: (..nums) => nums.pos().slice(1).map(str).join("."))
#set math.equation(numbering: "(1)")

#import "utils.typ": *

#outline(depth: 1)
#pagebreak()

// Lectures
#include "lectures/lecture_0.typ"
#include "lectures/lecture_1.typ"
#include "lectures/lecture_2.typ"
#include "lectures/lecture_4.typ"

// Recitations
#include "recitations/recitation_1.typ"

// Extensions
#include "extension.typ"
