# Division without using *, /, and % Operators
# Reference: https://mojolang.org/docs/manual/get-started/

def divide_integers(dividend: Int, divisor: Int) -> Int:
    if divisor == 0:
        return 2147483647

    var sign = -1 if ((dividend < 0) ^ (divisor < 0)) else 1

    var a = dividend if dividend >= 0 else -dividend
    var b = divisor if divisor >= 0 else -divisor

    var quotient = 0
    var temp = 0

    for i in range(31, -1, -1):
        if (temp + (b << i)) <= a and (b << i) > 0:
            temp += b << i
            quotient |= (1 << i)

    return -quotient if sign == -1 else quotient

def main():
    print("10 / 3 =", divide_integers(10, 3))
    print("43 / -8 =", divide_integers(43, -8))
    print("-22 / -7 =", divide_integers(-22, -7))
