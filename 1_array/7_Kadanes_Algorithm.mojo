# Kadane's Algorithm: Maximum Subarray Sum
# Pattern: Dynamic Programming / Greedy One-Pass
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def max_sub_array_sum(self, arr: List[Int]) -> Int:
        var n = len(arr)
        if n == 0:
            return 0
        var max_ending_here = arr[0]
        var max_so_far = arr[0]
        for i in range(1, n):
            var sum_with_prev = max_ending_here + arr[i]
            max_ending_here = arr[i] if arr[i] > sum_with_prev else sum_with_prev
            if max_ending_here > max_so_far:
                max_so_far = max_ending_here
        return max_so_far

def main():
    var sol = Solution()
    var arr: List[Int] = [-2, -3, 4, -1, -2, 1, 5, -3]
    print("Array: [-2, -3, 4, -1, -2, 1, 5, -3]")
    var max_sum = sol.max_sub_array_sum(arr)
    print("Maximum Contiguous Subarray Sum:", max_sum)
