# Sort array according to count of set bits (descending order) while preserving stability
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def count_set_bits(self, val: Int) -> Int:
        var count = 0
        var n = val
        while n > 0:
            count += (n & 1)
            n >>= 1
        return count

    def sort_by_set_bit_count(self, mut arr: List[Int], n: Int):
        # Stable sort (insertion sort or stable bubble) based on set bit count descending
        for i in range(1, n):
            var key = arr[i]
            var key_bits = self.count_set_bits(key)
            var j = i - 1

            while j >= 0 and self.count_set_bits(arr[j]) < key_bits:
                arr[j + 1] = arr[j]
                j -= 1

            arr[j + 1] = key

def main():
    var sol = Solution()
    var arr: List[Int] = [5, 2, 3, 9, 4, 6, 7, 15, 32]
    var n = len(arr)

    print("Original Array:", end=" [")
    for i in range(n):
        print(arr[i], end=", " if i < n - 1 else "")
    print("]")

    sol.sort_by_set_bit_count(arr, n)

    print("Sorted by set bit count (descending):", end=" [")
    for i in range(n):
        print(arr[i], end=", " if i < n - 1 else "")
    print("]")
