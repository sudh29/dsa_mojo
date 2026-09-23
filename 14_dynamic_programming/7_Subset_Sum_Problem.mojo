# Subset Sum / Equal Partition Problem
# Reference: https://mojolang.org/docs/manual/get-started/

def equal_partition(arr: List[Int]) -> Bool:
    var total_sum = 0
    for i in range(len(arr)):
        total_sum += arr[i]

    if total_sum % 2 != 0:
        return False

    var target = total_sum // 2
    var dp = List[Bool]()
    for _ in range(target + 1):
        dp.append(False)
    dp[0] = True

    for i in range(len(arr)):
        var num = arr[i]
        for j in range(target, num - 1, -1):
            if dp[j - num]:
                dp[j] = True

    return dp[target]

def main():
    var a1 = List[Int]()
    a1.append(1)
    a1.append(5)
    a1.append(11)
    a1.append(5)
    print("Can partition [1, 5, 11, 5]:", equal_partition(a1))

    var a2 = List[Int]()
    a2.append(1)
    a2.append(3)
    a2.append(5)
    print("Can partition [1, 3, 5]:", equal_partition(a2))
