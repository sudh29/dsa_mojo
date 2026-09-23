# Next Permutation
# Pattern: Two Pointer / Permutation Logic
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def next_permutation(self, mut nums: List[Int]):
        var n = len(nums)
        if n <= 1:
            return

        var i = n - 2
        while i >= 0 and nums[i] >= nums[i + 1]:
            i -= 1

        if i >= 0:
            var j = n - 1
            while nums[j] <= nums[i]:
                j -= 1
            var temp = nums[i]
            nums[i] = nums[j]
            nums[j] = temp

        # Reverse suffix from i + 1 to end
        var left = i + 1
        var right = n - 1
        while left < right:
            var t = nums[left]
            nums[left] = nums[right]
            nums[right] = t
            left += 1
            right -= 1

def main():
    var sol = Solution()
    var nums: List[Int] = [1, 2, 3]
    print("Original permutation: [1, 2, 3]")
    sol.next_permutation(nums)
    print("Next permutation:", end=" [")
    for i in range(len(nums)):
        print(nums[i], end=", " if i < len(nums) - 1 else "")
    print("]")

    var nums2: List[Int] = [3, 2, 1]
    print("Original permutation: [3, 2, 1]")
    sol.next_permutation(nums2)
    print("Next permutation:", end=" [")
    for i in range(len(nums2)):
        print(nums2[i], end=", " if i < len(nums2) - 1 else "")
    print("]")
