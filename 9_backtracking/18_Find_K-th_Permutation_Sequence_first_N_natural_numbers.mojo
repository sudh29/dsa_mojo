# Find K-th Permutation Sequence of First N Natural Numbers
# Reference: https://mojolang.org/docs/manual/get-started/

def factorial(n: Int) -> Int:
    var res = 1
    for i in range(2, n + 1):
        res *= i
    return res^

def kth_permutation(n: Int, k: Int) -> String:
    var nums = List[Int]()
    for i in range(1, n + 1):
        nums.append(i)

    var current_k = k - 1
    var res = ""
    var remaining_n = n

    while remaining_n > 0:
        var fact = factorial(remaining_n - 1)
        var index = current_k // fact
        var val = nums.pop(index)
        res += chr(val + ord('0'))
        current_k %= fact
        remaining_n -= 1

    return res^

def main():
    # For N=3, K=3: permutations are 123, 132, 213, 231, 312, 321 -> 213
    print("3rd permutation for N=3:", kth_permutation(3, 3))
    print("4th permutation for N=4:", kth_permutation(4, 4))
