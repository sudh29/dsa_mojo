# Minimum cost to fill given weight in a bag

def minimum_cost(n: Int, w: Int, cost: List[Int]) -> Int:
    var inf = 1000000000
    var dp = List[Int]()
    for _ in range(w + 1):
        dp.append(inf)
    dp[0] = 0
    
    for i in range(1, n + 1):
        if cost[i - 1] != -1:
            for j in range(i, w + 1):
                if dp[j - i] != inf:
                    var new_cost = dp[j - i] + cost[i - 1]
                    if new_cost < dp[j]:
                        dp[j] = new_cost
                        
    return -1 if dp[w] == inf else dp[w]

def main():
    var n = 5
    var w = 5
    var cost = List[Int]()
    cost.append(20); cost.append(10); cost.append(4); cost.append(50); cost.append(100)
    print("Minimum cost to fill weight bag:", minimum_cost(n, w, cost))
