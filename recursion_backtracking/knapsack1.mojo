# 0/1 Knapsack Problem using Dynamic Programming
# Reference: https://mojolang.org/docs/manual/get-started/

def knapsack(max_weight: Int, weight: List[Int], val: List[Int], n: Int) -> Int:
    var dp = List[List[Int]]()
    for _ in range(n + 1):
        var row = List[Int]()
        for _ in range(max_weight + 1):
            row.append(0)
        dp.append(row^)

    for i in range(1, n + 1):
        for w in range(1, max_weight + 1):
            if weight[i - 1] <= w:
                var take = val[i - 1] + dp[i - 1][w - weight[i - 1]]
                var skip = dp[i - 1][w]
                dp[i][w] = take if take > skip else skip
            else:
                dp[i][w] = dp[i - 1][w]

    return dp[n][max_weight]

def main():
    var val = List[Int]()
    val.append(60)
    val.append(100)
    val.append(120)

    var weight = List[Int]()
    weight.append(10)
    weight.append(20)
    weight.append(30)

    var w = 50
    var n = len(val)
    print("Maximum value in 0/1 knapsack:", knapsack(w, weight, val, n))
