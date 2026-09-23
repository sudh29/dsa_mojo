# Longest Repeated Subsequence
# Reference: https://mojolang.org/docs/manual/get-started/

def longest_repeated_subsequence(s: String) -> Int:
    var n = s.byte_length()
    var bytes = s.as_bytes()
    var dp = List[List[Int]]()
    for _ in range(n + 1):
        var row = List[Int]()
        for _ in range(n + 1):
            row.append(0)
        dp.append(row^)

    for i in range(1, n + 1):
        for j in range(1, n + 1):
            if bytes[i - 1] == bytes[j - 1] and i != j:
                dp[i][j] = 1 + dp[i - 1][j - 1]
            else:
                var top = dp[i - 1][j]
                var left = dp[i][j - 1]
                dp[i][j] = top if top > left else left

    return dp[n][n]

def main():
    var s1 = String("axxzxy")
    print("LRS of 'axxzxy':", longest_repeated_subsequence(s1))

    var s2 = String("aab")
    print("LRS of 'aab':", longest_repeated_subsequence(s2))
