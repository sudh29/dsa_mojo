# Count Balanced Binary Trees of Height h

def count_bt(h: Int) -> Int:
    var MOD = 1000000007
    if h == 0 or h == 1:
        return 1
    var dp = List[Int]()
    for _ in range(h + 1):
        dp.append(0)
    dp[0] = 1
    dp[1] = 1
    
    for i in range(2, h + 1):
        var term1 = (dp[i - 1] * dp[i - 1]) % MOD
        var term2 = (2 * dp[i - 1] * dp[i - 2]) % MOD
        dp[i] = (term1 + term2) % MOD
        
    return dp[h]

def main():
    var h = 3
    print("Balanced Binary Trees of height 3:", count_bt(h))
