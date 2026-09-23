# 0 - 1 Knapsack Problem
# Reference: https://mojolang.org/docs/manual/get-started/

def knapsack_01(w: Int, wt: List[Int], val: List[Int], n: Int) -> Int:
    var dp = List[List[Int]]()
    for _ in range(n + 1):
        var row = List[Int]()
        for _ in range(w + 1):
            row.append(0)
        dp.append(row^)

    for i in range(1, n + 1):
        for cap in range(1, w + 1):
            if wt[i - 1] <= cap:
                var incl = dp[i - 1][cap - wt[i - 1]] + val[i - 1]
                var excl = dp[i - 1][cap]
                dp[i][cap] = incl if incl > excl else excl
            else:
                dp[i][cap] = dp[i - 1][cap]

    return dp[n][w]

def main():
    var val = List[Int]()
    val.append(1)
    val.append(2)
    val.append(3)

    var wt = List[Int]()
    wt.append(4)
    wt.append(5)
    wt.append(1)

    var w = 4
    print("Maximum value in knapsack:", knapsack_01(w, wt, val, len(val)))
