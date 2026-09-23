# Bit Difference (Count Bits to Flip to Convert A to B)
# Reference: https://mojolang.org/docs/manual/get-started/

def count_bits_flip(a: Int, b: Int) -> Int:
    var xor_val = a ^ b
    var count = 0
    while xor_val > 0:
        xor_val = xor_val & (xor_val - 1)
        count += 1
    return count

def main():
    print("Bits to flip 10 (1010) to 20 (10100):", count_bits_flip(10, 20))
    print("Bits to flip 20 to 25:", count_bits_flip(20, 25))
