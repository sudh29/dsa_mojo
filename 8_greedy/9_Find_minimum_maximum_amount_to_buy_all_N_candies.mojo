# Find Minimum and Maximum Amount to Buy all N Candies
# Reference: https://mojolang.org/docs/manual/get-started/

struct CandyCost:
    var min_cost: Int
    var max_cost: Int

    def __init__(out self, min_cost: Int, max_cost: Int):
        self.min_cost = min_cost
        self.max_cost = max_cost

def candy_store(mut candies: List[Int], n: Int, k: Int) -> CandyCost:
    # Sort candies ascending
    for i in range(n):
        var min_idx = i
        for j in range(i + 1, n):
            if candies[j] < candies[min_idx]:
                min_idx = j
        if min_idx != i:
            var tmp = candies[i]
            candies[i] = candies[min_idx]
            candies[min_idx] = tmp

    var min_cost = 0
    var max_cost = 0

    var j = n - 1
    for i in range(n):
        if i <= j:
            min_cost += candies[i]
            j -= k

    var m = 0
    var right = n - 1
    while right >= 0:
        if m <= right:
            max_cost += candies[right]
            m += k
            right -= 1
        else:
            break

    return CandyCost(min_cost, max_cost)

def main():
    var candies = List[Int]()
    candies.append(3)
    candies.append(2)
    candies.append(1)
    candies.append(4)

    var k = 2
    var res = candy_store(candies, len(candies), k)
    print("Min cost:", res.min_cost, ", Max cost:", res.max_cost)
