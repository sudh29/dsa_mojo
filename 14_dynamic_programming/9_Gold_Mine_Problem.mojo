# Gold Mine Problem
# Reference: https://mojolang.org/docs/manual/get-started/

def max_gold(n: Int, m: Int, mut mat: List[List[Int]]) -> Int:
    for col in range(m - 2, -1, -1):
        for row in range(n):
            var right = mat[row][col + 1]
            var right_up = mat[row - 1][col + 1] if row > 0 else 0
            var right_down = mat[row + 1][col + 1] if row < n - 1 else 0

            var best_next = right
            if right_up > best_next:
                best_next = right_up
            if right_down > best_next:
                best_next = right_down

            mat[row][col] += best_next

    var max_val = mat[0][0]
    for row in range(1, n):
        if mat[row][0] > max_val:
            max_val = mat[row][0]

    return max_val

def main():
    var n = 3
    var m = 3
    var mat = List[List[Int]]()
    for _ in range(n):
        mat.append(List[Int]())

    # 1 3 3
    # 2 1 4
    # 0 6 4
    mat[0].append(1); mat[0].append(3); mat[0].append(3)
    mat[1].append(2); mat[1].append(1); mat[1].append(4)
    mat[2].append(0); mat[2].append(6); mat[2].append(4)

    print("Maximum gold collected:", max_gold(n, m, mat))
