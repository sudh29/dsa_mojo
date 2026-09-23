# Count Total Set Bits in all numbers from 1 to N
# Reference: https://mojolang.org/docs/manual/get-started/

def count_set_bits_up_to_n(n: Int) -> Int:
    var count = 0
    var i = 0

    while (1 << i) <= n:
        var cycle_len = 1 << (i + 1)
        var total_pairs = (n + 1) // cycle_len
        var remainder = (n + 1) % cycle_len

        var extra = remainder - (1 << i)
        if extra < 0:
            extra = 0

        count += total_pairs * (1 << i) + extra
        i += 1

    return count

def main():
    print("Total set bits from 1 to 4:", count_set_bits_up_to_n(4))
    print("Total set bits from 1 to 17:", count_set_bits_up_to_n(17))
