# Find the Duplicate Number
# Pattern: Cycle Detection / Floyd's Tortoise and Hare
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    # Floyd's Tortoise and Hare - O(n) time, O(1) space
    def find_duplicate(self, nums: List[Int]) -> Int:
        var slow = nums[0]
        var fast = nums[0]

        # Phase 1: Finding intersection point in cycle
        while True:
            slow = nums[slow]
            fast = nums[nums[fast]]
            if slow == fast:
                break

        # Phase 2: Finding entrance to the cycle
        var ptr1 = nums[0]
        var ptr2 = slow
        while ptr1 != ptr2:
            ptr1 = nums[ptr1]
            ptr2 = nums[ptr2]

        return ptr1

def main():
    var sol = Solution()
    var nums: List[Int] = [1, 3, 4, 2, 2]
    print("Array: [1, 3, 4, 2, 2]")
    print("Duplicate number is:", sol.find_duplicate(nums))
