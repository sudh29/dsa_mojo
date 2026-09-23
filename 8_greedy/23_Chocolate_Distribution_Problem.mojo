# Chocolate Distribution Problem
# Reference: https://mojolang.org/docs/manual/get-started/

def find_min_diff(mut a: List[Int], n: Int, m: Int) -> Int:
    if m == 0 or n == 0 or m > n:
        return 0

    # Sort array ascending
    for i in range(n):
        var min_idx = i
        for j in range(i + 1, n):
            if a[j] < a[min_idx]:
                min_idx = j
        if min_idx != i:
            var tmp = a[i]
            a[i] = a[min_idx]
            a[min_idx] = tmp

    var min_diff = 2147483647
    for i in range(n - m + 1):
        var diff = a[i + m - 1] - a[i]
        if diff < min_diff:
            min_diff = diff

    return min_diff

def main():
    var a = List[Int]()
    a.append(3)
    a.append(4)
    a.append(1)
    a.append(9)
    a.append(56)
    a.append(7)
    a.append(9)
    a.append(12)

    var m = 5
    print("Minimum difference for", m, "students:", find_min_diff(a, len(a), m))

    var b = List[Int]()
    b.append(7)
    b.append(3)
    b.append(2)
    b.append(4)
    b.append(9)
    b.append(12)
    b.append(56)

    var m2 = 3
    print("Minimum difference for", m2, "students:", find_min_diff(b, len(b), m2))
