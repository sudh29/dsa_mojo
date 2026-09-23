# Count Inversions in an Array
# Pattern: Modified Merge Sort / Divide and Conquer
# Reference: https://mojolang.org/docs/manual/get-started/

def merge_and_count(mut arr: List[Int], left: Int, mid: Int, right: Int) -> Int:
    var n1 = mid - left + 1
    var n2 = right - mid
    var left_arr = List[Int]()
    var right_arr = List[Int]()

    for i in range(n1):
        left_arr.append(arr[left + i])
    for j in range(n2):
        right_arr.append(arr[mid + 1 + j])

    var i = 0
    var j = 0
    var k = left
    var inv_count = 0

    while i < n1 and j < n2:
        if left_arr[i] <= right_arr[j]:
            arr[k] = left_arr[i]
            i += 1
        else:
            arr[k] = right_arr[j]
            inv_count += (n1 - i)
            j += 1
        k += 1

    while i < n1:
        arr[k] = left_arr[i]
        i += 1
        k += 1

    while j < n2:
        arr[k] = right_arr[j]
        j += 1
        k += 1

    return inv_count

def merge_sort_and_count(mut arr: List[Int], left: Int, right: Int) -> Int:
    var inv_count = 0
    if left < right:
        var mid = left + (right - left) // 2
        inv_count += merge_sort_and_count(arr, left, mid)
        inv_count += merge_sort_and_count(arr, mid + 1, right)
        inv_count += merge_and_count(arr, left, mid, right)
    return inv_count

struct Solution:
    def __init__(out self):
        pass

    def inversion_count(self, mut arr: List[Int]) -> Int:
        var n = len(arr)
        if n <= 1:
            return 0
        return merge_sort_and_count(arr, 0, n - 1)

def main():
    var sol = Solution()
    var arr: List[Int] = [2, 4, 1, 3, 5]
    print("Array: [2, 4, 1, 3, 5]")
    var count = sol.inversion_count(arr)
    print("Inversion Count:", count)
