# Longest Repeating Subsequence
# Pattern: 2D Dynamic Programming (LCS variation with i != j)
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def longest_repeating_subsequence(self, s: String) -> Int:
        var n = s.byte_length()
        if n <= 1:
            return 0

        var bytes = s.as_bytes()
        # Initialize (n+1) x (n+1) DP table with 0s
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
                    var opt1 = dp[i - 1][j]
                    var opt2 = dp[i][j - 1]
                    dp[i][j] = opt1 if opt1 > opt2 else opt2

        return dp[n][n]

def main():
    var sol = Solution()
    var s1 = String("axxzxy")
    print("String:", s1)
    print("Length of Longest Repeating Subsequence:", sol.longest_repeating_subsequence(s1))

    var s2 = String("aabebcdd")
    print("String:", s2)
    print("Length of Longest Repeating Subsequence:", sol.longest_repeating_subsequence(s2))
