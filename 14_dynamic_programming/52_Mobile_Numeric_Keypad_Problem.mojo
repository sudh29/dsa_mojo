# Mobile Numeric Keypad Problem

def get_moves(digit: Int) -> List[Int]:
    var res = List[Int]()
    if digit == 0:
        res.append(0); res.append(8)
    elif digit == 1:
        res.append(1); res.append(2); res.append(4)
    elif digit == 2:
        res.append(2); res.append(1); res.append(3); res.append(5)
    elif digit == 3:
        res.append(3); res.append(2); res.append(6)
    elif digit == 4:
        res.append(4); res.append(1); res.append(5); res.append(7)
    elif digit == 5:
        res.append(5); res.append(2); res.append(4); res.append(6); res.append(8)
    elif digit == 6:
        res.append(6); res.append(3); res.append(5); res.append(9)
    elif digit == 7:
        res.append(7); res.append(4); res.append(8)
    elif digit == 8:
        res.append(8); res.append(5); res.append(7); res.append(9); res.append(0)
    elif digit == 9:
        res.append(9); res.append(6); res.append(8)
    return res^

def get_count(n: Int) -> Int:
    if n <= 0:
        return 0
    if n == 1:
        return 10
        
    var dp = List[List[Int]]()
    for _ in range(n + 1):
        var row = List[Int]()
        for _ in range(10):
            row.append(0)
        dp.append(row^)
        
    for j in range(10):
        dp[1][j] = 1
        
    for i in range(2, n + 1):
        for j in range(10):
            var moves = get_moves(j)
            var s = 0
            for k_idx in range(len(moves)):
                s += dp[i - 1][moves[k_idx]]
            dp[i][j] = s
            
    var total = 0
    for j in range(10):
        total += dp[n][j]
        
    return total

def main():
    print("Numbers of length 1:", get_count(1))
    print("Numbers of length 2:", get_count(2))
