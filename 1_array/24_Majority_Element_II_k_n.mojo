# Majority Element II (appearing more than n/3 times)
# Pattern: Boyer-Moore Voting Algorithm / Frequency Count
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    # Boyer-Moore Voting algorithm extended for 2 candidates (O(n) time, O(1) space)
    def majority_element(self, nums: List[Int]) -> List[Int]:
        var n = len(nums)
        var result = List[Int]()
        if n == 0:
            return List[Int]()

        var count1 = 0
        var count2 = 0
        var candidate1 = 0
        var candidate2 = 1

        for i in range(n):
            var x = nums[i]
            if x == candidate1:
                count1 += 1
            elif x == candidate2:
                count2 += 1
            elif count1 == 0:
                candidate1 = x
                count1 = 1
            elif count2 == 0:
                candidate2 = x
                count2 = 1
            else:
                count1 -= 1
                count2 -= 1

        # Verify candidate counts
        var actual1 = 0
        var actual2 = 0
        for i in range(n):
            if nums[i] == candidate1:
                actual1 += 1
            elif nums[i] == candidate2:
                actual2 += 1

        if actual1 > n // 3:
            result.append(candidate1)
        if actual2 > n // 3:
            result.append(candidate2)

        return result^

def main():
    var sol = Solution()
    var nums: List[Int] = [3, 2, 3]
    print("Array: [3, 2, 3]")
    var maj = sol.majority_element(nums)
    print("Majority elements (> n/3):", end=" [")
    for i in range(len(maj)):
        print(maj[i], end=", " if i < len(maj) - 1 else "")
    print("]")

    var nums2: List[Int] = [1, 1, 1, 3, 3, 2, 2, 2]
    print("Array: [1, 1, 1, 3, 3, 2, 2, 2]")
    var maj2 = sol.majority_element(nums2)
    print("Majority elements (> n/3):", end=" [")
    for i in range(len(maj2)):
        print(maj2[i], end=", " if i < len(maj2) - 1 else "")
    print("]")
