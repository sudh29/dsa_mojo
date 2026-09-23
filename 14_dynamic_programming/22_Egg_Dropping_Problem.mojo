# Egg Dropping Problem

def egg_drop(n: Int, k: Int) -> Int:
    if n == 1:
        return k
    if k == 0:
        return 0
    
    var dp = List[List[Int]]()
    for _ in range(n + 1):
        var row = List[Int]()
        for _ in range(k + 1):
            row.append(0)
        dp.append(row^)
        
    for i in range(1, n + 1):
        dp[i][1] = 1
        dp[i][0] = 0
        
    for j in range(1, k + 1):
        dp[1][j] = j
        
    for i in range(2, n + 1):
        for j in range(2, k + 1):
            var min_val = 1000000000
            for x in range(1, j + 1):
                var val1 = dp[i - 1][x - 1]
                var val2 = dp[i][j - x]
                var worst = val1 if val1 > val2 else val2
                var res = 1 + worst
                if res < min_val:
                    min_val = res
            dp[i][j] = min_val
            
    return dp[n][k]

def main():
    var n = 2
    var k = 10
    print("Egg drop (2 eggs, 10 floors):", egg_drop(n, k))
