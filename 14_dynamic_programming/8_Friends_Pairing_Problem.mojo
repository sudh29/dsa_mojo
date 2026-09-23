# Friends Pairing Problem
# Reference: https://mojolang.org/docs/manual/get-started/

def count_friends_pairings(n: Int) -> Int:
    var mod = 1000000007
    if n <= 1:
        return 1
    if n == 2:
        return 2

    var dp = List[Int]()
    for _ in range(n + 1):
        dp.append(0)

    dp[0] = 1
    dp[1] = 1
    dp[2] = 2

    for i in range(3, n + 1):
        dp[i] = (dp[i - 1] + ((i - 1) * dp[i - 2]) % mod) % mod

    return dp[n]

def main():
    print("Friends pairings for 3 friends:", count_friends_pairings(3))
    print("Friends pairings for 4 friends:", count_friends_pairings(4))
    print("Friends pairings for 5 friends:", count_friends_pairings(5))
