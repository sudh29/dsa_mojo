# Count Pairs with Given Sum
# Pattern: Two Pointer / Hash Map Frequency
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def get_pairs_count(self, mut arr: List[Int], k: Int) -> Int:
        var n = len(arr)
        if n <= 1:
            return 0

        # Sort array
        for i in range(n):
            for j in range(i + 1, n):
                if arr[j] < arr[i]:
                    var t = arr[i]
                    arr[i] = arr[j]
                    arr[j] = t

        var count = 0
        var left = 0
        var right = n - 1

        while left < right:
            var current_sum = arr[left] + arr[right]
            if current_sum < k:
                left += 1
            elif current_sum > k:
                right -= 1
            else:
                if arr[left] == arr[right]:
                    var total = right - left + 1
                    count += (total * (total - 1)) // 2
                    break

                var left_val = arr[left]
                var left_count = 0
                while left < right and arr[left] == left_val:
                    left_count += 1
                    left += 1

                var right_val = arr[right]
                var right_count = 0
                while right >= left and arr[right] == right_val:
                    right_count += 1
                    right -= 1

                count += (left_count * right_count)

        return count

def main():
    var sol = Solution()
    var arr: List[Int] = [1, 5, 7, 1]
    var k = 6
    print("Array: [1, 5, 7, 1], k = 6")
    print("Number of pairs with sum 6:", sol.get_pairs_count(arr, k))

    var arr2: List[Int] = [1, 1, 1, 1]
    var k2 = 2
    print("Array: [1, 1, 1, 1], k = 2")
    print("Number of pairs with sum 2:", sol.get_pairs_count(arr2, k2))
