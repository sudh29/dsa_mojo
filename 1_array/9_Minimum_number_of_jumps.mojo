# Minimum Number of Jumps
# Pattern: Greedy / Dynamic Programming
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def min_jumps(self, arr: List[Int]) -> Int:
        var n = len(arr)
        if n <= 1:
            return 0
        if arr[0] == 0:
            return -1

        var max_reachable = arr[0]
        var steps_left = arr[0]
        var jumps = 1

        for i in range(1, n):
            if i == n - 1:
                return jumps

            if i + arr[i] > max_reachable:
                max_reachable = i + arr[i]

            steps_left -= 1
            if steps_left == 0:
                jumps += 1
                if i >= max_reachable:
                    return -1
                steps_left = max_reachable - i

        return -1

def main():
    var sol = Solution()
    var arr: List[Int] = [1, 3, 5, 8, 9, 2, 6, 7, 6, 8, 9]
    print("Array: [1, 3, 5, 8, 9, 2, 6, 7, 6, 8, 9]")
    print("Minimum jumps to reach end:", sol.min_jumps(arr))
