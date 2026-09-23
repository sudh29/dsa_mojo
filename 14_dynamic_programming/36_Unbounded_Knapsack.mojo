# Unbounded Knapsack

def knap_sack(n: Int, w: Int, val: List[Int], wt: List[Int]) -> Int:
    var dp = List[Int]()
    for _ in range(w + 1):
        dp.append(0)
        
    for i in range(n):
        for j in range(wt[i], w + 1):
            var take = dp[j - wt[i]] + val[i]
            if take > dp[j]:
                dp[j] = take
                
    return dp[w]

def main():
    var n = 2
    var w = 3
    var val = List[Int]()
    val.append(1); val.append(1)
    var wt = List[Int]()
    wt.append(2); wt.append(1)
    print("Unbounded knapsack max value:", knap_sack(n, w, val, wt))
