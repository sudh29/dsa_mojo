# Minimum Swaps and K Together
# Pattern: Sliding Window / Two Pointer
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def min_swap(self, arr: List[Int], k: Int) -> Int:
        var n = len(arr)
        if n <= 1:
            return 0

        # Count elements <= k
        var fav = 0
        for i in range(n):
            if arr[i] <= k:
                fav += 1

        if fav <= 1:
            return 0

        # Count non-favorable elements in first window of size fav
        var non_fav = 0
        for i in range(fav):
            if arr[i] > k:
                non_fav += 1

        var min_swaps = non_fav

        # Slide window of size fav
        for i in range(fav, n):
            if arr[i] > k:
                non_fav += 1
            if arr[i - fav] > k:
                non_fav -= 1

            if non_fav < min_swaps:
                min_swaps = non_fav

        return min_swaps

def main():
    var sol = Solution()
    var arr1: List[Int] = [2, 1, 5, 6, 3]
    var k1 = 3
    print("Array: [2, 1, 5, 6, 3], k =", k1)
    print("Minimum swaps needed:", sol.min_swap(arr1, k1))

    var arr2: List[Int] = [2, 7, 9, 5, 8, 7, 4]
    var k2 = 6
    print("Array: [2, 7, 9, 5, 8, 7, 4], k =", k2)
    print("Minimum swaps needed:", sol.min_swap(arr2, k2))
