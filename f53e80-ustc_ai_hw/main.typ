#import "@preview/cetz:0.2.2": canvas, draw, tree
#set text(
  font: ("Source Han Serif SC", "Source Han Serif"),
  size: 10pt,
)

= USTC/AI2024 人工智能基础 书面作业

PB21000030 马天开

== HW4
Due 2024.04.09
=== Question 5.9

5.9 本题以井字棋（圈与十字游戏）为例练习博弈中的基本概念. 定义 $X_n$ 为恰好有 $n$ 个 $X$ 而没有 $O$ 的行、列或者对角线的数目. 同样 $O_n$ 为正好有 $n$ 个 $O$ 的行、列或者对角线的数目. 效用函数给 $X_3=1$ 的棋局 $+1$, 给 $O_3 = 1$ 的棋局 $-1$. 所有其他终止状态效用值为 $0$. 对于非终止状态, 使用线性的评估函数定义为 $"Eval"(s) = 3X_2(s) + X_1(s) - (3 O_2(s) + O_1(s))$ .

a. 估算可能的井字棋局数.

b. 考虑对称性, 给出从空棋盘开始的深度为2的完整博弈树(即, 在棋盘上一个 $X$ 一个 $O$ 的棋局).

c. 标出深度为$2$的棋局的评估函数值.

d. 使用极小极大算法标出深度为$1$和$0$的棋局的倒推值,并根据这些值选出最佳的起始行棋.

e. 假设结点按对 $alpha-beta$ 剪枝的最优顺序生成, 圈出使用 $alpha-beta$ 剪枝将被剪掉的深度为2的结点.

#text(fill: blue)[
  === Solution 5.9

  a. 考虑到最小深度 $5$, 最大深度 $9$, 每个位置有 $3$ 种可能, 因此可能的井字棋局数为 $ sum_(i=5)^9 i! approx 4.1 times 10^5 $

  上述估算给出了实际局数的一个上界, 显然部分棋局在中途就会因为一方胜利而结束. 在此数量级上, 我们可以通过简单的程序给出实际上的井字棋局数:

  完整的代码链接放在了 #link("https://gist.github.com/tiankaima/5a58fcf5dd3b53b29ff75b0347ba889a")[这里], 也放在本次作业的末尾, 运行后得到:

  ```text
  Total possible games: 255168
  Total win for player 1: 131184
  Total win for player 2: 77904
  Total draw: 46080
  ```

  #rect(width: 100%, height: 0.2pt, fill: blue)

  b, c, d, e: 如图:

  #align(center)[
    #image("./img/Solution_5.9.jpg", width: 60%, fit: "contain")
  ]

  其中 d 的最佳行棋为 顶点 / 中心处; 剪枝、评估函数值等已标注在图中.
]

=== Question 5.8

5.8 考虑图 5.17 中描述的两人游戏.

a. 根据如下约定画出完整博弈树:

- 每个状态用 $(s_A, s_B)$表示, 其中 $s_A$ 和 $s_B$ 表示棋子的位置.
- 每个终止状态用方框画出, 用圆圈写出它的博弈值.
- 把循环状态（在到根结点的路径上已经出现过的状态）画上双层方框. 由于不清楚他们的值, 在圆圈里标记一个“? ”.

b. 给出每个结点倒推的极小极大值（也标记在圆圈里). 解释怎样处理“?”值和为什么这么处理.

c. 解释标准的极小极大算法为什么在这棵博弈树中会失败, 简要说明你将如何修正它, 在（b）的图上画出你的答案. 你修正后的算法对于所有包含循环的游戏都能给出最优决策吗?

d. 这个4-方格游戏可以推广到$n$个方格, 其中. 证明如果 $n$ 是偶数 $A$ 一定能赢, 而 $n$ 是奇数则 $A$ 一定会输.

#text(fill: blue)[
  === Solution 5.8

  a, b:
  #align(center)[
    #image("./img/Solution_5.8_1.jpg", width: 50%, fit: "contain")
  ]

  b, c:
  对上述循环状态, 可以先赋 $0$, 计算出重复节点真实值, 再回溯更新 ($alpha-beta$ 向前剪枝).
  考虑一组循环的更新路径 $(P_1, dots.c, P_(2k), P_1)$, 考虑其中的一次更新 $P_i$, 即 $P_i^' = "MAX"("MIN"(dots.c "MIN"(P_i, dots.c )))$, 其中 $P_i = "MAX"("MIN"(dots.c "MIN"(0, dots.c )))$, 这样的更新是至多平凡的, 意味着从 $(P_i, P_(i-1), P_(i-2))$ 的更新至多为 $P_i$ 本身, 并且从一个节点开始停止.
  // 通过这样的做法,
  对于 $"MIN"$ 节点的操作类似, 在一般性包含循环的游戏中都能给出最优决策.
  // *这样的迭代总能在有限时间完成: * 反证, 如果存在无限时间的迭代更新, 必然存在一组循环的更新路径 $(P_1, dots.c, P_2k, P_1)$, 考虑其中的一次更新 $P_i$, 即 $P_i^' = "MAX"("MIN"(dots.c "MIN"(P_i, dots.c )))$, 其中 $P_i = "MAX"("MIN"(dots.c "MIN"(0, dots.c )))$, 这样的更新是至多平凡的, 意味着从 $(P_i, P_(i-1), P_(i-2))$ 的前向更新至多更新为 $P_i$ 本身

  #box[
    d:
    在上述博弈图中, 我们容易发现
    - $n=3$ 时, B 总有必胜策略 (考虑从 $=>^A (1,3)$ 开始的子图, 并去掉 $=>^B (3,4)$ 的分枝)
    - $n=4$ 时, A 总有必胜策略
    - $n=5$ 时, B的必胜策略: $(1,5) =>^A (2,5) =>^B (2,4) =>^A {(1,4), (3,4)}$, 前者可以视为颠倒的 $n=4$ 的情况(左右颠倒、选手颠倒), 后者的必胜策略: $ (3,4) =>^B (3,2) =>^A (x, 2) =>^B (x, 1) $ 即可获胜.

    #rect(stroke: blue.opacify(50%))[
      考虑到对 $n<=2$ 时游戏无意义, 奇数的部分与偶数的部分讨论类似, 我们下面仅讨论 $n=2i, 2<=i<=k$ 时 A 有必胜策略, $n=2k+2$ 时 A 的必胜策略:

      $
      (1, 2k+2) =>^A (2, 2k+2) =>^B (2, 2k+1) =>^A (3, 2k+1) &=>^B (3, 2k+2) =>^A dots.c quad & (2k-2) \
      & =>^B (3, 2k) =>^A dots.c quad & (2k - 4)
      $

      只需要将 $n = 2k - 2$ 的策略应用到 $(3, 2k+2)$, $n = 2k - 4$ 的策略应用到 $(3, 2k)$ 即可(始终不向左走, 并且在 $B$ 第一次到达 $3$ 之前到达$2k+2$, 在此之前 B 不可能到达 $1$)
    ]
  ]
]

=== Question 5.13

请给出 $alpha - beta$ 剪枝正确性的形式化证明. 要做到这一点需要考虑图 5.18, 问题为是否要剪掉节点 $n_j$, 它是一个 MAX 节点, 是 $n_1$ 的一个后代. 基本思路是当且仅当 $n_1$ 的极小极大值可以被证明独立于 $n_j$ 的值时, 会发生剪枝.

a. $n_1$ 的值是所有后代节点的最小值 $n_1 = min(n_2, n_(2,1), dots.c , n_(2 b_2))$, 请为 $n_2$ 找到类似的表达式, 以便得到用$n_j$ 表示的 $n_1$ 的表达式.

#text(fill: blue)[
  $
  &n_2 = max(n_(2,1), n_(2,2), dots.c , n_(2 b_2)) \
  &n_1 = min(max(min( ... quad max(n_j, dots.c), dots.c), dots.c))
  $
]

b. #strike[深度为 $i$ 的结点 $n_i$ 的极小极大值已知, $l_i$ 是在结点 $n_i$ 左侧结点的极小值（或者极大值). 同样, $r_i$ 是 $n_i$ 在右侧的未探索过的结点的极小值(或者极大值). 用 $l_i$ 和 $r_i$ 的值重写 $n_1$ 的表达式. ]

*这个翻译完全不准确, 正确的翻译是:*

$l_i$ 是在结点 $n_i$ 左侧结点的极小值（或者极大值), 其大小已知. 同样, $r_i$ 是 $n_i$ 在右侧的未探索过的结点的极小值(或者极大值). 用 $l_i$ 和 $r_i$ 的值重写 $n_1$ 的表达式.

#text(fill: blue)[
  $
  &n_1 = min(l_2, n_2, r_2) \
  &n_2 = max(l_3, n_3, r_3) \
  &dots \
  &n_1 = min(l_2, max(l_3, dots.c , n_j, dots.c), r_1)
  $
]

c. 现在重新形式化表达式, 来说明为了向 $n_1$ 施加影响, 不能超出由 $l_i$ 值得到的某特定界限.

#text(fill: blue)[
  // 根据 $alpha-beta$ 剪枝的递归性质, $forall i<j quad n_i$ 均能对 $n_1$ 施加影响, 这样的影响是逐层的, 意味着 $n_(i-1)$ 能对 $n_i$ 施加影响. 显然, 逐层的性质是*充要*的.
  // 考虑 $n_(j-2) = max(l_(j-1), n_(j-1), r_(j-1)) = max(l_(j-1), min(l_j, n_j, r_j), r_(j-1))$
  // - 如果 $n_j > l_j$, 那么 $n_(j-1) tilde (l_j, r_j)$. 不存在从 $n_j$ 到 $n_(j-1)$ 的影响.
  // - 如果 $n_j < l_(j-1)$, 那么 $min(l_j, n_j, r_j) < n_j < l_(j-1) => n_(j-2) tilde (l_(j-1), r_(j-1))$, 不存在从 $n_(j-1)$ 到 $n_(j-2)$ 的影响.
  // 对以上讨论进行归纳, 容易得到 $n_j > l_(2k + 1), forall k$
  // 考虑所有 MAX 节点 $2k-1$ 的 子节点, $l_(2k)$ 是已经探索过的最大值. 如果 $n_j < l_(2k)$, 在如下的操作时, $n_j$ 的值会被忽略:
  // $
  // n_(2k-1) = max(l_(2k), n_(2k), r_(2k)) > l_(2k) > n_j
  // $

  考虑对定义做如下改进, 我们自下而上定义 $n_(2k+1)^' = max(l_(2k+2), n_(2k+2))$ 以及 $n_(2k)^' = min(l_(2k), n_(2k+1))$:

  $
  &n_1^' = min(l_2, n_2) \
  &n_2^' = max(l_3, n_3) \
  &dots \
  &n_(j-1)^' = min(l_j, n_j) \
  $

  这样 $n_j$ 对 $n_1$ 施加影响 $<=>$ $n_1^' = n_2^' = dots.c = n_j$

  因此只需要满足: $forall i = 2k$, $n_i^' <=l_i$, $forall i = 2k+1$, $n_i^' >= l_i$,

  $
  n_j = n_i^' <= l_i, &forall i = 2k + 1 &quad => quad n_j &<= min(l_3, l_5, dots.c, l_(j-1)) &= beta\
  n_j = n_i^' >= l_i, &forall i = 2k &quad => quad n_j &>= max(l_2, l_4, dots.c, l_j) &= alpha
  $

  对应到 $n_j$ 作为 MAX 节点:

  - $max(n_(j+1, 1), n_(j+1, 2), dots.c n_(j+1, b_(j+1))) <= beta$, 因此 只需要在遍历子节点时, 保证 $n_(j, b_i) <= beta$

  - $max(n_(j+1, 1), n_(j+1, 2), dots.c n_(j+1, b_(j+1))) >= alpha$, 可在遍历后由父节点 (MIN) 判断

  不满足上述要求的节点可以被剪掉.
]

d. 假设 $n_j$ 是 MIN 节点的情况, 请重复上面的过程.

#text(fill: blue)[
  对应到 $n_j$ 作为 MIN 节点:

  - $min(n_(j+1, 1), n_(j+1, 2), dots.c n_(j+1, b_(j+1))) <= beta$, 可在遍历后由父节点 (MAX) 判断

  - $min(n_(j+1, 1), n_(j+1, 2), dots.c n_(j+1, b_(j+1))) >= alpha$, 因此 只需要在遍历子节点时, 保证 $n_(j, b_i) >= alpha$

  上述过程实际上给出了 $alpha-beta$ 剪枝的一个构造, 保证了形式化证明的正确性.
]

#pagebreak()

=== Appendix
==== Question 5.9 Code

```cpp
#include "iostream"
#include "vector"

typedef struct {
    unsigned char data[9];
} TicTacToeBoard;

std::vector<TicTacToeBoard> next_moves(const TicTacToeBoard &board, int player) {
    std::vector<TicTacToeBoard> moves;
    for (int i = 0; i < 9; i++) {
        if (board.data[i] == 0) {
            TicTacToeBoard new_board = board;
            new_board.data[i] = player;
            moves.push_back(new_board);
        }
    }
    return moves;
}

unsigned char is_game_finished(const TicTacToeBoard &board) {
    // Check rows
    for (int i = 0; i < 3; i++) {
        if (board.data[i * 3] != 0 && board.data[i * 3] == board.data[i * 3 + 1] &&
            board.data[i * 3] == board.data[i * 3 + 2]) {
            return board.data[i * 3];
        }
    }
    // Check columns
    for (int i = 0; i < 3; i++) {
        if (board.data[i] != 0 && board.data[i] == board.data[i + 3] && board.data[i] == board.data[i + 6]) {
            return board.data[i];
        }
    }
    // Check diagonals
    if (board.data[0] != 0 && board.data[0] == board.data[4] && board.data[0] == board.data[8]) {
        return board.data[0];
    }
    if (board.data[2] != 0 && board.data[2] == board.data[4] && board.data[2] == board.data[6]) {
        return board.data[2];
    }

    // if the board is full
    bool flag = true;
    for (unsigned char i: board.data) {
        if (i == 0) {
            flag = false;
            break;
        }
    }
    if (flag) return 0;

    return 3;
}

int total_possible_games = 0;
int total_win_for_player1 = 0;
int total_win_for_player2 = 0;
int total_draw = 0;

void play_game(TicTacToeBoard board, int player) { // NOLINT(*-no-recursion)
    unsigned char result = is_game_finished(board);
    if (result != 3) {
        total_possible_games++;
        if (result == 1) {
            total_win_for_player1++;
        } else if (result == 2) {
            total_win_for_player2++;
        } else {
            total_draw++;
        }
        return;
    }

    std::vector<TicTacToeBoard> moves = next_moves(board, player);
    for (TicTacToeBoard &move: moves) {
        play_game(move, 3 - player);
    }
}

int main() {
    TicTacToeBoard initial_board = {0, 0, 0, 0, 0, 0, 0, 0, 0};

    play_game(initial_board, 1);

    std::cout << "Total possible games: " << total_possible_games << std::endl;
    std::cout << "Total win for player 1: " << total_win_for_player1 << std::endl;
    std::cout << "Total win for player 2: " << total_win_for_player2 << std::endl;
    std::cout << "Total draw: " << total_draw << std::endl;
}
```

#pagebreak()

== HW3
Due 2024.03.31
=== Question 6.5

6.5 分别用带有前向检验、MRV 和最少约束值启发式的回溯算法手工求解图 6.2 中的密码算术问题.

#set text(fill: blue)
=== Solution 6.5

首先考虑 1-相容：

#align(center)[
  #table(
    stroke: blue,
    columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto),
    align: center,
    [$C_1$],
    [$C_2$],
    [$C_3$],
    [$F$],
    [$T$],
    [$U$],
    [$W$],
    [$R$],
    [$O$],
    [$0, 1$],
    [$0, 1$],
    [$0, 1$],
    [$1-9$],
    [$1-9$],
    [$0-9$],
    [$0-9$],
    [$0-9$],
    [$0-9$],
  )
]

所有约束：

$
2O &= R + 10 dot C_3 \
2W + C_3 &= U + 10 dot C_2 \
2T + C_2 &= O + 10 dot C_1 \
C_1 &= F \
"ALLDIFF" & {F, T, U, W, R, O}
$

按照 $X_i$ 进行整理：

$
C_1&: <C_1, F>, <C_1, C_2, T, O> \
C_2&: <C_2, C_3, U, W>, <C_1, C_2, T, O> \
C_3&: <C_3, R, O>, <C_2, C_3, U, W> \
F&: <C_1, F> \
T&: <C_1, C_2, T, O> \
U&: <C_2, C_3, U, W> \
W&: <C_2, C_3, U, W> \
R&: <C_3, R, O> \
O&: <C_3, R, O>, <C_1, C_2, T, O> \
$

#align(center)[
  #table(
    stroke: blue,
    columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto, auto),
    align: center,
    [],
    [$C_1$],
    [$C_2$],
    [$C_3$],
    [$F$],
    [$T$],
    [$U$],
    [$W$],
    [$R$],
    [$O$],
    [$<C_1, F>$],
    [$1$],
    [$0, 1$],
    [$0, 1$],
    [$1$],
    [$1-9$],
    [$0-9$],
    [$0-9$],
    [$0-9$],
    [$0-9$],
    [$<C_3, R, O> and "ALLDIFF"$],
    [$1$],
    [$0, 1$],
    [$0, 1$],
    [$1$],
    [$1-9$],
    [$0-9$],
    [$0-9$],
    [$0-9$],
    [$1-9$],
    [$"ALLDIFF"$],
    [$1$],
    [$0, 1$],
    [$0, 1$],
    [$1$],
    [$2-9$],
    [$0, 2-9$],
    [$0, 2-9$],
    [$0, 2-9$],
    [$2-9$],
    [$<C_3, R, O>$],
    [$1$],
    [$0, 1$],
    [$0, 1$],
    [$1$],
    [$2-9$],
    [$0, 2-9$],
    [$0, 2-9$],
    [$0, 2, 4, 6, 8$],
    [$2-9$],
    [$<C_1, C_2, T, O>$],
    [$1$],
    [$0, 1$],
    [$0, 1$],
    [$1$],
    [$5-9$],
    [$0, 2-9$],
    [$0, 2-9$],
    [$0, 2, 4, 6, 8$],
    [$2-9$],
    [$"SET:" C_2 = 0$],
    [$1$],
    [$0$],
    [$0, 1$],
    [$1$],
    [$5-9$],
    [$0, 2-9$],
    [$0, 2-9$],
    [$0, 2, 4, 6, 8$],
    [$2-9$],
    [$<C_2, C_3, U, W>$],
    [$1$],
    [$0$],
    [$0, 1$],
    [$1$],
    [$5-9$],
    [$0, 2-9$],
    [$0, 2, 3, 4$],
    [$0, 2, 4, 6, 8$],
    [$2-9$],
    [$<C_1, C_2, T, O>$],
    [$1$],
    [$0$],
    [$0, 1$],
    [$1$],
    [$5-9$],
    [$0, 2-9$],
    [$0, 2, 3, 4$],
    [$0, 2, 4, 6, 8$],
    [$2, 4, 6, 8$],
    [$"SET:" C_3 = 0$],
    [$1$],
    [$0$],
    [$0$],
    [$1$],
    [$5-9$],
    [$0, 2-9$],
    [$0, 2, 3, 4$],
    [$0, 2, 4, 6, 8$],
    [$2, 4, 6, 8$],
    [$<C_3, R, O>$],
    [$1$],
    [$0$],
    [$0$],
    [$1$],
    [$5-9$],
    [$0, 2-9$],
    [$0, 2, 3, 4$],
    [$0, 4, 8$],
    [$2, 4$],
    [$<C_1, C_2, T, O>$],
    [$1$],
    [$0$],
    [$0$],
    [$1$],
    [$5, 6, 7$],
    [$0, 2-9$],
    [$0, 2, 3, 4$],
    [$0, 4, 8$],
    [$2, 4$],
    [$<C_2, C_3, U, W>$],
    [$1$],
    [$0$],
    [$0$],
    [$1$],
    [$5, 6, 7$],
    [$0, 4, 6, 8$],
    [$0, 2, 3, 4$],
    [$0, 4, 8$],
    [$2, 4$],
    [$"SET:" O=4$],
    [$1$],
    [$0$],
    [$0$],
    [$1$],
    [$5, 6, 7$],
    [$0, 4, 6, 8$],
    [$0, 2, 3, 4$],
    [$0, 4, 8$],
    [$4$],
    [$"ALLDIFF"$],
    [$1$],
    [$0$],
    [$0$],
    [$1$],
    [$5, 6, 7$],
    [$0, 6, 8$],
    [$0, 2, 3$],
    [$0, 8$],
    [$4$],
    [$<C_3, R, O>$],
    [$1$],
    [$0$],
    [$0$],
    [$1$],
    [$5, 6, 7$],
    [$0, 6, 8$],
    [$0, 2, 3$],
    [$8$],
    [$4$],
    [$"ALLDIFF"$],
    [$1$],
    [$0$],
    [$0$],
    [$1$],
    [$5, 6, 7$],
    [$0, 6$],
    [$0, 2, 3$],
    [$8$],
    [$4$],
    [$<C_2, C_3, U, W> and "ALLDIFF"$],
    [$1$],
    [$0$],
    [$0$],
    [$1$],
    [$5, 6, 7$],
    [$6$],
    [$3$],
    [$8$],
    [$4$],
    [$<C_1, C_2, T, O>$],
    [$1$],
    [$0$],
    [$0$],
    [$1$],
    [$7$],
    [$6$],
    [$3$],
    [$8$],
    [$4$],
  )
]

Solution:

$
&quad &quad 7 &quad 3 &quad 4 \
&quad + &quad 7 &quad 3 &quad 4 \
= &quad 1 &quad 4 &quad 6 &quad 8
$
#set text(fill: black)

=== Question 6.11

6.11 用 AC-3 算法说明弧相容对图 6.1 中问题能够检测出部分赋值 $"WA"="GREEN", "V" = "RED"$, 的不相容.

#set text(fill: blue)
=== Solution 6.11

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  stroke: blue,
  align: center,
  [],
  [WA],
  [NT],
  [Q],
  [NSW],
  [V],
  [SA],
  [T],
  [],
  [G],
  [R G B],
  [R G B],
  [R G B],
  [R],
  [R G B],
  [R G B],
  [WA, SA],
  [G],
  [R G B],
  [R G B],
  [R G B],
  [R],
  [R B],
  [R G B],
  [WA, NT],
  [G],
  [R B],
  [R G B],
  [R G B],
  [R],
  [R B],
  [R G B],
  [V, SA],
  [G],
  [R B],
  [R G B],
  [R G B],
  [R],
  [B],
  [R G B],
  [V, NSW],
  [G],
  [R B],
  [R G B],
  [G B],
  [R],
  [B],
  [R G B],
  [SA, NSW],
  [G],
  [R B],
  [R G B],
  [G],
  [R],
  [B],
  [R G B],
  [SA, Q],
  [G],
  [R B],
  [R G],
  [G],
  [R],
  [B],
  [R G B],
  [SA, NT],
  [G],
  [R],
  [R G],
  [G],
  [R],
  [B],
  [R G B],
  [NT, Q],
  [G],
  [R],
  [G],
  [G],
  [R],
  [B],
  [R G B],
)

注意到此时 $Q="NSB"="GREEN"$, 破坏约束, AC-3 算法可以检测出这种不相容.

#set text(fill: black)

=== Question 6.12

6.12 用 AC-3 算法求解树结构 CSP 在最坏情况下的复杂度是多少？

#set text(fill: blue)
=== Solution 6.12

树结构中每个弧最多会被检查一次, 因此 AC-3 最坏情况下复杂度为 $O(E D)$, 其中 $E$ 为弧的数量, $D$ 为定义域的大小.

// 对应的算法考虑如下：

// - 对于每个节点$X_i$, 当前的取值范围 $D_0$
// - 遍历子节点 $X_j$, 记录 $<X_i, X_j>$ 允许的 $X_i$ 的取值范围 $D_(i,j)$
// - 取所有 $D_(i j)$ 的交集 $D_1$
// - 获得 $D_i = D_0 sect D_1$ 作为 $X_i$ 新的取值范围
// - 遍历子节点 $X_j$, 记录 $<X_i, X_j>$ 允许的 $X_j$ 的取值范围 $D_(j)$, 记录到子节点上, 向下递归

// #box[
// 对应伪代码：(Python-style)
// ```python
// class Node:
//   D: set[Value]
//   father: Node
//   children: [Node]

// Constarint = [(Node, Node): [Value, Value]]

// def AC3_Tree(cur: Node, C: Constarint) -> bool:
//   D0 = cur.D
//   Ds = [(v[0] for v in C[(cur, child)]) for child in children]
//   D1 = intersect(Ds)
//   cur.D = intersect(D0, D1)
//   if len(cur.D) == 0:
//     return False

//   for child in children:
//     child.D = [v[1] for v in C[(cur, child)] if v[0] in cur.D]
//     if not AC3_Tree(child, C):
//       return False

//   return True

// AC3_Tree(root)
// ```
// ]

#set text(fill: black)

#pagebreak()

== HW 2
Due 2024.03.24
=== Question 4.1

4.1 追踪 $A^*$ 搜索算法用直线距离启发式求解从 Lugoj 到 Bucharest 问题的过程. 按照顺序列出算法扩展的节点和每个节点的 $f, g, h$ 值

#set text(fill: blue)
=== Solution 3.7

#let data_41 = (
  [Luogoj(244, 0, 244)],
  ([Timisora(440, 111, 329)]),
  (
    [Mehadia(316, 75, 241)],
    [Luogoj(384, 140, 244)],
    (
      [Dobreta(387, 145, 242)],
      (
        [Craiova(425, 265, 160)],
        [Rimnicu Vilcea(604, 411, 193)],
        (
          [Pitesti(501, 403, 98)],
          [Rimmiai Vileea\
            (693, 500, 193)],
          [Bucharest\
            (504, 504, 0)],
        ),
      ),
    ),
  ),
)

#canvas(
  length: 1cm,
  {
    import draw: *

    set-style(
      content: (padding: .2),
      fill: gray.lighten(70%),
      stroke: gray.lighten(70%),
    )

    tree.tree(
      data_41,
      spread: 3.,
      grow: 1.5,
      draw-node: (node, ..) => {
        content((), node.content)
      },
      draw-edge: (from, to, ..) => {
        line(
          (a: from, number: .6, b: to),
          (a: to, number: .6, b: from),
          mark: (end: ">"),
        )
      },
      name: "tree",
    )

    let ab = (
      ("tree.0", "tree.0-1"),
      ("tree.0-1", "tree.0-1-1"),
      ("tree.0-1-1", "tree.0-1-1-0"),
      ("tree.0-1-1-0", "tree.0-1-1-0-1"),
      ("tree.0-1-1-0-1", "tree.0-1-1-0-1-1"),
    )
    for _ab in ab {
      let (a, b) = _ab
      line((a, .6, b), (b, .6, a), mark: (end: ">"), stroke: red)
    }
  },
)
上方标红的路径即为 $A^*$ 搜索算法的最优路径, 从 Lugoj 到 Bucharest.

#set text(fill: black)

=== Question 4.2

4.2 启发式路径算法是一个最佳有限搜索, 它的目标函数是 $f(n) = (2-omega) g(n) + w h(n)$. 算法中$w$取什么值保证算法是最优的？当$w=0$时, 这个算法是什么搜索？$w=1$呢？$w=2$呢？

#set text(fill: blue)
=== Solution 4.2

- $w=0 => f(n) = 2g(n)$ 此时算法与 UCS 算法相同, 选择最小的 $g(n)$
- $w=1 => f(n) = g(n) + h(n)$ 此时算法与 $A^*$ 算法相同, 选择最小的 $f(n)$
- $w=2 => f(n) = 2h(n)$ 此时算法与 Greedy 算法相同, 选择最小的 $h(n)$

考虑到 $ f(n) = (2-omega)[g(n) + omega/(2-omega) h(n)] $
这与以 $ h_1(n) = omega/(2-omega)h(n) $ 作为启发式函数的 $A^*$ 算法相同.

当 $omega<1$ 时, $h_1(n)<h(n)$. 当且仅当 $omega=1$ 时, $h_1(n)=h(n)$, 此时算法是最优的.

#set text(fill: black)

=== Question 4.6

4.6 设计一个启发函数, 使它在八数码游戏中有时会估计过高, 并说明它在什么样的特殊问题下会导致次最优解.(可以借助计算机的帮助)
证明：如果 $h$ 被高估的部分从来不超过 $c$, $A^*$ 算法返回的解的耗散多出的部分也不超过 $c$.

#set text(fill: blue)
=== Solution 4.6

- *设计一个启发函数, 使它在八数码游戏中有时会估计过高, 并说明它在什么样的特殊问题下会导致次最优解. *

#image("./img/Solution_4.6.jpg", width: 70%)

- *证明：如果 $h$ 被高估的部分从来不超过 $c$, $A^*$ 算法返回的解的耗散多出的部分也不超过 $c$.*

考虑 $h(n)<=h^*(n)+c$, 并且令$G^'$为耗散超过$c$的解 ($g(G^') > C^* + c$). 考虑在到达最优解的路径上所有节点$n$:

$
f(n) = g(n) + h(n) <= g(n) + h^*(n) + c = g(G) + h^*(G) + c = C^* + c <= g(G^')
$

在到达最优解之前不会到达 $G^'$, 这样 $A^*$ 算法返回的解的耗散多出的部分也不超过 $c$.

#set text(fill: black)

=== Question 4.7

4.7 证明如果一个启发式是一致的, 它肯定是可采纳的. 构造一个非一致的可采纳启发式.

#set text(fill: blue)
=== Solution 4.7

- 一致：$h(n) <= c(n, a, n') + h(n')$
- 可采纳：$h(n) <= h^*(n)$

一致 $=>$ 可采纳性：按归纳法, $k=1$ 时, 取 $n^'$为目标节点, $h(n) <= c(n, a, n')$; 假设 $k$ 时成立, 则 $h(n) <= c(n, a, n') + h(n') <= c(n, a, n') + h^*(n') = h^*(n)$, 所以距离 $k+1$ 步远的节点上 $h(n)$ 也是可采纳的.

构造一个非一致的可采纳启发式:

#image("./img/Solution_4.7.jpg", width: 50%)

#set text(fill: black)

#pagebreak()

== HW 1
Due: 2024.03.17
=== Question 3.7

3.7 给出下列问题的初始状态、目标测试、后继函数和耗散函数. 选择精确得足以实现的形式化.

- a. 只用四种颜色对平面地图染色, 要求每两个相邻的地区不能染成相同的颜色.
- b. 一间屋子里有一只 3 英尺高的猴子, 屋子的房顶上挂着一串香蕉, 离地面 8 英尺. 屋子里有两个可叠放起来、可移动、可攀登的 3 英尺高的箱子. 猴子很想得到香蕉.
- c. 有一个程序, 当送入一个特定文件的输入记录时会输出“不合法的输入记录”. 已知每个记录的处理独立于其它记录. 要求找出哪个记录不合法.
- d. 有三个水壶, 容量分别为 12 加仑、8 加仑和 3 加仑, 还有一个水龙头. 可以把壶装满或者倒空, 从一个壶倒进另一个壶或者倒在地上. 要求量出刚好 1 加仑水.

#set text(fill: blue)
=== Solution 3.7

- a:
  - Initial State: 所有区域未染色
  - Goal Test: 所有区域都染色
  - Successor Function: 选择一个未染色的区域, 为其染上一种颜色
  - Cost Function: 涂色的次数
- b:
  - Initial State: 猴子在屋子的地面, 箱子在屋子的地面, 香蕉距离地面 8 英尺
  - Goal Test: 猴子站在箱子上, 可以够到香蕉
  - Successor Function: 猴子搬动、放下箱子、爬上箱子、爬下箱子、拿起香蕉
  - Cost Function: 猴子总用时
- c:
  - Initial State: 一个输入记录
  - Goal Test: 输入记录合法
  - Successor Function: 修改输入记录的某一部分
  - Cost Function: 修改的次数
- d:
  - Initial State: 三个水壶都是空的
  - Goal Test: 一个水壶里有 1 加仑水
  - Successor Function: 装满水壶、倒空水壶、从一个壶倒进另一个壶
  - Cost Function: 倒水的次数

#set text(fill: black)

== Question 3.9

3.9 传教士和野人问题通常描述如下：三个传教士和三个野人在河的一边, 还有一条能载一个人或者两个人的船. 找到一个办法让所有的人都渡到河的另一岸, 要求在任何地方野人数都不能多于传教士的人数 (可以只有野人没有传教士). 这个问题在 AI 领域中很著名, 因为它是第一篇从分析的观点探讨问题形式化的论文的主题（Amarel, 1968）

- a. 精确地形式化该问题, 只描述确保该问题有解所必需的特性. 画出该问题的完全状态空间图.
- b. 用一个合适的搜索算法实现和最优地求解该问题. 检查重复状态是个好主意吗？
- c. 这个问题的状态空间如此简单, 你认为为什么人们求解它却很困难？

#set text(fill: blue)
=== Solution 3.9

==== a:

- 状态：$(a,b,c)$, $a$:传教士在此岸的人数, $b$:野人在此岸的人数, $c$:船是否在此岸 (0/1)
- Initial State: $(3,3,1)$
- Goal Test: $(0,0,0)$
- Successor Function:
$
(x,y,1) -> cases((x-1,y,0), (x,y-1,0), (x-1,y-1,0), (x-2,y,0), (x,y-2,0))
\
(x,y,0) -> cases((x+1,y,1), (x,y+1,1), (x+1,y+1,1), (x+2,y,1), (x,y+2,1))
$
同时所有$(x,y,c),(x',y',z')$满足$0<=x<=3, 0<=y<=3$, 并且：
$
(x=0 or x>=y) and (x=3 or x<=y)
$
- Cost Function: 操作次数

==== b:

使用 BFS 对状态进行搜索, 维护一个 $3 times 1$ 的数组记录已经访问过的状态：

$
(3,3,1) -> (3,1,0) -> (3,2,1) -> (3,0,0) -> (3,1,1) -> (1,1,0)\ -> (2,2,1) -> (0,2,0) -> (0,3,1) -> (0,1,0) -> (
  1,1,1
) -> (0,0,0)
$

问题中限制很多, 可以不考虑重复状态 (全部枚举即可). 如果问题中 $3 -> 100$, 检查重复状态是个好主意.

==== c:

虽然每一步的限制都足够多而且空间足够简单, 但图的深度很大, 每一步所需要做的判断过于复杂.

#set text(fill: black)
