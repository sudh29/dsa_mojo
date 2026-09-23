# Longest Increasing Subsequence (O(N log N))
# Reference: https://mojolang.org/docs/manual/get-started/

def lower_bound(dp: List[Int], target: Int) -> Int:
    var low = 0
    var high = len(dp) - 1
    var ans = len(dp)

    while low <= high:
        var mid = (low + high) // 2
        if dp[mid] >= target:
            ans = mid
            high = mid - 1
        else:
            low = mid + 1

    return ans^

def longest_increasing_subsequence(a: List[Int]) -> Int:
    var n = len(a)
    if n == 0:
        return 0

    var dp = List[Int]()

    for i in range(n):
        var val = a[i]
        var pos = lower_bound(dp, val)
        if pos == len(dp):
            dp.append(val)
        else:
            dp[pos] = val

    return len(dp)

def main():
    var a = List[Int]()
    a.append(10)
    a.append(22)
    a.append(9)
    a.append(33)
    a.append(21)
    a.append(50)
    a.append(41)
    a.append(60)
    a.append(80)

    print("LIS length:", longest_increasing_subsequence(a))

    var b = List[Int]()
    b.append(0)
    b.append(8)
    b.append(4)
    b.append(12)
    b.append(2)
    b.append(10)
    b.append(6)
    b.append(14)
    b.append(1)
    b.append(9)
    b.append(5)
    b.append(13)
    b.append(3)
    b.append(11)
    b.append(7)
    b.append(15)
    print("LIS length 2:", longest_increasing_subsequence(b))
