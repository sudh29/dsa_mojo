# Longest Palindromic Subsequence

def longest_palin_subseq(s: String) -> Int:
    var n = s.byte_length()
    if n == 0:
        return 0
    var bytes = s.as_bytes()
        
    var dp = List[List[Int]]()
    for _ in range(n + 1):
        var row = List[Int]()
        for _ in range(n + 1):
            row.append(0)
        dp.append(row^)
        
    for i in range(1, n + 1):
        for j in range(1, n + 1):
            # rev_S[j - 1] corresponds to s[n - j]
            if bytes[i - 1] == bytes[n - j]:
                dp[i][j] = 1 + dp[i - 1][j - 1]
            else:
                var top = dp[i - 1][j]
                var left = dp[i][j - 1]
                dp[i][j] = top if top > left else left
                
    return dp[n][n]

def main():
    var s = String("bbabcbcab")
    print("Longest Palindromic Subsequence:", longest_palin_subseq(s))
