# Reach a given score

def count_reach_score(n: Int) -> Int:
    var dp = List[Int]()
    for _ in range(n + 1):
        dp.append(0)
    dp[0] = 1
    
    var moves = List[Int]()
    moves.append(3)
    moves.append(5)
    moves.append(10)
    
    for idx in range(len(moves)):
        var move = moves[idx]
        for i in range(move, n + 1):
            dp[i] += dp[i - move]
            
    return dp[n]

def main():
    var n = 20
    print("Reach score 20:", count_reach_score(n))
