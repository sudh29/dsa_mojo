# Smallest Subset with Sum Greater Than All Other Elements
# Reference: https://mojolang.org/docs/manual/get-started/

def min_subset(mut a: List[Int]) -> Int:
    var n = len(a)
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

    var total_sum = 0
    for i in range(n):
        total_sum += a[i]

    var subset_sum = 0
    var count = 0

    for i in range(n - 1, -1, -1):
        subset_sum += a[i]
        total_sum -= a[i]
        count += 1
        if subset_sum > total_sum:
            return count

    return count

def main():
    var a = List[Int]()
    a.append(2)
    a.append(17)
    a.append(7)
    a.append(3)

    print("Smallest subset size:", min_subset(a))

    var b = List[Int]()
    b.append(20)
    b.append(12)
    b.append(18)
    b.append(4)
    print("Smallest subset size 2:", min_subset(b))
