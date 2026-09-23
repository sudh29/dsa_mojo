# Maximum subsequence sum such that no three consecutive elements are taken

def max3(a: Int, b: Int, c: Int) -> Int:
    var m = a
    if b > m:
        m = b
    if c > m:
        m = c
    return m

def find_max_sum(arr: List[Int], n: Int) -> Int:
    if n == 0:
        return 0
    if n == 1:
        return arr[0]
    if n == 2:
        return arr[0] + arr[1]
    if n == 3:
        return max3(arr[0] + arr[1], arr[1] + arr[2], arr[0] + arr[2])
    
    var dp = List[Int]()
    for _ in range(n):
        dp.append(0)
    dp[0] = arr[0]
    dp[1] = arr[0] + arr[1]
    dp[2] = max3(arr[0] + arr[1], arr[1] + arr[2], arr[0] + arr[2])
    
    for i in range(3, n):
        dp[i] = max3(dp[i - 1], dp[i - 2] + arr[i], dp[i - 3] + arr[i] + arr[i - 1])
        
    return dp[n - 1]

def main():
    var arr = List[Int]()
    arr.append(3000)
    arr.append(2000)
    arr.append(1000)
    arr.append(3)
    arr.append(10)
    print("Max sum without 3 adjacents:", find_max_sum(arr, len(arr)))
