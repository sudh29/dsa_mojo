# Painting the Fence Problem
# Reference: https://mojolang.org/docs/manual/get-started/

def count_ways_fence(n: Int, k: Int) -> Int:
    var mod = 1000000007
    if n == 1:
        return k
    if n == 2:
        return (k * k) % mod

    var prev2 = k
    var prev1 = (k * k) % mod

    for _ in range(3, n + 1):
        var current = ((k - 1) * (prev1 + prev2)) % mod
        prev2 = prev1
        prev1 = current

    return prev1

def main():
    print("Ways to paint 3 posts with 2 colors:", count_ways_fence(3, 2))
    print("Ways to paint 2 posts with 4 colors:", count_ways_fence(2, 4))
    print("Ways to paint 4 posts with 3 colors:", count_ways_fence(4, 3))
