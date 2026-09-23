# Maximize Array Sum After K Negations
# Reference: https://mojolang.org/docs/manual/get-started/

def maximize_sum(mut a: List[Int], k: Int) -> Int:
    var n = len(a)
    var remaining_k = k

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

    # Negate negative numbers
    var idx = 0
    while idx < n and remaining_k > 0 and a[idx] < 0:
        a[idx] = -a[idx]
        remaining_k -= 1
        idx += 1

    # If remaining_k is odd, find minimum absolute element and negate it
    if remaining_k % 2 != 0:
        var min_abs_idx = 0
        var min_abs = a[0] if a[0] >= 0 else -a[0]
        for i in range(1, n):
            var abs_val = a[i] if a[i] >= 0 else -a[i]
            if abs_val < min_abs:
                min_abs = abs_val
                min_abs_idx = i
        a[min_abs_idx] = -a[min_abs_idx]

    var total_sum = 0
    for i in range(n):
        total_sum += a[i]

    return total_sum

def main():
    var a = List[Int]()
    a.append(1)
    a.append(2)
    a.append(-3)
    a.append(4)
    a.append(5)

    var k = 1
    print("Max sum with k=1:", maximize_sum(a, k))

    var b = List[Int]()
    b.append(5)
    b.append(-2)
    b.append(5)
    b.append(-4)
    b.append(5)
    b.append(-12)
    b.append(5)
    b.append(5)
    b.append(5)
    b.append(20)

    var k2 = 5
    print("Max sum with k=5:", maximize_sum(b, k2))
