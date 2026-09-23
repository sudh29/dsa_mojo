# Permutation Coefficient Problem (P(n, k) % MOD)
# Reference: https://mojolang.org/docs/manual/get-started/

def permutation_coeff(n: Int, k: Int) -> Int:
    if k > n:
        return 0

    var mod = 1000000007
    var result = 1

    for i in range(k):
        result = (result * (n - i)) % mod

    return result

def main():
    print("P(10, 2):", permutation_coeff(10, 2))
    print("P(10, 3):", permutation_coeff(10, 3))
    print("P(10, 0):", permutation_coeff(10, 0))
