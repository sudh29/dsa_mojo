# Subarray with 0 Sum
# Pattern: Prefix Sum / Hash Set
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def sub_array_exists(self, arr: List[Int]) -> Bool:
        var n = len(arr)
        var prefix_sums = List[Int]()
        var running_sum = 0

        for i in range(n):
            running_sum += arr[i]
            if running_sum == 0:
                return True
            for j in range(len(prefix_sums)):
                if prefix_sums[j] == running_sum:
                    return True
            prefix_sums.append(running_sum)

        return False

def main():
    var sol = Solution()
    var arr1: List[Int] = [4, 2, -3, 1, 6]
    print("Array 1: [4, 2, -3, 1, 6]")
    print("Subarray with 0 sum exists:", sol.sub_array_exists(arr1))

    var arr2: List[Int] = [4, 2, 0, 1, 6]
    print("Array 2: [4, 2, 0, 1, 6]")
    print("Subarray with 0 sum exists:", sol.sub_array_exists(arr2))

    var arr3: List[Int] = [1, 2, 3]
    print("Array 3: [1, 2, 3]")
    print("Subarray with 0 sum exists:", sol.sub_array_exists(arr3))
