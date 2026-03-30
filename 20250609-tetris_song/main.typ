#set page(paper: "a5", flipped: true)

#show: it => align(center + horizon, it)
#set text(size: 20pt, font: "Hiragino Kaku Gothic ProN")

#let zstack(..args) = context {
  let width = 0pt
  let height = 0pt
  for item in args.pos() {
    let size = measure(item)
    width = calc.max(width, size.width)
    height = calc.max(height, size.height)
  }
  box(
    width: width,
    height: height,
    {
      for item in args.pos() {
        place(center + horizon, item)
      }
    },
  )
}

#let v = text(fill: green, weight: "bold")[V]
#let a(p, it) = {
  // box(place(dy: -1.5em, text(fill: red, size: 15pt, p)))
  // sym.wj
  // h(0pt, weak: true)
  // box(align(center + horizon)[
  //   #highlight(it)
  //   #p
  // ])
  zstack(
    highlight(it),
    move(dy: -1em, text(fill: red, size: 15pt, weight: "bold", p)),
  )
}
#let acc(it) = text(fill: red, it)
#show regex("（"): it => "("
#show regex("）"): it => ")"


#v ど#acc[っ]し#acc[っ]#a("T")[て]すぐ知ってしまうの#acc[ー]

共振（きょうしん）#a("D")[で]苦しんでし罵倒（ばっと#acc[ー]）

Q.更新#a("D")[で]降る隕石抹消(まっしょ#acc[ー])可？

#v 悪（わる）くない
