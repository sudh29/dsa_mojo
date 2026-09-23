# Maximum size square sub-matrix with all 1s

def min3(a: Int, b: Int, c: Int) -> Int:
    var m = a
    if b < m:
        m = b
    if c < m:
        m = c
    return m

def max_square(n: Int, m: Int, mat: List[List[Int]]) -> Int:
    var dp = List[List[Int]]()
    for _ in range(n):
        var row = List[Int]()
        for _ in range(m):
            row.append(0)
        dp.append(row^)
        
    var max_side = 0
    for i in range(n):
        for j in range(m):
            if mat[i][j] == 1:
                if i == 0 or j == 0:
                    dp[i][j] = 1
                else:
                    dp[i][j] = min3(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1
                if dp[i][j] > max_side:
                    max_side = dp[i][j]
    return max_side

def main():
    var n = 4
    var m = 4
    var mat = List[List[Int]]()
    
    var r0 = List[Int]()
    r0.append(0); r0.append(1); r0.append(1); r0.append(0)
    mat.append(r0^)
    
    var r1 = List[Int]()
    r1.append(1); r1.append(1); r1.append(1); r1.append(1)
    mat.append(r1^)
    
    var r2 = List[Int]()
    r2.append(1); r2.append(1); r2.append(1); r2.append(1)
    mat.append(r2^)
    
    var r3 = List[Int]()
    r3.append(0); r3.append(0); r3.append(0); r3.append(0)
    mat.append(r3^)
    
    print("Max size square sub-matrix of 1s:", max_square(n, m, mat))
