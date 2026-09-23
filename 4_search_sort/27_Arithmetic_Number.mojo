# Arithmetic Number: Check if B is in arithmetic sequence starting at A with difference C
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def in_sequence(self, a: Int, b: Int, c: Int) -> Int:
        if c == 0:
            return 1 if (a == b) else 0

        var diff = b - a
        if (diff % c == 0) and (diff // c >= 0):
            return 1

        return 0

def main():
    var sol = Solution()
    print("in_sequence(1, 5, 2):", sol.in_sequence(1, 5, 2))
    print("in_sequence(1, 1, 0):", sol.in_sequence(1, 1, 0))
    print("in_sequence(1, 3, 1):", sol.in_sequence(1, 3, 1))
    print("in_sequence(1, 2, 3):", sol.in_sequence(1, 2, 3))
