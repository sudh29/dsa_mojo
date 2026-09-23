# Functions, Lists, and Recursion (Fibonacci)

def fib_rec(n: Int) -> Int:
    if n <= 0:
        return 0
    if n == 1 or n == 2:
        return 1
    return fib_rec(n - 1) + fib_rec(n - 2)

def main():
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

    print("Fibonacci sequence:")
    for n in range(11):
        print(n, ":", fib_rec(n))
