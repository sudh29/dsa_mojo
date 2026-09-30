# Number of 1 Bits (Set Bits Count)
# Reference: https://mojolang.org/docs/manual/get-started/

def set_bits(n: Int) -> Int:
    var count = 0
    var temp = n
    while temp > 0:
        temp = temp & (temp - 1)
        count += 1
    return count

from std.testing import assert_equal

def main() raises:
    var ans1 = set_bits(6)
    print("Set bits in 6 (110):", ans1)
    assert_equal(ans1, 2)

    var ans2 = set_bits(13)
    print("Set bits in 13 (1101):", ans2)
    assert_equal(ans2, 3)

    var ans3 = set_bits(31)
    print("Set bits in 31 (11111):", ans3)
    assert_equal(ans3, 5)
