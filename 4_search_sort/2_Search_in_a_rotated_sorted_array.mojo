# Search in a Rotated Sorted Array
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def search(self, nums: List[Int], target: Int) -> Int:
        var start = 0
        var end = len(nums) - 1

        while start <= end:
            var mid = start + (end - start) // 2

            if nums[mid] == target:
                return mid

            # Check if left half is sorted
            if nums[start] <= nums[mid]:
                if target >= nums[start] and target < nums[mid]:
                    end = mid - 1
                else:
                    start = mid + 1
            else:
                # Right half must be sorted
                if target > nums[mid] and target <= nums[end]:
                    start = mid + 1
                else:
                    end = mid - 1

        return -1

def main():
    var sol = Solution()
    var nums: List[Int] = [4, 5, 6, 7, 0, 1, 2]
    var t1 = 0
    var t2 = 3

    print("Rotated Array:", end=" [")
    for i in range(len(nums)):
        print(nums[i], end=", " if i < len(nums) - 1 else "")
    print("]")

    print("Search for target", t1, "-> Index:", sol.search(nums, t1))
    print("Search for target", t2, "-> Index:", sol.search(nums, t2))
