# Find the Next Greater Element for each element in an array
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def next_larger_element(self, arr: List[Int], n: Int) -> List[Int]:
        var res = List[Int]()
        for _ in range(n):
            res.append(-1)

        var s = List[Int]()  # Monotonic stack of indices

        for i in range(n):
            while len(s) > 0 and arr[i] > arr[s[len(s) - 1]]:
                var idx = s[len(s) - 1]
                _ = s.pop()
                res[idx] = arr[i]

            s.append(i)

        return res^

def main():
    var sol = Solution()
    var arr1: List[Int] = [1, 3, 2, 4]
    var res1 = sol.next_larger_element(arr1, len(arr1))

    print("Array: [1, 3, 2, 4]")
    print("Next Greater Elements:", end=" [")
    for i in range(len(res1)):
        print(res1[i], end=", " if i < len(res1) - 1 else "")
    print("]")

    var arr2: List[Int] = [6, 8, 0, 1, 3]
    var res2 = sol.next_larger_element(arr2, len(arr2))

    print("Array: [6, 8, 0, 1, 3]")
    print("Next Greater Elements:", end=" [")
    for i in range(len(res2)):
        print(res2[i], end=", " if i < len(res2) - 1 else "")
    print("]")
