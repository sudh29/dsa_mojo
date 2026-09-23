# Move all negative elements to end
# Pattern: Two Pointer / Partitioning / Order-Preserving
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    # In-place two-pointer partition
    def move_negatives_in_place(self, mut arr: List[Int]):
        var left = 0
        var right = len(arr) - 1
        while left <= right:
            if arr[left] >= 0:
                left += 1
            elif arr[right] < 0:
                right -= 1
            else:
                var temp = arr[left]
                arr[left] = arr[right]
                arr[right] = temp
                left += 1
                right -= 1

    # Order-preserving segregation (all positives first, then negatives)
    def segregate_elements_stable(self, mut arr: List[Int]):
        var pos = List[Int]()
        var neg = List[Int]()
        for i in range(len(arr)):
            if arr[i] >= 0:
                pos.append(arr[i])
            else:
                neg.append(arr[i])
        var idx = 0
        for i in range(len(pos)):
            arr[idx] = pos[i]
            idx += 1
        for i in range(len(neg)):
            arr[idx] = neg[i]
            idx += 1

def main():
    var sol = Solution()
    var arr1: List[Int] = [1, -1, 3, 2, -7, -5, 11, 6]
    print("Original array: [1, -1, 3, 2, -7, -5, 11, 6]")
    sol.segregate_elements_stable(arr1)
    print("Stable order (positives first, then negatives):", end=" [")
    for i in range(len(arr1)):
        print(arr1[i], end=", " if i < len(arr1) - 1 else "")
    print("]")

    var arr2: List[Int] = [-12, 11, -13, -5, 6, -7, 5, -3, -6]
    sol.move_negatives_in_place(arr2)
    print("In-place partitioned:", end=" [")
    for i in range(len(arr2)):
        print(arr2[i], end=", " if i < len(arr2) - 1 else "")
    print("]")
