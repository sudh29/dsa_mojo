# Minimum sum of two numbers formed from digits of an array
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

    def solve(self, mut arr: List[Int], n: Int) -> Int:
        if n == 0:
            return 0
        if n == 1:
            return arr[0]

        self.sort_arr(arr)

        var num1 = 0
        var num2 = 0

        for i in range(n):
            if i % 2 == 0:
                num1 = num1 * 10 + arr[i]
            else:
                num2 = num2 * 10 + arr[i]

        return num1 + num2

def main():
    var sol = Solution()
    var arr1: List[Int] = [6, 8, 4, 5, 2, 3]
    print("Array [6, 8, 4, 5, 2, 3] -> Min Sum:", sol.solve(arr1, len(arr1)))

    var arr2: List[Int] = [5, 3, 0, 7, 4]
    print("Array [5, 3, 0, 7, 4] -> Min Sum:", sol.solve(arr2, len(arr2)))
