# N-th Catalan Number
# Reference: https://mojolang.org/docs/manual/get-started/

def find_catalan(n: Int) -> Int:
    var mod = 1000000007
    var dp = List[Int]()
    for _ in range(n + 1):
        dp.append(0)

    dp[0] = 1
    if n >= 1:
        dp[1] = 1

    for i in range(2, n + 1):
        for j in range(i):
            dp[i] = (dp[i] + (dp[j] * dp[i - j - 1]) % mod) % mod

    return dp[n]

def main():
    print("5th Catalan number:", find_catalan(5))
    print("4th Catalan number:", find_catalan(4))
    print("10th Catalan number:", find_catalan(10))
