# Sorted Matrix
# Pattern: Matrix Flattening / Sorting
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def sorted_matrix(self, var mat: List[List[Int]], n: Int) -> List[List[Int]]:
        # Flatten matrix
        var temp = List[Int]()
        for i in range(n):
            for j in range(n):
                temp.append(mat[i][j])

        # Sort flattened list
        var total = len(temp)
        for i in range(total):
            for j in range(i + 1, total):
                if temp[j] < temp[i]:
                    var t = temp[i]
                    temp[i] = temp[j]
                    temp[j] = t

        # Fill back into matrix
        for i in range(n):
            for j in range(n):
                mat[i][j] = temp[i * n + j]

        return mat^

def main():
    var sol = Solution()
    var mat = List[List[Int]]()
    mat.append([10, 20, 30, 40])
    mat.append([15, 25, 35, 45])
    mat.append([27, 29, 37, 48])
    mat.append([32, 33, 39, 50])

    print("Original matrix 4x4:")
    print("[10, 20, 30, 40]")
    print("[15, 25, 35, 45]")
    print("[27, 29, 37, 48]")
    print("[32, 33, 39, 50]")

    var res = sol.sorted_matrix(mat^, 4)
    print("Sorted matrix:")
    for i in range(len(res)):
        print(end="[")
        for j in range(len(res[i])):
            print(res[i][j], end=", " if j < len(res[i]) - 1 else "")
        print("]")
