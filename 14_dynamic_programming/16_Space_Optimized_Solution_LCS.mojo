# Space Optimized Solution of LCS (O(min(M, N)) space)
# Reference: https://mojolang.org/docs/manual/get-started/

def lcs_space_optimized(x: String, y: String) -> Int:
    var m = x.byte_length()
    var n = y.byte_length()
    var x_bytes = x.as_bytes()
    var y_bytes = y.as_bytes()

    var dp = List[List[Int]]()
    for _ in range(2):
        var row = List[Int]()
        for _ in range(n + 1):
            row.append(0)
        dp.append(row^)

    var bi = 0

    for i in range(1, m + 1):
        bi = i & 1
        for j in range(1, n + 1):
            if x_bytes[i - 1] == y_bytes[j - 1]:
                dp[bi][j] = dp[1 - bi][j - 1] + 1
            else:
                var top = dp[1 - bi][j]
                var left = dp[bi][j - 1]
                dp[bi][j] = top if top > left else left

    return dp[bi][n]

def main():
    var x = String("AGGTAB")
    var y = String("GXTXAYB")
    print("Space-optimized LCS of 'AGGTAB' and 'GXTXAYB':", lcs_space_optimized(x, y))
