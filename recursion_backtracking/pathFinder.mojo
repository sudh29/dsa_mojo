# Find Path in Matrix using Backtracking
# Reference: https://mojolang.org/docs/manual/get-started/

struct Point(ImplicitlyCopyable, Movable):
    var r: Int
    var c: Int

    def __init__(out self, r: Int, c: Int):
        self.r = r
        self.c = c

    def __init__(out self, *, copy: Point):
        self.r = copy.r
        self.c = copy.c

def find_path_util(
    matrix: List[List[Int]],
    r: Int,
    c: Int,
    n: Int,
    mut path: List[Point]
) -> Bool:
    if r == n - 1 and c == n - 1:
        path.append(Point(r, c))
        return True

    path.append(Point(r, c))

    # Move Down
    if r + 1 < n and matrix[r + 1][c] == 1:
        if find_path_util(matrix, r + 1, c, n, path):
            return True

    # Move Right
    if c + 1 < n and matrix[r][c + 1] == 1:
        if find_path_util(matrix, r, c + 1, n, path):
            return True

    _ = path.pop(len(path) - 1)
    return False

def find_path(matrix: List[List[Int]], n: Int) -> List[Point]:
    var path = List[Point]()
    if matrix[0][0] == 1:
        _ = find_path_util(matrix, 0, 0, n, path)
    return path^

def main():
    var n = 5
    var matrix = List[List[Int]]()
    for _ in range(n):
        matrix.append(List[Int]())

    # [1, 1, 1, 1, 0]
    # [0, 1, 0, 1, 0]
    # [0, 1, 0, 1, 0]
    # [0, 1, 0, 0, 0]
    # [1, 1, 1, 1, 1]
    matrix[0].append(1); matrix[0].append(1); matrix[0].append(1); matrix[0].append(1); matrix[0].append(0)
    matrix[1].append(0); matrix[1].append(1); matrix[1].append(0); matrix[1].append(1); matrix[1].append(0)
    matrix[2].append(0); matrix[2].append(1); matrix[2].append(0); matrix[2].append(1); matrix[2].append(0)
    matrix[3].append(0); matrix[3].append(1); matrix[3].append(0); matrix[0].append(0); matrix[3].append(0)
    matrix[4].append(1); matrix[4].append(1); matrix[4].append(1); matrix[4].append(1); matrix[4].append(1)

    var path = find_path(matrix, n)
    print("Found path with", len(path), "steps:")
    for i in range(len(path)):
        print("(", path[i].r, ",", path[i].c, ")", end=" -> " if i < len(path) - 1 else "")
    print()
