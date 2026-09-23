# Count Palindromic Subsequences

def count_ps(s: String) -> Int:
    var MOD = 1000000007
    var n = s.byte_length()
    if n == 0:
        return 0
    var bytes = s.as_bytes()
        
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
                dp[i][j] = (dp[i + 1][j] + dp[i][j - 1] + 1) % MOD
            else:
                var val = (dp[i + 1][j] + dp[i][j - 1] - dp[i + 1][j - 1]) % MOD
                if val < 0:
                    val += MOD
                dp[i][j] = val
                
    return dp[0][n - 1]

def main():
    var s = String("abcd")
    print("Count palindromic subsequences:", count_ps(s))
