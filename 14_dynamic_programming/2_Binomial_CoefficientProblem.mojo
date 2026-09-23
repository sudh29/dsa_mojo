# Binomial Coefficient Problem (nCr % MOD)
# Reference: https://mojolang.org/docs/manual/get-started/

def n_cr(n: Int, r: Int) -> Int:
    if r > n:
        return 0

    var mod = 1000000007
    var dp = List[Int]()
    for _ in range(r + 1):
        dp.append(0)
    dp[0] = 1

    for i in range(1, n + 1):
        var limit = i if i < r else r
        for j in range(limit, 0, -1):
            dp[j] = (dp[j] + dp[j - 1]) % mod

    return dp[r]

def main():
    print("3C2:", n_cr(3, 2))
    print("4C2:", n_cr(4, 2))
    print("5C2:", n_cr(5, 2))
