# Merge Without Extra Space
# Pattern: Two Pointer / Sorting
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def merge(self, mut arr1: List[Int], mut arr2: List[Int]):
        var n = len(arr1)
        var m = len(arr2)
        var i = 0
        var j = 0
        var k = n - 1

        while i <= k and j < m:
            if arr1[i] < arr2[j]:
                i += 1
            else:
                var temp = arr1[k]
                arr1[k] = arr2[j]
                arr2[j] = temp
                j += 1
                k -= 1

        # Sort arr1
        for a in range(n):
            for b in range(a + 1, n):
                if arr1[b] < arr1[a]:
                    var t = arr1[a]
                    arr1[a] = arr1[b]
                    arr1[b] = t

        # Sort arr2
        for a in range(m):
            for b in range(a + 1, m):
                if arr2[b] < arr2[a]:
                    var t = arr2[a]
                    arr2[a] = arr2[b]
                    arr2[b] = t

def main():
    var sol = Solution()
    var arr1: List[Int] = [1, 3, 5, 7]
    var arr2: List[Int] = [0, 2, 6, 8, 9]
    print("Before merge:")
    print("arr1: [1, 3, 5, 7]")
    print("arr2: [0, 2, 6, 8, 9]")
    sol.merge(arr1, arr2)
    print("After merge:")
    print("arr1:", end=" [")
    for i in range(len(arr1)):
        print(arr1[i], end=", " if i < len(arr1) - 1 else "")
    print("]")
    print("arr2:", end=" [")
    for i in range(len(arr2)):
        print(arr2[i], end=", " if i < len(arr2) - 1 else "")
    print("]")
