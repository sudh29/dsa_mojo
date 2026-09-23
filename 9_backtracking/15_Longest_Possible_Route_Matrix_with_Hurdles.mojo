# Longest Possible Route in a Matrix with Hurdles
# Reference: https://mojolang.org/docs/manual/get-started/

def solve_longest_path(
    mat: List[List[Int]],
    n: Int,
    m: Int,
    i: Int,
    j: Int,
    xd: Int,
    yd: Int,
    mut visited: List[List[Bool]],
    curr_len: Int,
    mut max_len: Int
):
    if i == xd and j == yd:
        if curr_len > max_len:
            max_len = curr_len
        return

    if i < 0 or j < 0 or i >= n or j >= m or mat[i][j] == 0 or visited[i][j]:
        return

    visited[i][j] = True

    var dr = List[Int](); dr.append(-1); dr.append(1); dr.append(0); dr.append(0)
    var dc = List[Int](); dc.append(0); dc.append(0); dc.append(-1); dc.append(1)

    for k in range(4):
        var ni = i + dr[k]
        var nj = j + dc[k]
        if ni >= 0 and ni < n and nj >= 0 and nj < m:
            if mat[ni][nj] == 1 and not visited[ni][nj]:
                solve_longest_path(mat, n, m, ni, nj, xd, yd, visited, curr_len + 1, max_len)

    visited[i][j] = False

def longest_path(
    mat: List[List[Int]],
    n: Int,
    m: Int,
    xs: Int,
    ys: Int,
    xd: Int,
    yd: Int
) -> Int:
    if mat[xs][ys] == 0 or mat[xd][yd] == 0:
        return -1

    var visited = List[List[Bool]]()
    for _ in range(n):
        var row = List[Bool]()
        for _ in range(m):
            row.append(False)
        visited.append(row^)

    var max_len = -1
    solve_longest_path(mat, n, m, xs, ys, xd, yd, visited, 0, max_len)
    return max_len

def main():
    var n = 3
    var m = 10
    var mat = List[List[Int]]()
    for _ in range(n):
        mat.append(List[Int]())

    # 3x10 grid with hurdles (0)
    mat[0].append(1); mat[0].append(1); mat[0].append(1); mat[0].append(1); mat[0].append(1); mat[0].append(1); mat[0].append(1); mat[0].append(1); mat[0].append(1); mat[0].append(1)
    mat[1].append(1); mat[1].append(1); mat[1].append(0); mat[1].append(1); mat[1].append(1); mat[1].append(0); mat[1].append(1); mat[1].append(1); mat[1].append(0); mat[1].append(1)
    mat[2].append(1); mat[2].append(1); mat[2].append(1); mat[2].append(1); mat[2].append(1); mat[2].append(1); mat[2].append(1); mat[2].append(1); mat[2].append(1); mat[2].append(1)

    print("Longest path from (0,0) to (1,7):", longest_path(mat, n, m, 0, 0, 1, 7))
