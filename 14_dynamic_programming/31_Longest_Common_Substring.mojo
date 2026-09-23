# Longest Common Substring

def longest_common_substr(str1: String, str2: String) -> Int:
    var n = str1.byte_length()
    var m = str2.byte_length()
    var b1 = str1.as_bytes()
    var b2 = str2.as_bytes()
    var dp = List[List[Int]]()
    for _ in range(n + 1):
        var row = List[Int]()
        for _ in range(m + 1):
            row.append(0)
        dp.append(row^)
        
    var max_len = 0
    for i in range(1, n + 1):
        for j in range(1, m + 1):
            if b1[i - 1] == b2[j - 1]:
                dp[i][j] = dp[i - 1][j - 1] + 1
                if dp[i][j] > max_len:
                    max_len = dp[i][j]
            else:
                dp[i][j] = 0
                
    return max_len

def main():
    var s1 = String("ABCDGH")
    var s2 = String("ACDGHR")
    print("Longest Common Substring:", longest_common_substr(s1, s2))
