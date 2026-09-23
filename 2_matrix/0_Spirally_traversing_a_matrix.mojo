# Spirally Traversing a Matrix
# Pattern: Matrix Traversal / Boundary Simulation
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def spirally_traverse(self, matrix: List[List[Int]], r: Int, c: Int) -> List[Int]:
        var res = List[Int]()
        if r == 0 or c == 0:
            return res^

        var top = 0
        var bottom = r - 1
        var left = 0
        var right = c - 1

        while left <= right and top <= bottom:
            # Traverse top row
            for j in range(left, right + 1):
                res.append(matrix[top][j])
            top += 1

            # Traverse right column
            for i in range(top, bottom + 1):
                res.append(matrix[i][right])
            right -= 1

            # Traverse bottom row
            if top <= bottom:
                for j in range(right, left - 1, -1):
                    res.append(matrix[bottom][j])
                bottom -= 1

            # Traverse left column
            if left <= right:
                for i in range(bottom, top - 1, -1):
                    res.append(matrix[i][left])
                left += 1

        return res^

def main():
    var sol = Solution()
    var matrix = List[List[Int]]()
    matrix.append([1, 2, 3, 4])
    matrix.append([5, 6, 7, 8])
    matrix.append([9, 10, 11, 12])
    matrix.append([13, 14, 15, 16])

    print("Matrix 4x4:")
    print("[1, 2, 3, 4]")
    print("[5, 6, 7, 8]")
    print("[9, 10, 11, 12]")
    print("[13, 14, 15, 16]")

    var spiral = sol.spirally_traverse(matrix, 4, 4)
    print("Spiral order:", end=" [")
    for i in range(len(spiral)):
        print(spiral[i], end=", " if i < len(spiral) - 1 else "")
    print("]")
