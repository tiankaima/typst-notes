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