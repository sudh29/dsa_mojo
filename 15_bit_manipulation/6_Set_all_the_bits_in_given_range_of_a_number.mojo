# Set all the Bits in Given Range [L, R] of a Number
# Reference: https://mojolang.org/docs/manual/get-started/

def set_all_range_bits(n: Int, l: Int, r: Int) -> Int:
    var mask = 0
    for i in range(l, r + 1):
        mask |= (1 << (i - 1))
    return n | mask

def main():
    # N = 17 (10001), L = 2, R = 3 -> bits 2 and 3 set -> 10111 = 23
    print("Set bits in 17 for range [2, 3]:", set_all_range_bits(17, 2, 3))
    # N = 8 (1000), L = 1, R = 2 -> bits 1 and 2 set -> 1011 = 11
    print("Set bits in 8 for range [1, 2]:", set_all_range_bits(8, 1, 2))
