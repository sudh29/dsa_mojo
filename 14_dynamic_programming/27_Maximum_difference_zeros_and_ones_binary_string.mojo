# Maximum difference of zeros and ones in binary string

def max_substring(s: String) -> Int:
    var n = s.byte_length()
    if n == 0:
        return -1
    var bytes = s.as_bytes()
    var dp = List[Int]()
    for _ in range(n):
        dp.append(0)
        
    dp[0] = 1 if bytes[0] == 48 else -1
    
    for i in range(1, n):
        var val = 1 if bytes[i] == 48 else -1
        var cont = dp[i - 1] + val
        dp[i] = cont if cont > val else val
        
    var max_val = dp[0]
    for i in range(1, n):
        if dp[i] > max_val:
            max_val = dp[i]
            
    return max_val if max_val > 0 else -1

def main():
    var s = String("11000010001")
    print("Max difference zeros and ones:", max_substring(s))
