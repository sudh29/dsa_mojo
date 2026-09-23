# Common Elements in All Rows of a Given Matrix
# Pattern: Row Frequency Map / Hash Counter
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def distinct_common(self, mat: List[List[Int]], n: Int, m: Int) -> List[Int]:
        var common = List[Int]()
        if n == 0 or m == 0:
            return List[Int]()

        # Collect unique elements in first row
        var candidates = List[Int]()
        for j in range(m):
            var val = mat[0][j]
            var exists = False
            for k in range(len(candidates)):
                if candidates[k] == val:
                    exists = True
                    break
            if not exists:
                candidates.append(val)

        # Check each candidate across all other rows
        for c in range(len(candidates)):
            var val = candidates[c]
            var present_in_all = True

            for i in range(1, n):
                var found_in_row = False
                for j in range(m):
                    if mat[i][j] == val:
                        found_in_row = True
                        break
                if not found_in_row:
                    present_in_all = False
                    break

            if present_in_all:
                common.append(val)

        return common^

def main():
    var sol = Solution()
    var mat = List[List[Int]]()
    mat.append([1, 2, 1, 4, 8])
    mat.append([3, 7, 8, 5, 1])
    mat.append([8, 7, 7, 3, 1])
    mat.append([8, 1, 2, 7, 9])

    print("Matrix 4x5:")
    print("[1, 2, 1, 4, 8]")
    print("[3, 7, 8, 5, 1]")
    print("[8, 7, 7, 3, 1]")
    print("[8, 1, 2, 7, 9]")

    var common = sol.distinct_common(mat, 4, 5)
    print("Common elements present in all rows:", end=" [")
    for i in range(len(common)):
        print(common[i], end=", " if i < len(common) - 1 else "")
    print("]")
