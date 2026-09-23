# Interleaved Strings

def is_interleave(a: String, b: String, c: String) -> Bool:
    var n = a.byte_length()
    var m = b.byte_length()
    var l = c.byte_length()
    if n + m != l:
        return False
        
    var a_bytes = a.as_bytes()
    var b_bytes = b.as_bytes()
    var c_bytes = c.as_bytes()
        
    var dp = List[List[Bool]]()
    for _ in range(n + 1):
        var row = List[Bool]()
        for _ in range(m + 1):
            row.append(False)
        dp.append(row^)
        
    dp[0][0] = True
    for j in range(1, m + 1):
        dp[0][j] = dp[0][j - 1] and (b_bytes[j - 1] == c_bytes[j - 1])
        
    for i in range(1, n + 1):
        dp[i][0] = dp[i - 1][0] and (a_bytes[i - 1] == c_bytes[i - 1])
        
    for i in range(1, n + 1):
        for j in range(1, m + 1):
            var match_a = dp[i - 1][j] and (a_bytes[i - 1] == c_bytes[i + j - 1])
            var match_b = dp[i][j - 1] and (b_bytes[j - 1] == c_bytes[i + j - 1])
            dp[i][j] = match_a or match_b
            
    return dp[n][m]

def main():
    var a = String("aabcc")
    var b = String("dbbca")
    var c1 = String("aadbbcbcac")
    var c2 = String("aadbbbaccc")
    print("Is c1 interleave:", is_interleave(a, b, c1))
    print("Is c2 interleave:", is_interleave(a, b, c2))
