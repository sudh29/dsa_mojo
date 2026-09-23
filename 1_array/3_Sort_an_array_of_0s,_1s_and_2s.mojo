# Sort an array of 0s, 1s and 2s
# Pattern: Dutch National Flag / Three Pointer
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def sort_012(self, mut arr: List[Int]):
        var low = 0
        var mid = 0
        var high = len(arr) - 1
        while mid <= high:
            if arr[mid] == 0:
                var temp = arr[low]
                arr[low] = arr[mid]
                arr[mid] = temp
                low += 1
                mid += 1
            elif arr[mid] == 1:
                mid += 1
            else:
                var temp = arr[mid]
                arr[mid] = arr[high]
                arr[high] = temp
                high -= 1

def main():
    var sol = Solution()
    var arr: List[Int] = [0, 2, 1, 2, 0, 1, 0, 2]
    print("Before sorting: [0, 2, 1, 2, 0, 1, 0, 2]")
    sol.sort_012(arr)
    print("After sorting:", end=" [")
    for i in range(len(arr)):
        print(arr[i], end=", " if i < len(arr) - 1 else "")
    print("]")
