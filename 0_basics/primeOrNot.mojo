"""Tests whether an integer is prime using trial division.

Complexity:
  - Time Complexity: O(sqrt(N))
  - Space Complexity: O(1)
"""

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

from std.testing import assert_true, assert_false

def main() raises:
    for n in range(1, 20):
        print("Is", n, "prime:", is_prime(n))
    assert_false(is_prime(1))
    assert_true(is_prime(2))
    assert_true(is_prime(3))
    assert_false(is_prime(4))
    assert_true(is_prime(17))
    assert_false(is_prime(18))
    assert_true(is_prime(19))
