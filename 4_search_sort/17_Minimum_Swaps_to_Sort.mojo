# Minimum swaps required to sort an array
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def min_swaps(self, nums: List[Int]) -> Int:
        var n = len(nums)
        var vals = List[Int]()
        var orig_indices = List[Int]()

        for i in range(n):
            vals.append(nums[i])
            orig_indices.append(i)

        # Sort pairs by value (bubble sort for small arrays)
        for i in range(n):
            for j in range(0, n - i - 1):
                if vals[j] > vals[j + 1]:
                    var tmp_val = vals[j]
                    vals[j] = vals[j + 1]
                    vals[j + 1] = tmp_val

                    var tmp_idx = orig_indices[j]
                    orig_indices[j] = orig_indices[j + 1]
                    orig_indices[j + 1] = tmp_idx

        var visited = List[Bool]()
        for _ in range(n):
            visited.append(False)

        var total_swaps = 0

        for i in range(n):
            if visited[i] or orig_indices[i] == i:
                continue

            var cycle_size = 0
            var j = i

            while not visited[j]:
                visited[j] = True
                j = orig_indices[j]
                cycle_size += 1

            if cycle_size > 0:
                total_swaps += (cycle_size - 1)

        return total_swaps

def main():
    var sol = Solution()
    var arr1: List[Int] = [2, 8, 5, 4]
    var arr2: List[Int] = [10, 19, 6, 3, 5]
    print("Min swaps for [2, 8, 5, 4]:", sol.min_swaps(arr1))
    print("Min swaps for [10, 19, 6, 3, 5]:", sol.min_swaps(arr2))
