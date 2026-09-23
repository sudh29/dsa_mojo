# Find Missing And Repeating elements in an array from 1 to N
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def find_two_element(self, mut arr: List[Int], n: Int) -> List[Int]:
        var repeating = -1
        var missing = -1

        # Use index marking technique
        for i in range(n):
            var val = abs(arr[i])
            var idx = val - 1

            if arr[idx] < 0:
                repeating = val
            else:
                arr[idx] = -arr[idx]

        for i in range(n):
            if arr[i] > 0:
                missing = i + 1
                break

        var res = List[Int]()
        res.append(repeating)
        res.append(missing)
        return res^

def main():
    var sol = Solution()
    var arr1: List[Int] = [2, 2]
    var res1 = sol.find_two_element(arr1, len(arr1))
    print("Array [2, 2] -> Repeating:", res1[0], ", Missing:", res1[1])

    var arr2: List[Int] = [1, 3, 3]
    var res2 = sol.find_two_element(arr2, len(arr2))
    print("Array [1, 3, 3] -> Repeating:", res2[0], ", Missing:", res2[1])

    var arr3: List[Int] = [4, 3, 6, 2, 1, 1]
    var res3 = sol.find_two_element(arr3, len(arr3))
    print("Array [4, 3, 6, 2, 1, 1] -> Repeating:", res3[0], ", Missing:", res3[1])
