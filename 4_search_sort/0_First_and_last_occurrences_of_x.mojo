# First and last occurrences of x in a sorted array
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def find_first(self, arr: List[Int], n: Int, x: Int) -> Int:
        var low = 0
        var high = n - 1
        var first = -1

        while low <= high:
            var mid = low + (high - low) // 2
            if arr[mid] == x:
                first = mid
                high = mid - 1
            elif arr[mid] > x:
                high = mid - 1
            else:
                low = mid + 1

        return first

    def find_last(self, arr: List[Int], n: Int, x: Int) -> Int:
        var low = 0
        var high = n - 1
        var last = -1

        while low <= high:
            var mid = low + (high - low) // 2
            if arr[mid] == x:
                last = mid
                low = mid + 1
            elif arr[mid] > x:
                high = mid - 1
            else:
                low = mid + 1

        return last

    def find_first_and_last(self, arr: List[Int], n: Int, x: Int) -> List[Int]:
        var res = List[Int]()
        res.append(self.find_first(arr, n, x))
        res.append(self.find_last(arr, n, x))
        return res^

def main():
    var sol = Solution()
    var arr: List[Int] = [1, 3, 5, 5, 5, 5, 67, 123, 125]
    var n = len(arr)
    var x = 5

    var res = sol.find_first_and_last(arr, n, x)
    print("Array:", end=" [")
    for i in range(n):
        print(arr[i], end=", " if i < n - 1 else "")
    print("]")
    print("Element:", x, "-> First occurrence:", res[0], ", Last occurrence:", res[1])
