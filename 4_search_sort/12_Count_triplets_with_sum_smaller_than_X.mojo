# Count triplets with sum smaller than a given value X
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

    def count_triplets(self, mut arr: List[Int], n: Int, target_sum: Int) -> Int:
        self.sort_arr(arr)
        var count = 0

        for i in range(n - 2):
            var j = i + 1
            var k = n - 1

            while k > j:
                var current_sum = arr[i] + arr[j] + arr[k]
                if current_sum < target_sum:
                    count += (k - j)
                    j += 1
                else:
                    k -= 1

        return count

def main():
    var sol = Solution()
    var arr: List[Int] = [-2, 0, 1, 3]
    var target = 2

    print("Array: [-2, 0, 1, 3], Target:", target)
    print("Triplets with sum < 2:", sol.count_triplets(arr, len(arr), target))

    var arr2: List[Int] = [5, 1, 3, 4, 7]
    var target2 = 12
    print("Array: [5, 1, 3, 4, 7], Target:", target2)
    print("Triplets with sum < 12:", sol.count_triplets(arr2, len(arr2), target2))
