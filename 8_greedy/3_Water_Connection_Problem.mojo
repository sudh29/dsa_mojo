# Water Connection Problem
# Reference: https://mojolang.org/docs/manual/get-started/

struct Connection(ImplicitlyCopyable, Movable):
    var tank: Int
    var tap: Int
    var diameter: Int

    def __init__(out self, tank: Int, tap: Int, diameter: Int):
        self.tank = tank
        self.tap = tap
        self.diameter = diameter

    def __init__(out self, *, copy: Connection):
        self.tank = copy.tank
        self.tap = copy.tap
        self.diameter = copy.diameter

def solve_water_connection(
    n: Int,
    p: Int,
    a: List[Int],
    b: List[Int],
    d: List[Int]
) -> List[Connection]:
    var out_neighbor = List[Int]()
    var out_diameter = List[Int]()
    var in_degree = List[Int]()

    for _ in range(n + 1):
        out_neighbor.append(0)
        out_diameter.append(0)
        in_degree.append(0)

    for i in range(p):
        var u = a[i]
        var v = b[i]
        var dia = d[i]
        out_neighbor[u] = v
        out_diameter[u] = dia
        in_degree[v] += 1

    var results = List[Connection]()

    for i in range(1, n + 1):
        # House is a tank if it has outgoing pipe but no incoming pipe
        if in_degree[i] == 0 and out_neighbor[i] != 0:
            var curr = i
            var min_dia = 2147483647

            while out_neighbor[curr] != 0:
                if out_diameter[curr] < min_dia:
                    min_dia = out_diameter[curr]
                curr = out_neighbor[curr]

            results.append(Connection(i, curr, min_dia))

    return results^

def main():
    var n = 9
    var p = 6
    var a = List[Int](); a.append(7); a.append(5); a.append(4); a.append(2); a.append(9); a.append(3)
    var b = List[Int](); b.append(4); b.append(9); b.append(6); b.append(8); b.append(3); b.append(1)
    var d = List[Int](); d.append(98); d.append(72); d.append(10); d.append(22); d.append(17); d.append(66)

    var ans = solve_water_connection(n, p, a, b, d)
    print("Number of connections:", len(ans))
    for i in range(len(ans)):
        var c = ans[i]
        print("Tank:", c.tank, "-> Tap:", c.tap, "with min diameter:", c.diameter)
