# Smallest sum contiguous subarray

def smallest_sum_subarray(arr: List[Int], n: Int) -> Int:
    if n == 0:
        return 0
    var dp = List[Int]()
    for _ in range(n):
        dp.append(0)
    dp[0] = arr[0]
    var min_sum = dp[0]
    for i in range(1, n):
        var cont = dp[i - 1] + arr[i]
        dp[i] = arr[i] if arr[i] < cont else cont
        if dp[i] < min_sum:
            min_sum = dp[i]
    return min_sum

def main():
    var arr = List[Int]()
    arr.append(3); arr.append(-4); arr.append(2); arr.append(-3); arr.append(-1); arr.append(7); arr.append(-5)
    print("Smallest sum contiguous subarray:", smallest_sum_subarray(arr, len(arr)))
