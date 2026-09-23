# Longest Common Subsequence (LCS) using Space-Optimized Dynamic Programming
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def lcs(self, x: String, y: String) -> Int:
        var n = x.byte_length()
        var m = y.byte_length()
        var x_b = x.as_bytes()
        var y_b = y.as_bytes()

        var prev = List[Int]()
        for _ in range(m + 1):
            prev.append(0)

        for i in range(1, n + 1):
            var curr = List[Int]()
            for _ in range(m + 1):
                curr.append(0)

            for j in range(1, m + 1):
                if x_b[i - 1] == y_b[j - 1]:
                    curr[j] = 1 + prev[j - 1]
                else:
                    curr[j] = prev[j] if prev[j] > curr[j - 1] else curr[j - 1]

            prev = curr^

        return prev[m]

def main():
    var sol = Solution()
    var s1 = String("ABCDGH")
    var s2 = String("AEDFHR")

    var s3 = String("ABC")
    var s4 = String("AC")

    print("LCS('", s1, "', '", s2, "') = ", sol.lcs(s1, s2))
    print("LCS('", s3, "', '", s4, "') = ", sol.lcs(s3, s4))
