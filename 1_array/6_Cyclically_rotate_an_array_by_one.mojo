# Cyclically rotate an array by one (or k steps)
# Pattern: Array Rotation Technique
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    # Rotate array cyclically by one to the right
    def rotate_by_one(self, mut arr: List[Int]):
        var n = len(arr)
        if n <= 1:
            return
        var last = arr[n - 1]
        for i in range(n - 1, 0, -1):
            arr[i] = arr[i - 1]
        arr[0] = last

    # Rotate array cyclically by k steps to the right
    def rotate_by_k(self, mut arr: List[Int], k: Int):
        var n = len(arr)
        if n <= 1:
            return
        var shifts = k % n
        for _ in range(shifts):
            self.rotate_by_one(arr)

def main():
    var sol = Solution()
    var arr: List[Int] = [1, 2, 3, 4, 5]
    print("Original array: [1, 2, 3, 4, 5]")
    sol.rotate_by_one(arr)
    print("Rotated by one:", end=" [")
    for i in range(len(arr)):
        print(arr[i], end=", " if i < len(arr) - 1 else "")
    print("]")
