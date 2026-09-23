# Find Position of the Only Set Bit
# Reference: https://mojolang.org/docs/manual/get-started/

def find_position_of_set_bit(n: Int) -> Int:
    if n <= 0:
        return -1

    # Check if power of two (has exactly 1 set bit)
    if (n & (n - 1)) != 0:
        return -1

    var pos = 1
    var temp = n
    while (temp & 1) == 0:
        temp >>= 1
        pos += 1

    return pos

def main():
    print("Position of set bit in 2 (10):", find_position_of_set_bit(2))
    print("Position of set bit in 5 (101):", find_position_of_set_bit(5))
    print("Position of set bit in 8 (1000):", find_position_of_set_bit(8))
    print("Position of set bit in 16 (10000):", find_position_of_set_bit(16))
