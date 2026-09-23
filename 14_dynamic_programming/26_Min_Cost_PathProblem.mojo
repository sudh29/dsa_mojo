# Maximum path sum in matrix / Min cost path variation

def max3(a: Int, b: Int, c: Int) -> Int:
    var m = a
    if b > m:
        m = b
    if c > m:
        m = c
    return m

def maximum_path(n: Int, mat: List[List[Int]]) -> Int:
    if n == 0:
        return 0
    if n == 1:
        return mat[0][0]
        
    var dp = List[List[Int]]()
    for _ in range(n):
        var row = List[Int]()
        for _ in range(n):
            row.append(0)
        dp.append(row^)
        
    for c in range(n):
        dp[0][c] = mat[0][c]
        
    for r in range(1, n):
        for c in range(n):
            if c == 0:
                var top = dp[r - 1][c]
                var right = dp[r - 1][c + 1]
                dp[r][c] = mat[r][c] + (top if top > right else right)
            elif c == n - 1:
                var top = dp[r - 1][c]
                var left = dp[r - 1][c - 1]
                dp[r][c] = mat[r][c] + (top if top > left else left)
            else:
                dp[r][c] = mat[r][c] + max3(dp[r - 1][c], dp[r - 1][c - 1], dp[r - 1][c + 1])
                
    var ans = dp[n - 1][0]
    for c in range(1, n):
        if dp[n - 1][c] > ans:
            ans = dp[n - 1][c]
    return ans

def main():
    var n = 2
    var mat = List[List[Int]]()
    var r0 = List[Int]()
    r0.append(348); r0.append(391)
    mat.append(r0^)
    var r1 = List[Int]()
    r1.append(618); r1.append(389)
    mat.append(r1^)
    print("Maximum path sum:", maximum_path(n, mat))
