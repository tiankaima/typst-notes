#set text(
    font: "Source Han Serif SC",
    size: 10pt,
)
#set heading(numbering: "1.")
#counter(heading).update(0)
#set math.equation(numbering: "(1)")
#import "utils.typ": *

#outline()
#pagebreak()

// Lectures
#include "lectures/lecture_0.typ"
#include "lectures/lecture_1.typ"
#include "lectures/lecture_2.typ"

// Extensions
#include "extension.typ"
