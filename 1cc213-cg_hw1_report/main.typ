#import "@preview/polylux:0.3.1": *

#set page(paper: "presentation-16-9")
#set text(size: 25pt)

#show raw.where(block: true): it => {
    box(
        fill: blue.lighten(95%),
        inset: (x: 10pt, y: 0pt),
        outset: (x: 0pt, y: 15pt),
        radius: 2pt,
    )[
        #set text(size: 20pt)
        #raw(it.text, lang: "bash")
    ]
}

#polylux-slide[
  #align(horizon + center)[
    = HW 1 - `MiniDraw`\ Highlights
\
    Tiankai Ma

    2024.03.08
  ]
]

#polylux-slide[
  == Modern C++\ `constexpr`

  With `constexpr`, more jobs could be done at compile time while making code simpler, example:

```cpp
// comp_canvas.h
static constexpr std::vector<ShapeType> all_types() {
    return {
        ShapeType::kDefault,
        ShapeType::kLine,
        //...
    }
}
```
#pagebreak()

```cpp
// window_minidraw.cpp
for (const auto type : Canvas::all_types()) {
    if (ImGui::Button(Canvas::name(type).c_str())) {
        p_canvas_->set_type(type);
    }
    ImGui::SameLine();
}

// better than:
if (ImGui::Button(Canvas::name(ShapeType::kDefault).c_str())) {
    p_canvas_->set_type(ShapeType::kDefault);
}
ImGui::SameLine();
if (ImGui::Button(Canvas::name(ShapeType::kLine).c_str())) {

//...
```
]

#polylux-slide[
  == Modern C++\ `enum class`

  `enum` behaves just like `int`, without type safety, which might cause unwanted behaviors, example:

  - Naming conflicts:

```cpp
int main() {
  enum Color { RED, GREEN, BLUE };
  enum TrafficLight { RED, YELLOW, GREEN };
  // error: redeclaration of 'RED'
  int Red = 2;
  // error: 'int Red' redeclared as different kind of symbol
}
```
#pagebreak()

  - Type safety:

```cpp
int main() {
  enum Color { RED, GREEN, BLUE };
  enum Gender { MALE, FEMALE };

  Color a = RED;
  Gender b = MALE;

  if(a == b) {
    cout<<"Equal"; // warning, but compiles.
  }
}
```

#pagebreak()

  - `enum class` is a better choice, with type safety, defined one as the following:
```cpp
int main() {
  enum class EnumName { EnumValue1, EnumValue2, ... };
  EnumName objName = EnumName::EnumValue1;
  // or just
  auto objName = EnumName::EnumValue1;

  // and compare with:
  if (objName == EnumName::EnumValue1) {
    // which is ensured to be safe.
  }
}
```
]

#polylux-slide[
  == Modern C++\ `decltype` & `inline`

  Sometimes when types are overly complicated, `decltype` could be used to simplify the code, example:

```cpp
using IM_COL32_D = decltype(IM_COL32(0, 0, 0, 0));

// where:
#define IM_COL32(R,G,B,A) (((ImU32)(A)<<IM_COL32_A_SHIFT) | ((ImU32)(B)<<IM_COL32_B_SHIFT) | ((ImU32)(G)<<IM_COL32_G_SHIFT) | ((ImU32)(R)<<IM_COL32_R_SHIFT))
```

So the opacity function could be defined as:

#pagebreak()

```cpp
/*
 * Adjusts the alpha value of a color.
 * @param color The color to adjust.
 * @param alpha The alpha value to multiply the color alpha by.
 * @return The color with its alpha adjusted.
 */

inline IM_COL32_D opacity(IM_COL32_D color, float alpha)
{
    return IM_COL32(
        (color >> IM_COL32_A_SHIFT) * alpha,
        (color >> IM_COL32_B_SHIFT) & 0xFF,
        (color >> IM_COL32_G_SHIFT) & 0xFF,
        (color >> IM_COL32_R_SHIFT) & 0xFF);
}
```

#pagebreak()

It's worth noticing that `inline` keyword now no longer means "inline" in Modern C++. Modern C++ compilers are already smart enough to decide whether to inline a function or not, so `inline` is now used to avoid multiple definitions of the same function in different translation units.

You could now define a function in a header file without worrying about multiple definitions, example:

```cpp
// header.h
inline void foo() {
    //...
}
```
]

#polylux-slide[
  == Undo & Redo

  Modeling:

```cpp
struct History
{
    Action action;
    std::shared_ptr<Shape> shape;
    size_t delete_index = -1;
};

std::vector<History> history_actions;
size_t history_index = -1;
```

#pagebreak()

  Design Goals:
  - History of Undo & Redo are *linear*\
    - When a diff occours, the redo history is cleared, and related variables are recycled to avoid memory leaks.
  - With Undos & Redos, the result state is always identical to the initial state.
    - This allows us to use one `size_t` to refence the location of deleted `Shape`
]

#polylux-slide[
  == Shortcuts

  Implementing some useful shortcuts might bring significant improvements to the user experience, example:

  - _Ctrl + Z_: Undo
  - _Ctrl + Y_: Redo
  - Pressing _Shift_ when drawing a _Rect_ to make it a _Square_, etc.
]

#polylux-slide[
  == Class Diagram

#columns(2)[
  #image("./model.png", width: 100%)
  #colbreak()
  Using `clang-uml` to generate PlantUML files, and then using `PlantUML` to generate the class diagram.

  Related document have already added to homework repo through #link("https://github.com/USTC-CG/USTC_CG_24/pull/5")[#text(fill: blue)[PR #5]].
]
]

#polylux-slide[
  #align(horizon + center)[
    = Thanks.
  ]
]