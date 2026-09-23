# N-Queen Problem (Print all solutions)
# Reference: https://mojolang.org/docs/manual/get-started/

def is_safe(r: Int, c: Int, board: List[List[Int]], n: Int) -> Bool:
    # Check left columns in current row
    for i in range(c):
        if board[r][i] == 1:
            return False

    # Check upper-left diagonal
    var i = r
    var j = c
    while i >= 0 and j >= 0:
        if board[i][j] == 1:
            return False
        i -= 1
        j -= 1

    # Check lower-left diagonal
    i = r
    j = c
    while i < n and j >= 0:
        if board[i][j] == 1:
            return False
        i += 1
        j -= 1

    return True

def solve_nqueen(
    c: Int,
    mut buf: List[Int],
    mut result: List[List[Int]],
    mut board: List[List[Int]],
    n: Int
):
    if c >= n:
        var sol = List[Int]()
        for i in range(len(buf)):
            sol.append(buf[i])
        result.append(sol^)
        return

    for r in range(n):
        if is_safe(r, c, board, n):
            board[r][c] = 1
            buf.append(r + 1)
            solve_nqueen(c + 1, buf, result, board, n)
            _ = buf.pop(len(buf) - 1)
            board[r][c] = 0

def n_queens(n: Int) -> List[List[Int]]:
    var board = List[List[Int]]()
    for _ in range(n):
        var row = List[Int]()
        for _ in range(n):
            row.append(0)
        board.append(row^)

    var buf = List[Int]()
    var result = List[List[Int]]()
    solve_nqueen(0, buf, result, board, n)
    return result^

def main():
    var n = 4
    var solutions = n_queens(n)
    print("Found", len(solutions), "solutions for N =", n)
    for i in range(len(solutions)):
        print("Solution", i + 1, ": [", end="")
        for j in range(len(solutions[i])):
            print(solutions[i][j], end=" " if j < len(solutions[i]) - 1 else "")
        print("]")
