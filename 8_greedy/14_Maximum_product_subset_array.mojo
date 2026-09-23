# Maximum Product Subset of an Array
# Reference: https://mojolang.org/docs/manual/get-started/

def find_max_product(a: List[Int]) -> Int:
    var n = len(a)
    if n == 1:
        return a[0]

    var mod = 1000000007
    var zero_count = 0
    var neg_count = 0
    var max_neg = -2147483648
    var prod = 1

    for i in range(n):
        if a[i] == 0:
            zero_count += 1
            continue
        if a[i] < 0:
            neg_count += 1
            if a[i] > max_neg:
                max_neg = a[i]

    # Special case: all zeroes, or 1 negative and rest zeroes
    if zero_count == n or (neg_count == 1 and zero_count + 1 == n):
        return 0

    var skip_neg = (neg_count % 2 != 0)
    var skipped = False

    for i in range(n):
        if a[i] == 0:
            continue
        if skip_neg and a[i] == max_neg and not skipped:
            skipped = True
            continue
        prod = (prod * a[i]) % mod

    if prod < 0:
        prod = (prod + mod) % mod

    return prod

def main():
    var a = List[Int]()
    a.append(-1)
    a.append(-1)
    a.append(-2)
    a.append(4)
    a.append(3)

    print("Max product subset:", find_max_product(a))

    var b = List[Int]()
    b.append(-1)
    b.append(0)
    print("Max product subset ([-1, 0]):", find_max_product(b))
