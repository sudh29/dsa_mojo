# System details and Digit Sum

def sum_digits(mut n: Int) -> Int:
    var sum_val = 0
    if n < 0:
        n = -n
    while n > 0:
        sum_val += n % 10
        n //= 10
    return sum_val

def main():
    var x = 54643121
    print("Number:", x)
    print("Sum of digits:", sum_digits(x))
    print("System Int word size (bytes):", 8)
    print("System Int word size (bits):", 64)
