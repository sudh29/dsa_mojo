# Minimum Size Subarray Sum
# Pattern: Sliding Window / Two Pointer
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def min_sub_array_len(self, target: Int, nums: List[Int]) -> Int:
        var n = len(nums)
        var left = 0
        var total = 0
        var min_len = n + 1

        for right in range(n):
            total += nums[right]
            while total >= target:
                var current_len = right - left + 1
                if current_len < min_len:
                    min_len = current_len
                total -= nums[left]
                left += 1

        return min_len if min_len <= n else 0

def main():
    var sol = Solution()
    var nums1: List[Int] = [2, 3, 1, 2, 4, 3]
    var target1 = 7
    print("Array: [2, 3, 1, 2, 4, 3], Target:", target1)
    print("Min subarray length:", sol.min_sub_array_len(target1, nums1))

    var nums2: List[Int] = [1, 4, 4]
    var target2 = 4
    print("Array: [1, 4, 4], Target:", target2)
    print("Min subarray length:", sol.min_sub_array_len(target2, nums2))

    var nums3: List[Int] = [1, 1, 1, 1, 1, 1, 1, 1]
    var target3 = 11
    print("Array: [1, 1, 1, 1, 1, 1, 1, 1], Target:", target3)
    print("Min subarray length:", sol.min_sub_array_len(target3, nums3))
