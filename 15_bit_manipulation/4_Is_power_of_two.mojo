# Check if a Number is Power of Two
# Reference: https://mojolang.org/docs/manual/get-started/

def is_power_of_two(n: Int) -> Bool:
    if n <= 0:
        return False
    return (n & (n - 1)) == 0

def main():
    print("Is 1 power of two:", is_power_of_two(1))
    print("Is 2 power of two:", is_power_of_two(2))
    print("Is 16 power of two:", is_power_of_two(16))
    print("Is 18 power of two:", is_power_of_two(18))
    print("Is 0 power of two:", is_power_of_two(0))
