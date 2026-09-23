# Rotate Matrix by 90 Degrees Anticlockwise
# Pattern: Matrix In-place Transformation (Transpose + Reverse)
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def rotate_by_90_anti(self, mut a: List[List[Int]], n: Int):
        # Step 1: Transpose matrix
        for i in range(n):
            for j in range(i, n):
                var temp = a[i][j]
                a[i][j] = a[j][i]
                a[j][i] = temp

        # Step 2: Reverse columns (swap row i and row n - i - 1)
        for i in range(n // 2):
            for j in range(n):
                var temp = a[i][j]
                a[i][j] = a[n - i - 1][j]
                a[n - i - 1][j] = temp

def main():
    var sol = Solution()
    var mat = List[List[Int]]()
    mat.append([1, 2, 3])
    mat.append([4, 5, 6])
    mat.append([7, 8, 9])

    print("Original matrix 3x3:")
    print("[1, 2, 3]")
    print("[4, 5, 6]")
    print("[7, 8, 9]")

    sol.rotate_by_90_anti(mat, 3)
    print("Rotated 90 degrees anticlockwise:")
    for i in range(3):
        print(end="[")
        for j in range(3):
            print(mat[i][j], end=", " if j < 2 else "")
        print("]")
