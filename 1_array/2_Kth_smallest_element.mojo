# Kth Smallest Element
# Pattern: Sorting / QuickSelect
# Reference: https://mojolang.org/docs/manual/get-started/

def partition(mut arr: List[Int], left: Int, right: Int, pivot_idx: Int) -> Int:
    var pivot_val = arr[pivot_idx]
    # Move pivot to end
    var temp = arr[pivot_idx]
    arr[pivot_idx] = arr[right]
    arr[right] = temp
    
    var store_idx = left
    for i in range(left, right):
        if arr[i] < pivot_val:
            var t = arr[i]
            arr[i] = arr[store_idx]
            arr[store_idx] = t
            store_idx += 1
            
    var t2 = arr[right]
    arr[right] = arr[store_idx]
    arr[store_idx] = t2
    return store_idx

def quickselect(mut arr: List[Int], left_idx: Int, right_idx: Int, k_smallest: Int) -> Int:
    var left = left_idx
    var right = right_idx
    var target = k_smallest - 1  # 0-indexed
    while left <= right:
        var pivot_idx = left + (right - left) // 2
        var new_pivot = partition(arr, left, right, pivot_idx)
        if new_pivot == target:
            return arr[new_pivot]
        elif target < new_pivot:
            right = new_pivot - 1
        else:
            left = new_pivot + 1
    return -1

struct Solution:
    def __init__(out self):
        pass

    def kth_smallest(self, mut arr: List[Int], k: Int) -> Int:
        if k < 1 or k > len(arr):
            return -1
        return quickselect(arr, 0, len(arr) - 1, k)

def main():
    var sol = Solution()
    var arr: List[Int] = [7, 10, 4, 3, 20, 15]
    var k = 3
    print("Array: [7, 10, 4, 3, 20, 15], k =", k)
    var result = sol.kth_smallest(arr, k)
    print("3rd smallest element is:", result)
