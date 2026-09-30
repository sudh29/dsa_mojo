# Functions, Lists, and Recursion (Fibonacci)

def fib_rec(n: Int) -> Int:
    if n <= 0:
        return 0
    if n == 1 or n == 2:
        return 1
    return fib_rec(n - 1) + fib_rec(n - 2)

from std.testing import assert_equal

def main() raises:
    var ip = String("Enter the string  ")
    if ip.byte_length() < 6:
        print("true")
    else:
        print("False")

    var primes = List[Int]()
    primes.append(2)
    primes.append(3)
    primes.append(5)
    primes.append(7)
    primes.append(11)
    primes.append(13)
    primes.append(17)
    primes.append(19)
    print("Primes count:", len(primes))
    print("First prime:", primes[0])
    print("Last prime:", primes[len(primes) - 1])
    assert_equal(len(primes), 8)
    assert_equal(primes[0], 2)
    assert_equal(primes[7], 19)

    print("Fibonacci sequence:")
    for n in range(11):
        print(n, ":", fib_rec(n))

    assert_equal(fib_rec(0), 0)
    assert_equal(fib_rec(1), 1)
    assert_equal(fib_rec(2), 1)
    assert_equal(fib_rec(3), 2)
    assert_equal(fib_rec(6), 8)
    assert_equal(fib_rec(10), 55)
