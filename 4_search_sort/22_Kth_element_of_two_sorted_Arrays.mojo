# K-th element of two sorted Arrays
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def kth_element(self, arr1: List[Int], arr2: List[Int], n: Int, m: Int, k: Int) -> Int:
        var i = 0
        var j = 0
        var count = 0

        while i < n and j < m:
            if arr1[i] <= arr2[j]:
                if count == k - 1:
                    return arr1[i]
                i += 1
            else:
                if count == k - 1:
                    return arr2[j]
                j += 1
            count += 1

        while i < n:
            if count == k - 1:
                return arr1[i]
            i += 1
            count += 1

        while j < m:
            if count == k - 1:
                return arr2[j]
            j += 1
            count += 1

        return -1

def main():
    var sol = Solution()
    var arr1: List[Int] = [2, 3, 6, 7, 9]
    var arr2: List[Int] = [1, 4, 8, 10]
    var k = 5

    print("arr1: [2, 3, 6, 7, 9]")
    print("arr2: [1, 4, 8, 10]")
    print("The", k, "-th element is:", sol.kth_element(arr1, arr2, len(arr1), len(arr2), k))
