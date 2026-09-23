# Triplet Sum in Array
# Pattern: Two Pointer / Sorting
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def find_3_numbers(self, mut a: List[Int], target: Int) -> Bool:
        var n = len(a)
        if n < 3:
            return False

        # Sort array
        for i in range(n):
            for j in range(i + 1, n):
                if a[j] < a[i]:
                    var t = a[i]
                    a[i] = a[j]
                    a[j] = t

        for i in range(n - 2):
            var remaining = target - a[i]
            var left = i + 1
            var right = n - 1

            while left < right:
                var current_sum = a[left] + a[right]
                if current_sum == remaining:
                    return True
                elif current_sum < remaining:
                    left += 1
                else:
                    right -= 1

        return False

def main():
    var sol = Solution()
    var arr: List[Int] = [1, 4, 45, 6, 10, 8]
    var x = 13
    print("Array: [1, 4, 45, 6, 10, 8], Target sum:", x)
    print("Triplet exists:", sol.find_3_numbers(arr, x))

    var arr2: List[Int] = [1, 2, 4, 3, 6]
    var x2 = 10
    print("Array: [1, 2, 4, 3, 6], Target sum:", x2)
    print("Triplet exists:", sol.find_3_numbers(arr2, x2))
