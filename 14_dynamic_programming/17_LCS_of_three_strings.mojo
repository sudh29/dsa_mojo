# LCS of Three Strings
# Reference: https://mojolang.org/docs/manual/get-started/

def lcs_of_three(a: String, b: String, c: String) -> Int:
    var n1 = a.byte_length()
    var n2 = b.byte_length()
    var n3 = c.byte_length()
    var a_bytes = a.as_bytes()
    var b_bytes = b.as_bytes()
    var c_bytes = c.as_bytes()

    var dp = List[List[List[Int]]]()
    for _ in range(n1 + 1):
        var mat = List[List[Int]]()
        for _ in range(n2 + 1):
            var row = List[Int]()
            for _ in range(n3 + 1):
                row.append(0)
            mat.append(row^)
        dp.append(mat^)

    for i in range(1, n1 + 1):
        for j in range(1, n2 + 1):
            for k in range(1, n3 + 1):
                if a_bytes[i - 1] == b_bytes[j - 1] and b_bytes[j - 1] == c_bytes[k - 1]:
                    dp[i][j][k] = 1 + dp[i - 1][j - 1][k - 1]
                else:
                    var v1 = dp[i - 1][j][k]
                    var v2 = dp[i][j - 1][k]
                    var v3 = dp[i][j][k - 1]
                    var best = v1 if v1 > v2 else v2
                    if v3 > best:
                        best = v3
                    dp[i][j][k] = best

    return dp[n1][n2][n3]

def main():
    var a = String("geeks")
    var b = String("geeksfor")
    var c = String("geeksforgeeks")
    print("LCS of three strings:", lcs_of_three(a, b, c))

    var s1 = String("abcd1e2")
    var s2 = String("bc12ea")
    var s3 = String("bd1ea")
    print("LCS of three strings 2:", lcs_of_three(s1, s2, s3))
