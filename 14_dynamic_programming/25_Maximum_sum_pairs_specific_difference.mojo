# Maximum sum pairs with specific difference

def sort_arr(mut arr: List[Int]):
    for i in range(len(arr)):
        for j in range(i + 1, len(arr)):
            if arr[j] < arr[i]:
                var temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp

def max_sum_pair_with_diff_less_than_k(mut arr: List[Int], n: Int, k: Int) -> Int:
    if n <= 1:
        return 0
    sort_arr(arr)
    var dp = List[Int]()
    for _ in range(n):
        dp.append(0)
    
    for i in range(1, n):
        if arr[i] - arr[i - 1] < k:
            var take = arr[i] + arr[i - 1]
            if i >= 2:
                take += dp[i - 2]
            var skip = dp[i - 1]
            dp[i] = take if take > skip else skip
        else:
            dp[i] = dp[i - 1]
            
    return dp[n - 1]

def main():
    var arr = List[Int]()
    arr.append(3)
    arr.append(5)
    arr.append(10)
    arr.append(15)
    arr.append(17)
    arr.append(12)
    var k = 4
    print("Max sum pairs with diff < k:", max_sum_pair_with_diff_less_than_k(arr, len(arr), k))
