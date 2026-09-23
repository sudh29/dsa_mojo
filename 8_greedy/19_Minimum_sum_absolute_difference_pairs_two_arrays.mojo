# Minimum Sum of Absolute Difference of Pairs of Two Arrays
# Reference: https://mojolang.org/docs/manual/get-started/

def find_min_sum(mut a: List[Int], mut b: List[Int]) -> Int:
    var n = len(a)
    # Sort A ascending
    for i in range(n):
        var min_idx = i
        for j in range(i + 1, n):
            if a[j] < a[min_idx]:
                min_idx = j
        if min_idx != i:
            var tmp = a[i]
            a[i] = a[min_idx]
            a[min_idx] = tmp

    # Sort B ascending
    for i in range(n):
        var min_idx = i
        for j in range(i + 1, n):
            if b[j] < b[min_idx]:
                min_idx = j
        if min_idx != i:
            var tmp = b[i]
            b[i] = b[min_idx]
            b[min_idx] = tmp

    var total_diff = 0
    for i in range(n):
        var diff = a[i] - b[i]
        total_diff += diff if diff >= 0 else -diff

    return total_diff

def main():
    var a = List[Int]()
    a.append(4)
    a.append(1)
    a.append(8)
    a.append(7)

    var b = List[Int]()
    b.append(2)
    b.append(3)
    b.append(6)
    b.append(5)

    print("Minimum sum of absolute differences:", find_min_sum(a, b))
