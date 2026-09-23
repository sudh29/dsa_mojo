# Print all Possible Paths from Top-Left to Bottom-Right of mXn Matrix
# Reference: https://mojolang.org/docs/manual/get-started/

def solve_paths(
    m: Int,
    n: Int,
    r: Int,
    c: Int,
    path: String,
    mut all_paths: List[String]
):
    if r == m - 1 and c == n - 1:
        all_paths.append(path)
        return

    if c + 1 < n:
        solve_paths(m, n, r, c + 1, path + "R", all_paths)

    if r + 1 < m:
        solve_paths(m, n, r + 1, c, path + "D", all_paths)

def count_paths(m: Int, n: Int) -> Int:
    var dp = List[List[Int]]()
    for _ in range(m):
        var row = List[Int]()
        for _ in range(n):
            row.append(1)
        dp.append(row^)

    for i in range(1, m):
        for j in range(1, n):
            dp[i][j] = (dp[i - 1][j] + dp[i][j - 1]) % 1000000007

    return dp[m - 1][n - 1]

def get_all_paths(m: Int, n: Int) -> List[String]:
    var all_paths = List[String]()
    solve_paths(m, n, 0, 0, "", all_paths)
    return all_paths^

def main():
    var m = 3
    var n = 3
    var paths = get_all_paths(m, n)
    print("Total paths in", m, "x", n, "grid:", count_paths(m, n))
    print("List of paths:")
    for i in range(len(paths)):
        print("Path", i + 1, ":", paths[i])
