# Maximize Sum of Consecutive Differences in a Circular Array
# Reference: https://mojolang.org/docs/manual/get-started/

def max_consecutive_diff_sum(mut arr: List[Int]) -> Int:
    var n = len(arr)
    # Sort array ascending
    for i in range(n):
        var min_idx = i
        for j in range(i + 1, n):
            if arr[j] < arr[min_idx]:
                min_idx = j
        if min_idx != i:
            var tmp = arr[i]
            arr[i] = arr[min_idx]
            arr[min_idx] = tmp

    var res = 0
    for i in range(n):
        var diff = arr[i] - arr[n - 1 - i]
        res += diff if diff >= 0 else -diff

    return res^

def main():
    var arr = List[Int]()
    arr.append(4)
    arr.append(2)
    arr.append(1)
    arr.append(8)

    print("Max consecutive circular differences sum:", max_consecutive_diff_sum(arr))

    var arr2 = List[Int]()
    arr2.append(10)
    arr2.append(12)
    arr2.append(15)
    print("Max consecutive circular differences sum 2:", max_consecutive_diff_sum(arr2))
