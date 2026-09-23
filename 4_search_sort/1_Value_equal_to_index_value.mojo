# Value equal to index value (1-based indexing)
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def value_equal_to_index(self, arr: List[Int], n: Int) -> List[Int]:
        var res = List[Int]()
        for i in range(n):
            if arr[i] == (i + 1):
                res.append(arr[i])
        return res^

def main():
    var sol = Solution()
    var arr: List[Int] = [15, 2, 45, 4, 10, 7]
    var n = len(arr)

    var matching = sol.value_equal_to_index(arr, n)
    print("Array:", end=" [")
    for i in range(n):
        print(arr[i], end=", " if i < n - 1 else "")
    print("]")

    print("Elements equal to 1-based index:", end=" [")
    for i in range(len(matching)):
        print(matching[i], end=", " if i < len(matching) - 1 else "")
    print("]")
