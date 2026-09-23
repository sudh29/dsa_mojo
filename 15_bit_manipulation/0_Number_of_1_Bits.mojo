# Number of 1 Bits (Set Bits Count)
# Reference: https://mojolang.org/docs/manual/get-started/

def set_bits(n: Int) -> Int:
    var count = 0
    var temp = n
    while temp > 0:
        temp = temp & (temp - 1)
        count += 1
    return count

def main():
    print("Set bits in 6 (110):", set_bits(6))
    print("Set bits in 13 (1101):", set_bits(13))
    print("Set bits in 31 (11111):", set_bits(31))
