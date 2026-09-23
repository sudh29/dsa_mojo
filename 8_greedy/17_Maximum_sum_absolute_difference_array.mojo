# Maximum Sum of Absolute Difference of Array
# Reference: https://mojolang.org/docs/manual/get-started/

def max_sum_abs_diff(mut arr: List[Int]) -> Int:
    var n = len(arr)
    if n <= 1:
        return 0

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

    # Interleave smallest and largest elements
    var reordered = List[Int]()
    var left = 0
    var right = n - 1
    while left < right:
        reordered.append(arr[left])
        reordered.append(arr[right])
        left += 1
        right -= 1
    if left == right:
        reordered.append(arr[left])

    var total_diff = 0
    for i in range(n - 1):
        var diff = reordered[i] - reordered[i + 1]
        total_diff += diff if diff >= 0 else -diff

    # Circular difference with first element
    var circ_diff = reordered[n - 1] - reordered[0]
    total_diff += circ_diff if circ_diff >= 0 else -circ_diff

    return total_diff

def max_sum_permutation(n: Int) -> Int:
    if n == 1:
        return 1
    return (n * (n - 1)) // 2 + n // 2 - 1

def main():
    var arr = List[Int]()
    arr.append(1)
    arr.append(2)
    arr.append(4)
    arr.append(8)

    print("Max sum absolute difference (array [1, 2, 4, 8]):", max_sum_abs_diff(arr))
    print("Max sum for permutation of 1..4:", max_sum_permutation(4))
