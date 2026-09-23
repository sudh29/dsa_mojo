# Count Palindromic Subsequences using Dynamic Programming
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def count_ps(self, s: String) -> Int:
        var n = s.byte_length()
        if n == 0:
            return 0

        var mod = 1000000007
        var bytes = s.as_bytes()

        # dp[i][j] stores count of palindromic subsequences in s[i..j]
        var dp = List[List[Int]]()
        for _ in range(n):
            var row = List[Int]()
            for _ in range(n):
                row.append(0)
            dp.append(row^)

        for i in range(n):
            dp[i][i] = 1

        for length in range(2, n + 1):
            for i in range(n - length + 1):
                var j = i + length - 1
                if bytes[i] == bytes[j]:
                    dp[i][j] = (dp[i + 1][j] + dp[i][j - 1] + 1) % mod
                else:
                    var val = (dp[i + 1][j] + dp[i][j - 1] - dp[i + 1][j - 1]) % mod
                    if val < 0:
                        val += mod
                    dp[i][j] = val

        return dp[0][n - 1]

def main():
    var sol = Solution()
    var s1 = String("abcd")
    var s2 = String("aab")
    var s3 = String("aaaa")

    print("String:", s1, "-> Count PS:", sol.count_ps(s1))
    print("String:", s2, "-> Count PS:", sol.count_ps(s2))
    print("String:", s3, "-> Count PS:", sol.count_ps(s3))
