# Longest Palindromic Substring

def substr(s: String, start: Int, length: Int) -> String:
    var res = String("")
    for i in range(start, start + length):
        res += s[byte=i]
    return res^

def longest_palindrome(s: String) -> String:
    var n = s.byte_length()
    if n == 0:
        return ""
    var bytes = s.as_bytes()
        
    var start = 0
    var max_length = 1
    
    # 2D table dp[i][j] where i is start and j is end
    var dp = List[List[Bool]]()
    for _ in range(n):
        var row = List[Bool]()
        for _ in range(n):
            row.append(False)
        dp.append(row^)
        
    for i in range(n):
        dp[i][i] = True
        
    for i in range(n - 1):
        if bytes[i] == bytes[i + 1]:
            dp[i][i + 1] = True
            if max_length < 2:
                start = i
                max_length = 2
                
    for length in range(3, n + 1):
        for i in range(n - length + 1):
            var j = i + length - 1
            if bytes[i] == bytes[j] and dp[i + 1][j - 1]:
                dp[i][j] = True
                if length > max_length:
                    start = i
                    max_length = length
                    
    return substr(s, start, max_length)

def main():
    var s = String("babad")
    print("Longest Palindromic Substring:", longest_palindrome(s))
