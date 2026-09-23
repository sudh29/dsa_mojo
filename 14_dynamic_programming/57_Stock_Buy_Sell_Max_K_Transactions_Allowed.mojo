# Stock Buy and Sell: Max K Transactions Allowed

def max_profit_k(k: Int, n: Int, a: List[Int]) -> Int:
    if n == 0 or k == 0:
        return 0
        
    var dp = List[List[Int]]()
    for _ in range(k + 1):
        var row = List[Int]()
        for _ in range(n):
            row.append(0)
        dp.append(row^)
        
    for t in range(1, k + 1):
        var max_so_far = -a[0]
        for d in range(1, n):
            var val1 = dp[t][d - 1]
            var val2 = a[d] + max_so_far
            dp[t][d] = val1 if val1 > val2 else val2
            
            var diff = dp[t - 1][d] - a[d]
            if diff > max_so_far:
                max_so_far = diff
                
    return dp[k][n - 1]

def main():
    var a = List[Int]()
    a.append(10); a.append(22); a.append(5); a.append(75); a.append(65); a.append(80)
    var k = 2
    print("Max profit with 2 transactions:", max_profit_k(k, len(a), a))
