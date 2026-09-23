# Floyd-Warshall Algorithm for All-Pairs Shortest Path

def print_matrix(m: List[List[Int]], v: Int, inf: Int):
    for i in range(v):
        for j in range(v):
            if m[i][j] >= inf:
                print("INF", end=" ")
            else:
                print(m[i][j], end=" ")
        print()

def floyd_warshall(v: Int, mut m: List[List[Int]]):
    var inf = 1000000000
    for k in range(v):
        for i in range(v):
            for j in range(v):
                if m[i][k] != inf and m[k][j] != inf:
                    if m[i][k] + m[k][j] < m[i][j]:
                        m[i][j] = m[i][k] + m[k][j]

def main():
    var v = 4
    var inf = 1000000000
    var m = List[List[Int]]()
    for i in range(v):
        var row = List[Int]()
        for j in range(v):
            if i == j:
                row.append(0)
            else:
                row.append(inf)
        m.append(row^)

    m[0][3] = 10
    m[0][1] = 5
    m[1][2] = 3
    m[2][3] = 1

    print("Initial Distance Matrix:")
    print_matrix(m, v, inf)
    print()

    floyd_warshall(v, m)

    print("Shortest Distance Matrix (Floyd-Warshall):")
    print_matrix(m, v, inf)
