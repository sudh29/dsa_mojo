# Merge two sorted arrays
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def merge_arrays(self, arr1: List[Int], arr2: List[Int], n1: Int, n2: Int) -> List[Int]:
        var arr3 = List[Int]()
        var i = 0
        var j = 0

        while i < n1 and j < n2:
            if arr1[i] <= arr2[j]:
                arr3.append(arr1[i])
                i += 1
            else:
                arr3.append(arr2[j])
                j += 1

        while i < n1:
            arr3.append(arr1[i])
            i += 1

        while j < n2:
            arr3.append(arr2[j])
            j += 1

        return arr3^

def main():
    var sol = Solution()
    var a1: List[Int] = [1, 3, 5, 7]
    var a2: List[Int] = [0, 2, 6, 8, 9]
    var merged = sol.merge_arrays(a1, a2, len(a1), len(a2))
    print("Merged Array:", end=" [")
    for k in range(len(merged)):
        print(merged[k], end=", " if k < len(merged) - 1 else "")
    print("]")
