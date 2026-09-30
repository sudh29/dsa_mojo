# Smallest number whose factorial contains at least n trailing zeros
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def count_trailing_zeros(self, x: Int) -> Int:
        var count = 0
        var div = 5
        while div <= x:
            count += (x // div)
            div *= 5
        return count

    def find_num(self, n: Int) -> Int:
        if n == 0:
            return 0

        var low = 1
        var high = 5 * n
        var ans = high

        while low <= high:
            var mid = low + (high - low) // 2
            var zeros = self.count_trailing_zeros(mid)

            if zeros >= n:
                ans = mid
                high = mid - 1
            else:
                low = mid + 1

        return ans

from std.testing import assert_equal

def main() raises:
    var sol = Solution()
    var ans1 = sol.find_num(1)
    print("Smallest num for at least 1 trailing zero:", ans1)
    assert_equal(ans1, 5)

    var ans2 = sol.find_num(6)
    print("Smallest num for at least 6 trailing zeros:", ans2)
    assert_equal(ans2, 25)

    var ans3 = sol.find_num(5)
    print("Smallest num for at least 5 trailing zeros:", ans3)
    assert_equal(ans3, 25)
