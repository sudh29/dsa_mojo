# Maximize the Cut Segments
# Reference: https://mojolang.org/docs/manual/get-started/

def maximize_the_cuts(n: Int, x: Int, y: Int, z: Int) -> Int:
    var dp = List[Int]()
    for _ in range(n + 1):
        dp.append(-1)
    dp[0] = 0

    for i in range(1, n + 1):
        var best = -1
        if i >= x and dp[i - x] != -1 and dp[i - x] + 1 > best:
            best = dp[i - x] + 1
        if i >= y and dp[i - y] != -1 and dp[i - y] + 1 > best:
            best = dp[i - y] + 1
        if i >= z and dp[i - z] != -1 and dp[i - z] + 1 > best:
            best = dp[i - z] + 1
        dp[i] = best

    return dp[n] if dp[n] != -1 else 0

def main():
    print("Max cuts for N=4, x=2, y=1, z=1:", maximize_the_cuts(4, 2, 1, 1))
    print("Max cuts for N=5, x=5, y=3, z=2:", maximize_the_cuts(5, 5, 3, 2))
    print("Max cuts for N=7, x=5, y=5, z=2:", maximize_the_cuts(7, 5, 5, 2))
