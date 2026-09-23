# Calculate Square of a Number without Using * or pow
# Reference: https://mojolang.org/docs/manual/get-started/

def square(n: Int) -> Int:
    if n == 0:
        return 0

    var val = n if n >= 0 else -n

    var x = val >> 1
    if (val & 1) != 0:
        return (square(x) << 2) + (x << 2) + 1
    else:
        return square(x) << 2

def main():
    print("Square of 5:", square(5))
    print("Square of 7:", square(7))
    print("Square of -12:", square(-12))
    print("Square of 15:", square(15))
