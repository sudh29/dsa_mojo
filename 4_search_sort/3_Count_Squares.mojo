# Count Squares strictly less than N
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def count_squares(self, n: Int) -> Int:
        if n <= 1:
            return 0

        var count = 0
        var i = 1
        while (i * i) < n:
            count += 1
            i += 1

        return count

def main():
    var sol = Solution()
    var t1 = 9
    var t2 = 10
    var t3 = 25
    var t4 = 1

    print("Squares less than", t1, ":", sol.count_squares(t1))
    print("Squares less than", t2, ":", sol.count_squares(t2))
    print("Squares less than", t3, ":", sol.count_squares(t3))
    print("Squares less than", t4, ":", sol.count_squares(t4))
