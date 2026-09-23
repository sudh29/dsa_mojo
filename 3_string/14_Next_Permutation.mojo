# Next Permutation
# Pattern: Two Pointer / Permutation Algorithm
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def next_permutation(self, mut arr: List[Int]):
        var n = len(arr)
        if n <= 1:
            return

        var i = n - 2
        while i >= 0 and arr[i] >= arr[i + 1]:
            i -= 1

        if i >= 0:
            var j = n - 1
            while arr[j] <= arr[i]:
                j -= 1
            var temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp

        # Reverse suffix from i + 1 to end
        var left = i + 1
        var right = n - 1
        while left < right:
            var t = arr[left]
            arr[left] = arr[right]
            arr[right] = t
            left += 1
            right -= 1

def main():
    var sol = Solution()
    var arr: List[Int] = [1, 2, 3]
    print("Original permutation: [1, 2, 3]")
    sol.next_permutation(arr)
    print("Next permutation:", end=" [")
    for i in range(len(arr)):
        print(arr[i], end=", " if i < len(arr) - 1 else "")
    print("]")
