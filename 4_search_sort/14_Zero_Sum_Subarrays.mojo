# Total number of Subarrays with Zero Sum
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def find_subarrays(self, arr: List[Int], n: Int) -> Int:
        var total_count = 0
        var curr_sum = 0

        # Frequency map for prefix sums (keys and frequencies)
        var prefix_keys = List[Int]()
        var prefix_freq = List[Int]()

        for i in range(n):
            curr_sum += arr[i]

            if curr_sum == 0:
                total_count += 1

            # Check if curr_sum was seen before
            var found = False
            for j in range(len(prefix_keys)):
                if prefix_keys[j] == curr_sum:
                    total_count += prefix_freq[j]
                    prefix_freq[j] += 1
                    found = True
                    break

            if not found:
                prefix_keys.append(curr_sum)
                prefix_freq.append(1)

        return total_count

def main():
    var sol = Solution()
    var arr1: List[Int] = [0, 0, 5, 5, 0, 0]
    var arr2: List[Int] = [6, -1, -3, 4, -2, 2, 4, 6, -12, -7]
    print("Zero sum subarrays in [0, 0, 5, 5, 0, 0]:", sol.find_subarrays(arr1, len(arr1)))
    print("Zero sum subarrays in [6, -1, -3, 4, -2, 2, 4, 6, -12, -7]:", sol.find_subarrays(arr2, len(arr2)))
