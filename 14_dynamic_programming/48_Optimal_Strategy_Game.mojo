# Optimal Strategy For A Game

def min2(a: Int, b: Int) -> Int:
    return a if a < b else b

def max2(a: Int, b: Int) -> Int:
    return a if a > b else b

def optimal_strategy_of_game(n: Int, arr: List[Int]) -> Int:
    if n == 0:
        return 0
        
    var dp = List[List[Int]]()
    for _ in range(n):
        var row = List[Int]()
        for _ in range(n):
            row.append(0)
        dp.append(row^)
        
    for i in range(n):
        dp[i][i] = arr[i]
        
    for i in range(n - 1):
        dp[i][i + 1] = max2(arr[i], arr[i + 1])
        
    for length in range(3, n + 1):
        for i in range(n - length + 1):
            var j = i + length - 1
            var term1_inner = min2(
                dp[i + 2][j] if i + 2 <= j else 0,
                dp[i + 1][j - 1] if i + 1 <= j - 1 else 0
            )
            var choice1 = arr[i] + term1_inner
            
            var term2_inner = min2(
                dp[i + 1][j - 1] if i + 1 <= j - 1 else 0,
                dp[i][j - 2] if i <= j - 2 else 0
            )
            var choice2 = arr[j] + term2_inner
            
            dp[i][j] = max2(choice1, choice2)
            
    return dp[0][n - 1]

def main():
    var arr = List[Int]()
    arr.append(5); arr.append(3); arr.append(7); arr.append(10)
    print("Optimal Strategy Game max amount:", optimal_strategy_of_game(len(arr), arr))
