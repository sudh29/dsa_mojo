# Trapping Rain Water
# Pattern: Two Pointer / Prefix & Suffix Max
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def trapping_water(self, arr: List[Int]) -> Int:
        var n = len(arr)
        if n <= 2:
            return 0

        var left = 0
        var right = n - 1
        var left_max = 0
        var right_max = 0
        var total_water = 0

        while left <= right:
            if arr[left] <= arr[right]:
                if arr[left] >= left_max:
                    left_max = arr[left]
                else:
                    total_water += (left_max - arr[left])
                left += 1
            else:
                if arr[right] >= right_max:
                    right_max = arr[right]
                else:
                    total_water += (right_max - arr[right])
                right -= 1

        return total_water

def main():
    var sol = Solution()
    var arr1: List[Int] = [3, 0, 0, 2, 0, 4]
    print("Elevation map 1: [3, 0, 0, 2, 0, 4]")
    print("Trapped rain water:", sol.trapping_water(arr1))

    var arr2: List[Int] = [7, 4, 0, 9]
    print("Elevation map 2: [7, 4, 0, 9]")
    print("Trapped rain water:", sol.trapping_water(arr2))

    var arr3: List[Int] = [6, 9, 9]
    print("Elevation map 3: [6, 9, 9]")
    print("Trapped rain water:", sol.trapping_water(arr3))
