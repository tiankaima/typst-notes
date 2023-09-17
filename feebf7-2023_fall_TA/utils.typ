#let definintion(body, name: "") = {
    box(
        fill: yellow.lighten(70%),
        width: 100%,
        inset: 12pt,
        outset: 0pt,
        radius: 0pt,
        clip: true,
    )[
        #text(
            size: 10pt,
            weight: "bold",
        )[
            定义: #name
        ]

        #set text(
            size: 9pt,
        )
        #body
    ]
}

#let statement(body, name: "") = {
    box(
        width: 100%,
        stroke: (
            paint: blue,
            thickness: 0.5pt,
        ),
        inset: 12pt,
        outset: 0pt,
        radius: 0pt,
        clip: true,
    )[
        #text(
            size: 11pt,
            weight: "bold",
        )[
            定理: #name
        ]

        #set text(
            size: 9pt,
        )
        #body
    ]
}

#let proof(body) = {
    box(
        width: 100%,
        stroke: (
            paint: red,
            thickness: 0.5pt,
        ),
        inset: 12pt,
        outset: 0pt,
        radius: 0pt,
        clip: true,
    )[
        #text(
            size: 11pt,
            weight: "bold",
        )[
            证明:
        ]

        #set text(
            size: 9pt,
        )
        #body
    ]
}

#let homework(body) = {
    box(
        width: 100%,
        stroke: (
            paint: red,
            thickness: 0.5pt,
        ),
        inset: 12pt,
        outset: 0pt,
        radius: 3pt,
        clip: true,
    )[
        #text(
            size: 9pt,
            weight: "bold",
        )[
            请思考/证明:
        ]

        #set text(
            size: 9pt,
        )
        #body
        #line(length: 100%, stroke: 0.2pt)
        $=>$
        #v(2cm)
    ]
}

#let caption(body) = {
    box(
        width: 100%,
        stroke: (
            paint: black,
            thickness: 0.5pt,
        ),
        inset: 10pt,
        outset: 0pt,
        radius: 0pt,
        clip: true,
    )[
        #text(
            size: 9pt,
            weight: "bold",
        )[
            提示:
        ]

        #set text(
            size: 9pt,
        )
        #body
    ]
}
