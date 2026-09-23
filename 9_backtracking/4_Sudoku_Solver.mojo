# Sudoku Solver (Backtracking)
# Reference: https://mojolang.org/docs/manual/get-started/

def is_valid_sudoku_move(grid: List[List[Int]], row: Int, col: Int, num: Int) -> Bool:
    # Check row
    for c in range(9):
        if grid[row][c] == num:
            return False

    # Check col
    for r in range(9):
        if grid[r][col] == num:
            return False

    # Check 3x3 box
    var start_r = (row // 3) * 3
    var start_c = (col // 3) * 3
    for r in range(start_r, start_r + 3):
        for c in range(start_c, start_c + 3):
            if grid[r][c] == num:
                return False

    return True

def solve_sudoku(mut grid: List[List[Int]]) -> Bool:
    var empty_r = -1
    var empty_c = -1
    var has_empty = False

    for r in range(9):
        for c in range(9):
            if grid[r][c] == 0:
                empty_r = r
                empty_c = c
                has_empty = True
                break
        if has_empty:
            break

    if not has_empty:
        return True

    for num in range(1, 10):
        if is_valid_sudoku_move(grid, empty_r, empty_c, num):
            grid[empty_r][empty_c] = num
            if solve_sudoku(grid):
                return True
            grid[empty_r][empty_c] = 0

    return False

def print_grid(grid: List[List[Int]]):
    for r in range(9):
        for c in range(9):
            print(grid[r][c], end=" ")
        print()

def main():
    var grid = List[List[Int]]()
    for _ in range(9):
        var row = List[Int]()
        for _ in range(9):
            row.append(0)
        grid.append(row^)

    # Initial 9x9 board configuration
    grid[0][0] = 3; grid[0][2] = 6; grid[0][3] = 5; grid[0][5] = 8; grid[0][6] = 4
    grid[1][1] = 2; grid[1][8] = 3
    grid[2][7] = 2
    grid[3][2] = 2; grid[3][6] = 9
    grid[4][1] = 4; grid[4][7] = 8
    grid[5][2] = 8; grid[5][6] = 6
    grid[6][1] = 6
    grid[7][0] = 5; grid[7][7] = 7
    grid[8][2] = 4; grid[8][3] = 1; grid[8][5] = 6; grid[8][6] = 5

    print("Initial Sudoku grid:")
    print_grid(grid)

    var solved = solve_sudoku(grid)
    if solved:
        print("\nSolved Sudoku grid:")
        print_grid(grid)
    else:
        print("No solution exists")
