# Median of 2 Sorted Arrays of Different Sizes
# Pattern: Binary Search / Two Pointer Merge
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def median_of_arrays(self, arr1: List[Int], arr2: List[Int]) -> Float64:
        var m = len(arr1)
        var n = len(arr2)
        var total = m + n
        if total == 0:
            return 0.0

        var merged = List[Int]()
        var i = 0
        var j = 0

        while i < m and j < n:
            if arr1[i] <= arr2[j]:
                merged.append(arr1[i])
                i += 1
            else:
                merged.append(arr2[j])
                j += 1

        while i < m:
            merged.append(arr1[i])
            i += 1

        while j < n:
            merged.append(arr2[j])
            j += 1

        if total % 2 == 0:
            var mid1 = merged[total // 2 - 1]
            var mid2 = merged[total // 2]
            return Float64(mid1 + mid2) / 2.0
        else:
            return Float64(merged[total // 2])

def main():
    var sol = Solution()
    var a: List[Int] = [1, 5, 9]
    var b: List[Int] = [2, 3, 6, 7]
    print("Array 1: [1, 5, 9]")
    print("Array 2: [2, 3, 6, 7]")
    print("Median of two arrays:", sol.median_of_arrays(a, b))

    var a2: List[Int] = [4, 6]
    var b2: List[Int] = [1, 2, 3, 5]
    print("Array 1: [4, 6]")
    print("Array 2: [1, 2, 3, 5]")
    print("Median of two arrays:", sol.median_of_arrays(a2, b2))
