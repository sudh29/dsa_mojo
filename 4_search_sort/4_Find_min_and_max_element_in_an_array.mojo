# Find minimum and maximum element in an array with minimum comparisons
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def get_min_max(self, arr: List[Int], n: Int) -> List[Int]:
        var res = List[Int]()
        if n == 0:
            return res^

        var min_val = arr[0]
        var max_val = arr[0]

        for i in range(1, n):
            if arr[i] > max_val:
                max_val = arr[i]
            elif arr[i] < min_val:
                min_val = arr[i]

        res.append(min_val)
        res.append(max_val)
        return res^

def main():
    var sol = Solution()
    var arr: List[Int] = [3, 2, 1, 56, 10000, 167]
    var n = len(arr)

    var min_max = sol.get_min_max(arr, n)
    print("Array:", end=" [")
    for i in range(n):
        print(arr[i], end=", " if i < n - 1 else "")
    print("]")

    print("Minimum element:", min_max[0])
    print("Maximum element:", min_max[1])
