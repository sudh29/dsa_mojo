# Maximum sum such that no two elements are adjacent (Stickler Thief / House Robber)
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def find_max_sum(self, arr: List[Int], n: Int) -> Int:
        if n == 0:
            return 0
        if n == 1:
            return arr[0]

        var incl = arr[0]
        var excl = 0

        for i in range(1, n):
            var new_excl = max(incl, excl)
            incl = excl + arr[i]
            excl = new_excl

        return max(incl, excl)

def main():
    var sol = Solution()
    var arr1: List[Int] = [5, 5, 10, 100, 10, 5]
    var arr2: List[Int] = [1, 2, 3]
    print("Max sum for [5, 5, 10, 100, 10, 5]:", sol.find_max_sum(arr1, len(arr1)))
    print("Max sum for [1, 2, 3]:", sol.find_max_sum(arr2, len(arr2)))
