# Maximum Size Rectangle Binary Sub-matrix with All 1s
# Pattern: Histogram Stack / Dynamic Programming
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    # Largest Rectangle in Histogram using stack simulation
    def max_histogram_area(self, hist: List[Int]) -> Int:
        var stack = List[Int]()
        var max_area = 0
        var i = 0
        var n = len(hist)

        while i < n:
            if len(stack) == 0 or hist[i] >= hist[stack[len(stack) - 1]]:
                stack.append(i)
                i += 1
            else:
                var top_idx = stack[len(stack) - 1]
                var _ = stack.pop()
                var width = i if len(stack) == 0 else (i - stack[len(stack) - 1] - 1)
                var area = hist[top_idx] * width
                if area > max_area:
                    max_area = area

        while len(stack) > 0:
            var top_idx = stack[len(stack) - 1]
            var _ = stack.pop()
            var width = i if len(stack) == 0 else (i - stack[len(stack) - 1] - 1)
            var area = hist[top_idx] * width
            if area > max_area:
                max_area = area

        return max_area

    def max_rectangle_area(self, mat: List[List[Int]], n: Int, m: Int) -> Int:
        if n == 0 or m == 0:
            return 0

        var hist = List[Int]()
        for _ in range(m):
            hist.append(0)

        var max_area = 0

        for i in range(n):
            for j in range(m):
                if mat[i][j] == 0:
                    hist[j] = 0
                else:
                    hist[j] += 1

            var current_area = self.max_histogram_area(hist)
            if current_area > max_area:
                max_area = current_area

        return max_area

def main():
    var sol = Solution()
    var mat = List[List[Int]]()
    mat.append([0, 1, 1, 0])
    mat.append([1, 1, 1, 1])
    mat.append([1, 1, 1, 1])
    mat.append([1, 1, 0, 0])

    print("Binary matrix 4x4:")
    print("[0, 1, 1, 0]")
    print("[1, 1, 1, 1]")
    print("[1, 1, 1, 1]")
    print("[1, 1, 0, 0]")

    print("Maximum size rectangle of 1s area:", sol.max_rectangle_area(mat, 4, 4))
