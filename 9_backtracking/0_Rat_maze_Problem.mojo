# Rat in a Maze Problem - I
# Reference: https://mojolang.org/docs/manual/get-started/

def dfs_maze(
    i: Int,
    j: Int,
    path: String,
    matrix: List[List[Int]],
    n: Int,
    mut visited: List[List[Int]],
    mut ans: List[String]
):
    if i < 0 or j < 0 or i >= n or j >= n:
        return
    if matrix[i][j] == 0 or visited[i][j] == 1:
        return
    if i == n - 1 and j == n - 1:
        ans.append(path)
        return

    visited[i][j] = 1

    # Order: D, L, R, U (or standard order with sorting)
    dfs_maze(i + 1, j, path + "D", matrix, n, visited, ans)
    dfs_maze(i, j - 1, path + "L", matrix, n, visited, ans)
    dfs_maze(i, j + 1, path + "R", matrix, n, visited, ans)
    dfs_maze(i - 1, j, path + "U", matrix, n, visited, ans)

    visited[i][j] = 0

def find_paths(matrix: List[List[Int]], n: Int) -> List[String]:
    var visited = List[List[Int]]()
    for _ in range(n):
        var row = List[Int]()
        for _ in range(n):
            row.append(0)
        visited.append(row^)

    var ans = List[String]()
    if matrix[0][0] == 1:
        dfs_maze(0, 0, "", matrix, n, visited, ans)

    # Sort results
    for i in range(len(ans)):
        var min_idx = i
        for j in range(i + 1, len(ans)):
            if ans[j] < ans[min_idx]:
                min_idx = j
        if min_idx != i:
            var tmp = ans[i]
            ans[i] = ans[min_idx]
            ans[min_idx] = tmp

    return ans^

def main():
    var n = 4
    var matrix = List[List[Int]]()
    for _ in range(n):
        matrix.append(List[Int]())

    # [1, 0, 0, 0]
    # [1, 1, 0, 1]
    # [1, 1, 0, 0]
    # [0, 1, 1, 1]
    matrix[0].append(1); matrix[0].append(0); matrix[0].append(0); matrix[0].append(0)
    matrix[1].append(1); matrix[1].append(1); matrix[1].append(0); matrix[1].append(1)
    matrix[2].append(1); matrix[2].append(1); matrix[2].append(0); matrix[2].append(0)
    matrix[3].append(0); matrix[3].append(1); matrix[3].append(1); matrix[3].append(1)

    var paths = find_paths(matrix, n)
    print("Found", len(paths), "paths:")
    for i in range(len(paths)):
        print(paths[i], end=" ")
    print()
