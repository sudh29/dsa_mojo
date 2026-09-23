# Alternate Positive and Negative Numbers
# Pattern: Two Pointer / Rearrangement
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    # Stable rearrangement preserving order of appearance
    def rearrange_stable(self, mut arr: List[Int]):
        var pos = List[Int]()
        var neg = List[Int]()
        for i in range(len(arr)):
            if arr[i] >= 0:
                pos.append(arr[i])
            else:
                neg.append(arr[i])

        var i = 0
        var p = 0
        var n = 0

        # Alternate starting with positive
        while p < len(pos) and n < len(neg):
            arr[i] = pos[p]
            i += 1
            p += 1
            arr[i] = neg[n]
            i += 1
            n += 1

        while p < len(pos):
            arr[i] = pos[p]
            i += 1
            p += 1

        while n < len(neg):
            arr[i] = neg[n]
            i += 1
            n += 1

def main():
    var sol = Solution()
    var arr: List[Int] = [9, 4, -2, -1, 5, 0, -5, -3, 2]
    print("Original array: [9, 4, -2, -1, 5, 0, -5, -3, 2]")
    sol.rearrange_stable(arr)
    print("Rearranged alternating:", end=" [")
    for i in range(len(arr)):
        print(arr[i], end=", " if i < len(arr) - 1 else "")
    print("]")
