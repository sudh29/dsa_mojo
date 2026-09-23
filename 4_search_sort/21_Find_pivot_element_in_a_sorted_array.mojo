# Find pivot element in a rotated sorted array
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def get_pivot_element(self, array: List[Int], left: Int, right: Int) -> Int:
        if right < left:
            return -1
        if right == left:
            return left

        var middle = left + (right - left) // 2

        if middle < right and array[middle] > array[middle + 1]:
            return middle
        if middle > left and array[middle] < array[middle - 1]:
            return middle - 1

        if array[left] >= array[middle]:
            return self.get_pivot_element(array, left, middle - 1)
        else:
            return self.get_pivot_element(array, middle + 1, right)

def main():
    var sol = Solution()
    var array: List[Int] = [4, 5, 6, 7, 8, 1, 2, 3]
    print("Rotated array: [4, 5, 6, 7, 8, 1, 2, 3]")
    var pivot_idx = sol.get_pivot_element(array, 0, len(array) - 1)
    print("Pivot Index:", pivot_idx)
    if pivot_idx != -1:
        print("Pivot Value:", array[pivot_idx])
    else:
        print("No pivot found")
