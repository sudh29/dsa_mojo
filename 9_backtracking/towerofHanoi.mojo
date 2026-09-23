# Tower of Hanoi using Recursion
# Reference: https://mojolang.org/docs/manual/get-started/

def tower_of_hanoi(n: Int, from_rod: String, to_rod: String, aux_rod: String):
    if n == 1:
        print("Move disk 1 from", from_rod, "to", to_rod)
        return

    tower_of_hanoi(n - 1, from_rod, aux_rod, to_rod)
    print("Move disk", n, "from", from_rod, "to", to_rod)
    tower_of_hanoi(n - 1, aux_rod, to_rod, from_rod)

def main():
    var n = 3
    print("Tower of Hanoi steps for", n, "disks:")
    tower_of_hanoi(n, "A", "C", "B")
