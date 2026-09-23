# Partition Array to K Subsets with Equal Sum
# Reference: https://mojolang.org/docs/manual/get-started/

def solve_k_partition(
    a: List[Int],
    n: Int,
    k: Int,
    curr_sum: Int,
    subsets_formed: Int,
    mut visited: List[Bool],
    target_sum: Int,
    start_idx: Int
) -> Bool:
    if curr_sum == target_sum:
        if subsets_formed == k - 2:
            return True
        return solve_k_partition(a, n, k, 0, subsets_formed + 1, visited, target_sum, n - 1)

    for i in range(start_idx, -1, -1):
        if visited[i] or curr_sum + a[i] > target_sum:
            continue

        visited[i] = True
        if solve_k_partition(a, n, k, curr_sum + a[i], subsets_formed, visited, target_sum, i - 1):
            return True
        visited[i] = False

    return False

def is_k_partition_possible(mut a: List[Int], k: Int) -> Bool:
    var n = len(a)
    if k == 1:
        return True
    if n < k:
        return False

    var total_sum = 0
    for i in range(n):
        total_sum += a[i]

    if total_sum % k != 0:
        return False

    var target = total_sum // k

    # Sort descending for better pruning
    for i in range(n):
        var max_idx = i
        for j in range(i + 1, n):
            if a[j] > a[max_idx]:
                max_idx = j
        if max_idx != i:
            var tmp = a[i]
            a[i] = a[max_idx]
            a[max_idx] = tmp

    if a[0] > target:
        return False

    var visited = List[Bool]()
    for _ in range(n):
        visited.append(False)

    return solve_k_partition(a, n, k, 0, 0, visited, target, n - 1)

def main():
    var a = List[Int]()
    a.append(2)
    a.append(1)
    a.append(4)
    a.append(5)
    a.append(6)

    var k = 3
    print("Can partition [2, 1, 4, 5, 6] into", k, "subsets:", is_k_partition_possible(a, k))

    var b = List[Int]()
    b.append(2)
    b.append(1)
    b.append(5)
    b.append(5)
    b.append(6)
    print("Can partition [2, 1, 5, 5, 6] into", k, "subsets:", is_k_partition_possible(b, k))
