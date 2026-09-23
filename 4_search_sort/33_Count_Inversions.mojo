# Count Inversions in an array using Merge Sort
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def merge_and_count(self, mut arr: List[Int], low: Int, mid: Int, high: Int) -> Int:
        var temp = List[Int]()
        var i = low
        var j = mid + 1
        var count = 0

        while i <= mid and j <= high:
            if arr[i] <= arr[j]:
                temp.append(arr[i])
                i += 1
            else:
                temp.append(arr[j])
                count += (mid - i + 1)
                j += 1

        while i <= mid:
            temp.append(arr[i])
            i += 1

        while j <= high:
            temp.append(arr[j])
            j += 1

        for idx in range(len(temp)):
            arr[low + idx] = temp[idx]

        return count

    def merge_sort_and_count(self, mut arr: List[Int], low: Int, high: Int) -> Int:
        var count = 0
        if low < high:
            var mid = low + (high - low) // 2
            count += self.merge_sort_and_count(arr, low, mid)
            count += self.merge_sort_and_count(arr, mid + 1, high)
            count += self.merge_and_count(arr, low, mid, high)
        return count

    def inversion_count(self, mut arr: List[Int], n: Int) -> Int:
        if n <= 1:
            return 0
        return self.merge_sort_and_count(arr, 0, n - 1)

def main():
    var sol = Solution()
    var arr1: List[Int] = [2, 4, 1, 3, 5]
    var arr2: List[Int] = [1, 3, 2, 3, 1]
    print("Inversions in [2, 4, 1, 3, 5]:", sol.inversion_count(arr1, len(arr1)))
    print("Inversions in [1, 3, 2, 3, 1]:", sol.inversion_count(arr2, len(arr2)))
