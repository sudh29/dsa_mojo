# Maximum Product Subarray
# Pattern: Dynamic Programming / Modified Kadane's
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def max_product(self, arr: List[Int]) -> Int:
        var n = len(arr)
        if n == 0:
            return 0

        var max_prod = arr[0]
        var min_prod = arr[0]
        var res = arr[0]

        for i in range(1, n):
            var curr = arr[i]
            var prod1 = max_prod * curr
            var prod2 = min_prod * curr

            var new_max = curr
            if prod1 > new_max:
                new_max = prod1
            if prod2 > new_max:
                new_max = prod2

            var new_min = curr
            if prod1 < new_min:
                new_min = prod1
            if prod2 < new_min:
                new_min = prod2

            max_prod = new_max
            min_prod = new_min

            if max_prod > res:
                res = max_prod

        return res

from std.testing import assert_equal

def main() raises:
    var sol = Solution()
    var arr1: List[Int] = [2, 3, -2, 4]
    print("Array 1: [2, 3, -2, 4]")
    var ans1 = sol.max_product(arr1)
    print("Max product subarray:", ans1)
    assert_equal(ans1, 6)

    var arr2: List[Int] = [-2, 0, -1]
    print("Array 2: [-2, 0, -1]")
    var ans2 = sol.max_product(arr2)
    print("Max product subarray:", ans2)
    assert_equal(ans2, 0)

    var arr3: List[Int] = [6, -3, -10, 0, 2]
    print("Array 3: [6, -3, -10, 0, 2]")
    var ans3 = sol.max_product(arr3)
    print("Max product subarray:", ans3)
    assert_equal(ans3, 180)
