#let ans(it) = [
  #pad(1em)[
    #text(fill: blue)[
      #it
    ]
  ]
]

#let rev1_note(it) = [
  #box(inset: 1em)[
    #text(fill: red)[
      #it
    ]
  ]
]

#let notice(it) = [
  #rect(inset: 1em, stroke: 0.02em + green, width: 100%)[
    #set align(center)
    #set text(fill: green)
    *TODO:*

    #it
  ]
]