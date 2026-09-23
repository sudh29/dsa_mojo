# Minimum Cost to Cut Board into Squares
# Reference: https://mojolang.org/docs/manual/get-started/

def minimum_cost_of_breaking(
    mut x: List[Int],
    mut y: List[Int],
    m: Int,
    n: Int
) -> Int:
    # Sort X descending
    for i in range(len(x)):
        var max_idx = i
        for k in range(i + 1, len(x)):
            if x[k] > x[max_idx]:
                max_idx = k
        if max_idx != i:
            var tmp = x[i]
            x[i] = x[max_idx]
            x[max_idx] = tmp

    # Sort Y descending
    for i in range(len(y)):
        var max_idx = i
        for k in range(i + 1, len(y)):
            if y[k] > y[max_idx]:
                max_idx = k
        if max_idx != i:
            var tmp = y[i]
            y[i] = y[max_idx]
            y[max_idx] = tmp

    var horizontal_pieces = 1
    var vertical_pieces = 1
    var i = 0
    var j = 0
    var total_cost = 0

    while i < m - 1 and j < n - 1:
        if x[i] > y[j]:
            total_cost += x[i] * vertical_pieces
            horizontal_pieces += 1
            i += 1
        else:
            total_cost += y[j] * horizontal_pieces
            vertical_pieces += 1
            j += 1

    while i < m - 1:
        total_cost += x[i] * vertical_pieces
        horizontal_pieces += 1
        i += 1

    while j < n - 1:
        total_cost += y[j] * horizontal_pieces
        vertical_pieces += 1
        j += 1

    return total_cost

def main():
    # 6 x 4 board
    # 5 vertical cut costs, 3 horizontal cut costs
    var x = List[Int]()
    x.append(2)
    x.append(1)
    x.append(3)
    x.append(1)
    x.append(4)

    var y = List[Int]()
    y.append(4)
    y.append(1)
    y.append(2)

    var cost = minimum_cost_of_breaking(x, y, 6, 4)
    print("Minimum cost to cut board into squares:", cost)
