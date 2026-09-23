# Find Common Elements in 3 Sorted Arrays
# Pattern: Three Pointer Technique
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def common_elements(self, a: List[Int], b: List[Int], c: List[Int]) -> List[Int]:
        var n1 = len(a)
        var n2 = len(b)
        var n3 = len(c)
        var res = List[Int]()

        var i = 0
        var j = 0
        var k = 0

        while i < n1 and j < n2 and k < n3:
            if a[i] == b[j] and b[j] == c[k]:
                if len(res) == 0 or res[len(res) - 1] != a[i]:
                    res.append(a[i])
                i += 1
                j += 1
                k += 1
            elif a[i] < b[j]:
                i += 1
            elif b[j] < c[k]:
                j += 1
            else:
                k += 1

        return res^

def main():
    var sol = Solution()
    var a: List[Int] = [1, 5, 10, 20, 40, 80]
    var b: List[Int] = [6, 7, 20, 80, 100]
    var c: List[Int] = [3, 4, 15, 20, 30, 70, 80, 120]
    print("Array A: [1, 5, 10, 20, 40, 80]")
    print("Array B: [6, 7, 20, 80, 100]")
    print("Array C: [3, 4, 15, 20, 30, 70, 80, 120]")

    var common = sol.common_elements(a, b, c)
    print("Common elements in all three arrays:", end=" [")
    for i in range(len(common)):
        print(common[i], end=", " if i < len(common) - 1 else "")
    print("]")
