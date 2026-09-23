# Coin Change Problem (Count Ways)
# Reference: https://mojolang.org/docs/manual/get-started/

def count_coin_change(coins: List[Int], sum_val: Int) -> Int:
    var dp = List[Int]()
    for _ in range(sum_val + 1):
        dp.append(0)
    dp[0] = 1

    for i in range(len(coins)):
        var coin = coins[i]
        for amount in range(coin, sum_val + 1):
            dp[amount] += dp[amount - coin]

    return dp[sum_val]

def main():
    var coins = List[Int]()
    coins.append(1)
    coins.append(2)
    coins.append(3)

    var sum_val = 4
    print("Number of ways to make sum", sum_val, ":", count_coin_change(coins, sum_val))

    var coins2 = List[Int]()
    coins2.append(2)
    coins2.append(5)
    coins2.append(3)
    coins2.append(6)

    var sum_val2 = 10
    print("Number of ways to make sum", sum_val2, ":", count_coin_change(coins2, sum_val2))
