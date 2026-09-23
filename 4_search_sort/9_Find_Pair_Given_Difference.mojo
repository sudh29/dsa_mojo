# Find pair with given difference
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def sort_arr(self, mut arr: List[Int]):
        var n = len(arr)
        for i in range(n):
            for j in range(0, n - i - 1):
                if arr[j] > arr[j + 1]:
                    var tmp = arr[j]
                    arr[j] = arr[j + 1]
                    arr[j + 1] = tmp

    def find_pair(self, mut arr: List[Int], size: Int, n: Int) -> Bool:
        self.sort_arr(arr)
        var i = 0
        var j = 1

        var target_diff = abs(n)

        while i < size and j < size:
            if i != j and (arr[j] - arr[i]) == target_diff:
                return True
            elif (arr[j] - arr[i]) < target_diff:
                j += 1
            else:
                i += 1
                if i == j:
                    j += 1

        return False

def main():
    var sol = Solution()
    var arr1: List[Int] = [5, 20, 3, 2, 5, 80]
    var diff1 = 78
    print("Array 1 has pair with diff 78:", sol.find_pair(arr1, len(arr1), diff1))

    var arr2: List[Int] = [1, 5, 3, 4, 2]
    var diff2 = 3
    print("Array 2 has pair with diff 3:", sol.find_pair(arr2, len(arr2), diff2))
