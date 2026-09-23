# Find Shortest Safe Route in a Matrix with Landmines
# Reference: https://mojolang.org/docs/manual/get-started/

struct QueueNode(ImplicitlyCopyable, Movable):
    var r: Int
    var c: Int
    var dist: Int

    def __init__(out self, r: Int, c: Int, dist: Int):
        self.r = r
        self.c = c
        self.dist = dist

    def __init__(out self, *, copy: QueueNode):
        self.r = copy.r
        self.c = copy.c
        self.dist = copy.dist

def find_shortest_safe_path(mat: List[List[Int]]) -> Int:
    var rows = len(mat)
    if rows == 0:
        return -1
    var cols = len(mat[0])

    # Mark landmine-adjacent cells unsafe
    var safe = List[List[Bool]]()
    for r in range(rows):
        var row = List[Bool]()
        for c in range(cols):
            row.append(mat[r][c] == 1)
        safe.append(row^)

    var dr = List[Int](); dr.append(-1); dr.append(1); dr.append(0); dr.append(0)
    var dc = List[Int](); dc.append(0); dc.append(0); dc.append(-1); dc.append(1)

    for r in range(rows):
        for c in range(cols):
            if mat[r][c] == 0:
                safe[r][c] = False
                for k in range(4):
                    var nr = r + dr[k]
                    var nc = c + dc[k]
                    if nr >= 0 and nr < rows and nc >= 0 and nc < cols:
                        safe[nr][nc] = False

    var visited = List[List[Bool]]()
    for _ in range(rows):
        var vrow = List[Bool]()
        for _ in range(cols):
            vrow.append(False)
        visited.append(vrow^)

    var queue = List[QueueNode]()
    for r in range(rows):
        if safe[r][0]:
            queue.append(QueueNode(r, 0, 1))
            visited[r][0] = True

    var head = 0
    while head < len(queue):
        var curr = queue[head]
        head += 1

        if curr.c == cols - 1:
            return curr.dist

        for k in range(4):
            var nr = curr.r + dr[k]
            var nc = curr.c + dc[k]

            if nr >= 0 and nr < rows and nc >= 0 and nc < cols:
                if safe[nr][nc] and not visited[nr][nc]:
                    visited[nr][nc] = True
                    queue.append(QueueNode(nr, nc, curr.dist + 1))

    return -1

def main():
    # 5 x 5 matrix with landmines (0)
    var mat = List[List[Int]]()
    for _ in range(5):
        mat.append(List[Int]())

    mat[0].append(1); mat[0].append(1); mat[0].append(1); mat[0].append(1); mat[0].append(1)
    mat[1].append(1); mat[1].append(0); mat[1].append(1); mat[1].append(1); mat[1].append(1)
    mat[2].append(1); mat[2].append(1); mat[2].append(1); mat[2].append(0); mat[2].append(1)
    mat[3].append(0); mat[3].append(1); mat[3].append(1); mat[3].append(1); mat[3].append(1)
    mat[4].append(1); mat[4].append(1); mat[4].append(1); mat[4].append(1); mat[4].append(1)

    print("Shortest safe path length:", find_shortest_safe_path(mat))
