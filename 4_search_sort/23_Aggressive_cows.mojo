# Aggressive Cows: Binary Search on Answer for Largest Minimum Distance
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def sort_arr(self, mut arr: List[Int]):
        var n = len(arr)
        for i in range(n):
            for j in range(0, n - i - 1):
                if arr[j] > arr[j + 1]:
                    var tmp = arr[j]
                    arr[j] = arr[j + 1]
                    arr[j + 1] = tmp

    def can_place_cows(self, stalls: List[Int], n: Int, c: Int, dist: Int) -> Bool:
        var count = 1
        var prev = stalls[0]

        for i in range(1, n):
            if stalls[i] - prev >= dist:
                count += 1
                prev = stalls[i]
                if count >= c:
                    return True

        return False

    def largest_min_distance(self, mut stalls: List[Int], n: Int, c: Int) -> Int:
        self.sort_arr(stalls)
        var start = 1
        var end = stalls[n - 1] - stalls[0]
        var ans = 0

        while start <= end:
            var mid = start + (end - start) // 2

            if self.can_place_cows(stalls, n, c, mid):
                ans = mid
                start = mid + 1
            else:
                end = mid - 1

        return ans^

def main():
    var sol = Solution()
    var stalls: List[Int] = [1, 2, 8, 4, 9]
    var cows = 3

    print("Stalls: [1, 2, 8, 4, 9], Cows:", cows)
    print("Largest minimum distance:", sol.largest_min_distance(stalls, len(stalls), cows))
