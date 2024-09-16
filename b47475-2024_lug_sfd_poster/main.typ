#let light_green = cmyk(75%, 0%, 100%, 0%)
#let green = cmyk(100%, 0%, 100%, 20%)
#let light_blue = cmyk(40%, 3%, 0%, 25%)
#let blue = cmyk(72%, 30%, 0%, 70%)

#let mark(body) = box(clip: true, stroke: 0.2cm + red, body)
#let mark(body) = box(body)

#set page(width: 80cm, height: 180cm, fill: light_blue, margin: 0cm)

#let sfd-img = image("imgs/sfd_logo.svg", height: 20cm)

#let sfd-text = text(size: 200pt, font: "Prism", fill: green, stroke: 5pt + white)[
  #show par: set block(spacing: 3cm)
  Software

  Freedom

  Day
]

#let sfd-sym = pad(
  top: 5cm,
  grid(
    columns: (auto, auto),
    align: bottom + left,
    inset: (x: 2cm, y: 0cm),
    mark(sfd-img), mark(sfd-text),
  ),
)

#let sfd-text-cn = pad(
  top: 5cm,
  bottom: 2cm,
  text(size: 240pt, font: "baotuxiaobaiti", fill: white)[
    软件自由日
  ],
)

#let date-location-box = pad(
  2cm,
  rect(
    radius: 20cm,
    width: 40cm,
    height: 6cm,
    fill: green,
    align(
      center + horizon,
      text(size: 120pt, font: "Nanum Pen Script", fill: white)[
        2024.09.21 3C101
      ],
    ),
  ),
)

#let keynotes = box(width: 100%, fill: blue)[
  #set align(left)
  #set text(size: 80pt, fill: white, font: ("linux libertine", "Source Han Serif SC"))

  #let title(it) = text(size: 100pt, font: "Trajan Pro", it)
  #let author(it) = text(size: 60pt, underline(it), weight: "bold")
  #let details(it) = text(size: 60pt, fill: gray.lighten(10%), it)

  #pad(x: 3cm, y: 3.5cm)[
    #title[
      Keynotes:
    ]

    - $TT$ypst 101 #author[\@tiankaima]

      #details[
        觉得 LaTeX #strike[过于笨重]？Markdown 功能不够？来试试新的排版系统 Typst！

        在分享中，我们将介绍 Typst 的基本使用方法，并展示一些高级功能。
      ]

    - 电信5G专网服务简介 #author[\@james]

      #details[
        学校拟开通5G双域专网服务，以方便师生在国内使用移动通讯网络访问校园网内资源。这里简单介绍我校中国电信5G双域专网服务的建设进展和技术细节。
      ]

    - 我的 Debian maintainer 之路 #author[\@于波 from PLCT]

      #details[
        在本次分享中， 于波将介绍一个社区小白如何通过修包、打包一步步成为 Debian maintainer甚至 Debian developer.
      ]

    - `tracexec`: 优雅地追踪 exec 系统调用 #author[\@任鹏飞]

      #details[
        在配环境或从源码安装软件时，我们常常会遇到各种奇怪的错误。

        这些错误在没有上下文的情况下可能难以理解，通常我们会想要知道出错的命令和执行环境到底是什么。

        我将介绍和展示 `tracexec` 如何优雅地解决这类问题，以及 `tracexec` 的另一大妙用：协助多程序调试。
      ]
  ]

  #pad(x: 3cm, bottom: 5cm)[
    #title[
      Lightning Talks:
    ]

    ...
  ]
]

#let caption-text = [
  #v(3cm)
  #show: it => pad(x: 5cm, it)
  #set text(size: 60pt, fill: white, font: ("linux libertine", "Source Han Serif SC"))

  #set align(left)

  #grid(
    columns: (3fr, 1fr),
    align: top + left,
    [
      #pad(left: 1cm)[
        中国科学技术大学 Linux 用户协会是由中国科学技术大学在校的 GNU/Linux 爱好者发起并组成的团体，旨在联合科大的 GNU/Linux 使用者，搭建信息交流共享的平台，宣传自由软件的价值，提高自由软件社区文化氛围，推广自由软件的应用。
      ]

      #set text(size: 40pt)
      #let size = 10cm
      #grid(
        columns: (size, size, size, size),
        rows: (size, 2cm),
        inset: (x: 1cm, y: 0.1cm),
        align: center,
        image("imgs/qrcodes/微信公众号.svg"),
        image("imgs/qrcodes/QQ公众号.svg"),
        image("imgs/qrcodes/网站.svg"),
        image("imgs/qrcodes/青春科大.svg"),

        "微信公众号", "QQ公众号", "网站", "青春科大",
      )
    ],
    pad(
      x: 2cm,
      image("imgs/logo-white.svg", height: 14cm),
    ),
  )
]

#align(center)[
  #mark[
    #sfd-sym
  ]
  #mark[
    #sfd-text-cn
  ]
  #mark[
    #date-location-box
  ]
  #mark[
    #keynotes
  ]
  #mark[
    #caption-text
  ]
]


