# Count Ones in Binary Representations from 0 to N

def count_ones_dp(n: Int) -> List[Int]:
    var res = List[Int]()
    res.append(0)
    for i in range(1, n + 1):
        res.append(res[i // 2] + (i % 2))
    return res^

def count_ones_bits(n: Int) -> List[Int]:
    var res = List[Int]()
    for i in range(n + 1):
        var count = 0
        var val = i
        while val > 0:
            count += val & 1
            val >>= 1
        res.append(count)
    return res^

def main():
    var n = 5
    var res1 = count_ones_bits(n)
    var res2 = count_ones_dp(n)
    print("Bitwise method:")
    for i in range(len(res1)):
        print(res1[i], end=" ")
    print()
    print("DP method:")
    for i in range(len(res2)):
        print(res2[i], end=" ")
    print()
