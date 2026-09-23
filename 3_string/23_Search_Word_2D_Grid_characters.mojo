# Search Word in a 2D Grid of characters in 8 directions
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def is_valid(self, x: Int, y: Int, n: Int, m: Int) -> Bool:
        return x >= 0 and x < n and y >= 0 and y < m

    def search_from(self, grid: List[List[String]], word: String, x: Int, y: Int, n: Int, m: Int) -> Bool:
        # 8 directions: Up, Down, Left, Right, 4 diagonals
        var dx = List[Int](); dx.append(-1); dx.append(1); dx.append(0); dx.append(0); dx.append(-1); dx.append(-1); dx.append(1); dx.append(1)
        var dy = List[Int](); dy.append(0); dy.append(0); dy.append(-1); dy.append(1); dy.append(-1); dy.append(1); dy.append(-1); dy.append(1)
        var word_len = word.byte_length()

        for d in range(8):
            var nx = x
            var ny = y
            var matched = True

            for k in range(word_len):
                if not self.is_valid(nx, ny, n, m):
                    matched = False
                    break
                if grid[nx][ny] != String(word[byte=k]):
                    matched = False
                    break
                nx += dx[d]
                ny += dy[d]

            if matched:
                return True

        return False

    def search_word(self, grid: List[List[String]], word: String) -> List[List[Int]]:
        var result = List[List[Int]]()
        var n = len(grid)
        if n == 0 or word.byte_length() == 0:
            return result^
        var m = len(grid[0])

        var first_char = String(word[byte=0])

        for i in range(n):
            for j in range(m):
                if grid[i][j] == first_char:
                    if self.search_from(grid, word, i, j, n, m):
                        var coord = List[Int]()
                        coord.append(i)
                        coord.append(j)
                        result.append(coord^)

        return result^

def main():
    var sol = Solution()

    # Create 3x4 grid:
    var grid = List[List[String]]()

    var r0 = List[String]()
    r0.append("a"); r0.append("b"); r0.append("a"); r0.append("e")
    grid.append(r0^)

    var r1 = List[String]()
    r1.append("b"); r1.append("a"); r1.append("b"); r1.append("c")
    grid.append(r1^)

    var r2 = List[String]()
    r2.append("e"); r2.append("d"); r2.append("e"); r2.append("f")
    grid.append(r2^)

    var word = String("abe")
    print("Searching for:", word)
    var coords = sol.search_word(grid, word)

    print("Found occurrences starting at:")
    for idx in range(len(coords)):
        print("(", coords[idx][0], ",", coords[idx][1], ")")
