#import "@preview/polylux:0.3.1": *
#import "@preview/diagraph:0.2.1": *

#set page(paper: "presentation-16-9")
#set text(
  font: ("linux libertine", "Source Han Serif SC", "Source Han Serif"),
  size: 25pt,
)

#show heading: it => text(fill: rgb("11999e"), it)

#show raw.where(block: true): it => {
  box(
    fill: blue.lighten(95%),
    inset: (x: 10pt, y: 2pt),
    outset: (x: 0pt, y: 8pt),
    radius: 2pt,
  )[
    #set text(size: 15pt)
    #it
  ]
}

#polylux-slide[
  #align(horizon + center)[
    = Linux 101 Chapter 7\ Linux 上的编程
    \
    Tiankai Ma

    2024.05.14
  ]

  // Talking points:
  // 自我介绍
]

#polylux-slide[
  == Contents

  - Programming with C/C++
    - GCC
    - GNU Make
    - CMake
  - Programming with Python
    - Python 3
    - `pip`
    - `venv`
    // - Jupyter Notebook

  // Talking points:
  // 今天主要介绍的内容是在 Linux 上的编程, 我们会从 C/C++ 和 Python 两个方面来讲.
  // 在讲述过程中, 我预期大家已经了解语言本身的基础, (比如已经在 IDE 中写过代码, 了解基本的语法).
  // 但是没有经验也不要紧, 我们今天不会使用很复杂的特性, 会从最基础的开始.
  // 更重要的是相关工具的讲解.
]

#polylux-slide[
  #align(horizon + center)[
    == Pt. 1\ Programming with C/C++
  ]
]

#polylux-slide[
  == Programming with C/C++

  我们从一个简单的 `main.c` 开始:

  ```c
  #include <stdio.h>

  int main() {
      printf("Hello, World!\n");
      return 0;
  }
  ```

  在 Linux 上, 可以很方便的通过 `gcc` 编译:

  ```bash
  gcc -o main main.c && ./main
  ```

  如果编译成功不会输出任何内容, 这是 Unix 哲学的一部分.

  // Talking points:
  // 现场 demo:
  // cat main.c
  // gcc main.c -o main
  // ./main
]

#polylux-slide[
  == GCC

  - GNU 1.0 时其实是 `GNU C Compiler`, 后来扩展到了 C++, Fortran, Objective-C 等. 现在的 GCC 是 *GNU Compiler Collection*.

  - 在 GCC 12.2 中, 包含了 C: `gcc` , C++:`g++` , Objective-C , Fortan: `gfortan` 等前端; 指令集的支持包含 x86, x86-64, ARM, MIPS 等.

  - GCC 是大部分 Linux 发行版的标准编译器, 也是很多嵌入式系统的首选.

  // Talking points:
  // 现场 demo:
  // GCC 安装, 两个发行版 (Ubuntu, Arch) 的安装方式:
  // Ubuntu:
  // sudo apt install gcc
  // 但是更推荐安装 build-essential

  // Arch:
  // sudo pacman -S gcc
  // 但是更推荐安装 base-devel
]

#polylux-slide[
  == 多文件: 编译、链接

  我们继续上一个 demo, 把 `print()` 函数拆出来:

  #show: it => columns(2, it)

  ```c
  // print.c
  #include <stdio.h>

  void print() {
      printf("Hello, World!\n");
  }
  ```

  ```c
  // print.h
  #ifndef PRINT_H
  #define PRINT_H
  void print();
  #endif // PRINT_H
  ```

  ```c
  // main.c
  #include "print.h"

  int main() {
      print();
      return 0;
  }
  ```
]

#polylux-slide[
  == 多文件: 编译、链接

  手动操作需要我们手动将每个文件编译成目标文件, 然后链接:

  ```bash
  gcc -c print.c -o print.o
  gcc -c main.c -o main.o
  gcc print.o main.o -o main && ./main
  ```

  `gcc -c` 会编译出 #text(weight: "bold")[O]bject file (对象文件) 是一类二进制产物, 不能直接运行的原因在于其中外部引用的符号没有解析.

  如果只有这两个文件, 上述编译过程也可以简化为:

  ```
  gcc print.c main.c -o main
  ```
]

#polylux-slide[
  == Behind the Scene

  #raw-render(```dot
  digraph {
    rankdir=LR;
    node [shape=rect];
    c;
    i;
    s;
    o;
    r;
    c -> i [label="gcc -E"];
    i -> s [label="gcc -S"];
    s -> o [label="gcc -c"];
    o -> r [label="gcc"];
  }
  ```)

  - `gcc -E`: 预处理 ( _Pre-process_ ) `cpp`: 展开宏, 处理 `#include` 等 $=>$ `*.i`.
  - `gcc -S`: 编译 ( _Complication_ ) `cc1`, 生成汇编代码 $=>$ `*.s`.
  - `gcc -c`: 汇编 ( _Assembly_ ) `as`, 生成目标文件 $=>$`*.o`.
  - `gcc`: 链接 ( _Linking_ ) `ld`, 生成可执行文件.
]

#polylux-slide[
  == 大型项目怎么办?

  上面讲述的是一个简单的多文件项目, 但是在实际项目中:

  - 文件数量更多, 以 Linux kernel 为例, 有 8 万多个文件.
    ```console
    $ find . -type f | wc -l
    84374
    ```

  - 依赖关系复杂, 有些文件需要先编译, 有些文件需要先链接.
  - 外部库的链接, 比如 `libm`, `libpthread` 等.
  - 增量编译, 只编译修改过的文件.
]

#polylux-slide[
  == GNU Make

  - `make` 是一个自动化编译工具, 用于管理多文件项目的编译过程

  - `Makefile` 由一系列规则组成, 每个规则包含了目标, 依赖和命令.
  - 一个简单的 `Makefile`:

  ```make
  main.o: main.c print.h
  print.o: print.c print.h
  main: main.o print.o
  ```

  接着只需要执行

  ```bash
  make main
  ```

]

#polylux-slide[
  == GNU Make

  #set text(size: 20pt)

  我们来解释下上面的 `Makefile`:

  ```make
  main.o: main.c print.h
  ```

  指定了一个规则, `main.o` 是目标, `main.c print.h` 是依赖. 因为文件中没有声明 `main.c` 为目标, 则对应的文件成为依赖.

  事实上, `make` 会自动推导出命令, 也就是:

  ```bash
  gcc -c main.c -o main.o
  ```

  也可以手动在 `Makefile` 中指定:

  ```make
  main.o: main.c print.h
      gcc -c main.c -o main.o # 使用 Tab 缩进而不是空格
  ```

  // Talking points:
  // 通常情况下, 我们不需要手动指定命令, make 会自动推导.
  // Makefile 的亮点在于引入了 「文件之间的依赖关系」,通过文件更新时间来判断是否需要重新编译.
  // 这也可以解决编译、链接顺序的问题.
]

#polylux-slide[
  == CMake

  // - `CMake` 是一个跨平台的构建工具, 用于管理多文件项目的编译过程.
  - `CMakeLists.txt` 由一系列命令组成, 每个命令包含了目标, 依赖和命令.
  - 一个简单的 `CMakeLists.txt`:

  ```cmake
  cmake_minimum_required(VERSION 3.20)
  project(main)
  add_executable(main main.c print.c)
  ```

  接着只需要执行

  ```bash
  mkdir build && cd build
  cmake ..
  make
  ```

  // Talking points:
  // CMake 的介绍超过本课程的范围. 它被创建出来是解决 Makefile 难以编写和维护的问题.
  // 但是在现如今, CMake 也缺少一些现代功能, 例如包管理等.
  // vcpkg, conan 等工具可以用来解决这个问题.

  // 另外值得一题的是, CMake 是跨平台的工具, 在 Linux 平台上, 下一步是生成 Makefile, 然后调用 make.
  // 但是在 Windows 平台上, 会生成 Visual Studio 的项目文件, 然后调用 MSBuild (msvc).

  // 在 Linux 上也可以选择其他编译工具, 比如 Ninja.
  // Ninja 是跟 Makefile 类似的构建工具, 但是更快, 更简洁.
]

#polylux-slide[
  #align(horizon)[
    == Rust?

    作为一个现代的编译语言, Rust 在语言层面解决了很多 C/C++ 的问题的同时, 自带的工具链也非常强大.

    作为课程的延伸, 请可以尝试使用 Rust 来编写项目, 了解一下 Rust 的工具链.
  ]
]

#polylux-slide[
  #align(horizon + center)[
    == Pt. 2\ Programming with Python
  ]
]

#polylux-slide[
  == Programming with Python

  在 Linux 上开发 Python 会比 Windows 上方便的多.

  从安装的角度, 只需要从软件仓库中安装即可:

  ```bash
  sudo apt install python3 python3-pip
  python3 -V
  pip3 -V

  # Run:
  python3 main.py
  ```

  #strike[在 Windows 上你甚至还要解决应用商店版本的 Python 污染 PATH 的问题].

  // Talking points:
  // Python REPL
  // python main.py
  // Windows 上麻烦事, winget search python
  // Windows 上安装方法, winget install Python.Python3.7 (?)
]

#polylux-slide[
  == Interpreted Lang / 解释型语言

  与编译型语言不同, 解释型语言并不是在编译期生成可执行文件, 而是在运行时解释执行.

  诸如 Python, Java 等语言会首先将代码转成 Bytecode, 接着在虚拟机上执行.

  得益于这些特性, 跨平台、动态类型等特性也就成为了可能.

  到 2024 年, 几乎所有发行版都会预装 Python.
]

#polylux-slide[
  == Python 2?

  与很多人猜测的不同, Python 其实并不是一门很新的语言.

  从 Python 2 到 Python 3, 这几乎完全是一门新语言, 最典型的就是 print 函数的变化.

  ```python
  print "Hello, World!"
  ```

  ```python
  print("Hello, World!")
  ```

  这样的转变使得迁移异常麻烦, 因此很多发行版(例如 Ubuntu), 出于历史原因, 仍然会预装 Python 2, 并且 `python` 默认指向 Python 2.

  如果可能的话, 在脚本/命令中显式指定 `python3` 可能是一个好习惯.
]

#polylux-slide[
  == Which Python?

  在 2023 年末, Python 3.7 已经 EOL (end of life). Python 并没有 LTS 的概念, 每个发行版都会以相同的周期维护、更新.

  #rect(inset: 0.5em)[
    *在 2024 年 5 月, 我们推荐 Python 3.11.* (或者发行版自带的版本)
  ]

  从 Python 2 $=>$ Python3 迁移的巨大代价让社区认识到了向后兼容的重要性, Python 3.x 几乎不会 break 之前的代码; 新版本的 Python 一般会带来新的语言特性, 诸如 typing 等.
]

#polylux-slide[
  == pip / 拿来主义

  Python (相比之下) 完善的包管理、社区是 Python 成为热门语言的原因之一.

  大部分时候不需要纠结「怎么使用第三方库的问题」,只需要简单的从 `PyPI` 安装即可.

  ```bash
  pip install numpy
  ```

  #set text(size: 20pt)
  因为网络问题, 也许需要加上 `-i` 参数指定源:

  ```bash
  pip install numpy -i https://pypi.tuna.tsinghua.edu.cn/simple
  ```
]

#polylux-slide[
  == pip / 拿来主义

  完善的第三方库带来的收益是巨大的, 通常情况下这意味着你可以更轻松的用 Python 来解决问题.

  #set text(size: 15pt)

  #strike[某打卡脚本]:

  ```python
  import requests
  import json
  import time
  import datetime
  import pytz
  import re
  import sys
  import argparse
  from bs4 import BeautifulSoup
  ```
]

#polylux-slide[
  == pip / 拿来主义
  #set text(size: 20pt)

  这也意味着需要一个更方面的办法来安装这些库, 通常的包装方法是 `requirements.txt`:

  ```txt
  requests==2.26.0
  numpy==1.21.2
  matplotlib==3.4.3
  ```

  其他人安装的时候只需要执行:

  ```bash
  pip install -r requirements.txt
  ```
  #rect(inset: 0.5em)[
    固定版本号通常是一个好习惯. 如果你的程度两年后没更新, 但是库更新了, 这时如果不指定版本号, 可能会导致代码无法运行.
  ]
]

#polylux-slide[
  == Virtualenv
  #set text(size: 20pt)

  上面提到, 通常我们需要指定第三方库的版本, 有时候这些库的版本可能会冲突.

  `pip` 不允许同时安装一个包的不同版本, 如果全局安装有冲突, 需要手动解决.

  一个解决方案是使用 `virtualenv`:

  ```bash
  python3 -m venv venv
  source venv/bin/activate
  pip install -r requirements.txt
  ```

  // Talking: `venv` 一般默认随 Python 一起安装, 也可以通过 `sudo apt install python3-venv` 安装.

  执行上述操作后的结果是: 在当前目录下生成了一个 `venv` 目录, 里面包含了一个独立的 Python 环境. 所有的 `pip` 包都会安装在这个环境下, 与全局环境隔离.

  进入环境后, `python` 和 `pip` 都会指向这个环境下的版本; 可以通过 `deactivate` 退出环境.
]

#polylux-slide[
  #align(horizon)[
    == Node.js?

    Node.js 的包管理器 npm 也是一个很好的包管理工具, 与 Python 的 pip 类似.

    作为课程的延伸, 请可以尝试使用 Node.js 来编写项目, 了解一下 Node.js 的工具链, 注意 `package.json` 的使用.
  ]
]

#polylux-slide[
  #align(horizon + center)[
    = Thanks.
  ]
]