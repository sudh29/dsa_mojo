# Combination Sum (Backtracking)
# Reference: https://mojolang.org/docs/manual/get-started/

def solve_combination_sum(
    arr: List[Int],
    target: Int,
    idx: Int,
    mut current: List[Int],
    mut result: List[List[Int]]
):
    if target == 0:
        var comb = List[Int]()
        for i in range(len(current)):
            comb.append(current[i])
        result.append(comb^)
        return

    for i in range(idx, len(arr)):
        if arr[i] > target:
            break
        # Skip duplicates at the same level
        if i > idx and arr[i] == arr[i - 1]:
            continue

        current.append(arr[i])
        solve_combination_sum(arr, target - arr[i], i, current, result)
        _ = current.pop(len(current) - 1)

def combination_sum(mut a: List[Int], target: Int) -> List[List[Int]]:
    # Remove duplicates and sort
    # Sort A
    var n = len(a)
    for i in range(n):
        var min_idx = i
        for j in range(i + 1, n):
            if a[j] < a[min_idx]:
                min_idx = j
        if min_idx != i:
            var tmp = a[i]
            a[i] = a[min_idx]
            a[min_idx] = tmp

    var unique_arr = List[Int]()
    for i in range(n):
        if i == 0 or a[i] != a[i - 1]:
            unique_arr.append(a[i])

    var current = List[Int]()
    var result = List[List[Int]]()
    solve_combination_sum(unique_arr, target, 0, current, result)
    return result^

def main():
    var a = List[Int]()
    a.append(2)
    a.append(4)
    a.append(6)
    a.append(8)

    var target = 8
    var res = combination_sum(a, target)

    print("Combinations summing to", target, ":", len(res))
    for i in range(len(res)):
        print("Combination", i + 1, ": [", end="")
        for j in range(len(res[i])):
            print(res[i][j], end=" " if j < len(res[i]) - 1 else "")
        print("]")
