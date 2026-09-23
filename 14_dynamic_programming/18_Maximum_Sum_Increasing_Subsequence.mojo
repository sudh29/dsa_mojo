# Maximum Sum Increasing Subsequence

def max_sum_is(arr: List[Int], n: Int) -> Int:
    var dp = List[Int]()
    for i in range(n):
        dp.append(arr[i])
    for i in range(1, n):
        for j in range(i):
            if arr[i] > arr[j]:
                if dp[j] + arr[i] > dp[i]:
                    dp[i] = dp[j] + arr[i]
    var ans = dp[0]
    for i in range(1, n):
        if dp[i] > ans:
            ans = dp[i]
    return ans^

def main():
    var arr = List[Int]()
    arr.append(1)
    arr.append(101)
    arr.append(2)
    arr.append(3)
    arr.append(100)
    arr.append(4)
    arr.append(5)
    print("Maximum Sum Increasing Subsequence:", max_sum_is(arr, len(arr)))
