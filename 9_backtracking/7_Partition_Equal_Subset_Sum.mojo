# Partition Equal Subset Sum
# Reference: https://mojolang.org/docs/manual/get-started/

def can_partition_subset(
    arr: List[Int],
    idx: Int,
    curr_sum: Int,
    target_sum: Int
) -> Bool:
    if curr_sum == target_sum:
        return True
    if curr_sum > target_sum or idx >= len(arr):
        return False

    # Include arr[idx] or exclude arr[idx]
    if can_partition_subset(arr, idx + 1, curr_sum + arr[idx], target_sum):
        return True
    return can_partition_subset(arr, idx + 1, curr_sum, target_sum)

def equal_partition(arr: List[Int]) -> Bool:
    var total_sum = 0
    for i in range(len(arr)):
        total_sum += arr[i]

    if total_sum % 2 != 0:
        return False

    var target = total_sum // 2
    return can_partition_subset(arr, 0, 0, target)

def main():
    var arr1 = List[Int]()
    arr1.append(1)
    arr1.append(5)
    arr1.append(11)
    arr1.append(5)
    print("Can partition [1, 5, 11, 5]:", equal_partition(arr1))

    var arr2 = List[Int]()
    arr2.append(1)
    arr2.append(3)
    arr2.append(5)
    print("Can partition [1, 3, 5]:", equal_partition(arr2))
