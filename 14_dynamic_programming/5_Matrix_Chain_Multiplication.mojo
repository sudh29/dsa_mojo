# Matrix Chain Multiplication
# Reference: https://mojolang.org/docs/manual/get-started/

def matrix_multiplication(n: Int, arr: List[Int]) -> Int:
    var dp = List[List[Int]]()
    for _ in range(n):
        var row = List[Int]()
        for _ in range(n):
            row.append(0)
        dp.append(row^)

    for length in range(2, n):
        for i in range(1, n - length + 1):
            var j = i + length - 1
            dp[i][j] = 2147483647

            for k in range(i, j):
                var cost = dp[i][k] + dp[k + 1][j] + arr[i - 1] * arr[k] * arr[j]
                if cost < dp[i][j]:
                    dp[i][j] = cost

    return dp[1][n - 1]

def main():
    var arr = List[Int]()
    arr.append(10)
    arr.append(20)
    arr.append(30)
    arr.append(40)
    arr.append(30)

    print("Minimum scalar multiplications:", matrix_multiplication(len(arr), arr))
