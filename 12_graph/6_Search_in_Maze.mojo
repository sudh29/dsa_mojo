# Rat in a Maze Problem

def dfs_maze(
    m: List[List[Int]],
    n: Int,
    mut paths: List[String],
    curr_path: String,
    i: Int,
    j: Int,
    mut visited: List[List[Int]]
):
    if i < 0 or j < 0 or i >= n or j >= n:
        return
    if m[i][j] == 0 or visited[i][j] == 1:
        return
        
    if i == n - 1 and j == n - 1:
        paths.append(curr_path)
        return
        
    visited[i][j] = 1
    dfs_maze(m, n, paths, curr_path + "U", i - 1, j, visited)
    dfs_maze(m, n, paths, curr_path + "D", i + 1, j, visited)
    dfs_maze(m, n, paths, curr_path + "L", i, j - 1, visited)
    dfs_maze(m, n, paths, curr_path + "R", i, j + 1, visited)
    visited[i][j] = 0

def find_path(m: List[List[Int]], n: Int) -> List[String]:
    var res = List[String]()
    if n == 0 or m[0][0] == 0 or m[n - 1][n - 1] == 0:
        return res^
        
    var visited = List[List[Int]]()
    for _ in range(n):
        var row = List[Int]()
        for _ in range(n):
            row.append(0)
        visited.append(row^)
        
    dfs_maze(m, n, res, "", 0, 0, visited)
    return res^

def main():
    var n = 4
    var m = List[List[Int]]()
    var r0 = List[Int](); r0.append(1); r0.append(0); r0.append(0); r0.append(0); m.append(r0^)
    var r1 = List[Int](); r1.append(1); r1.append(1); r1.append(0); r1.append(1); m.append(r1^)
    var r2 = List[Int](); r2.append(1); r2.append(1); r2.append(0); r2.append(0); m.append(r2^)
    var r3 = List[Int](); r3.append(0); r3.append(1); r3.append(1); r3.append(1); m.append(r3^)
    
    var paths = find_path(m, n)
    print("Found", len(paths), "paths:")
    for i in range(len(paths)):
        print(paths[i])
