# Prime Number Check

def is_prime(n: Int) -> Bool:
    if n <= 1:
        return False
    if n == 2:
        return True
    if n % 2 == 0:
        return False
    var i = 3
    while i * i <= n:
        if n % i == 0:
            return False
        i += 2
    return True

def main():
    for n in range(1, 20):
        print("Is", n, "prime:", is_prime(n))
