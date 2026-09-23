# Factorials of Large Numbers
# Pattern: Big Integer Multiplication Simulation
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def factorial(self, n: Int) -> List[Int]:
        var res = List[Int]()
        res.append(1)

        for x in range(2, n + 1):
            var carry = 0
            for i in range(len(res)):
                var prod = res[i] * x + carry
                res[i] = prod % 10
                carry = prod // 10
            while carry > 0:
                res.append(carry % 10)
                carry //= 10

        # Reverse digits to get most-significant first
        var left = 0
        var right = len(res) - 1
        while left < right:
            var temp = res[left]
            res[left] = res[right]
            res[right] = temp
            left += 1
            right -= 1

        return res^

def main():
    var sol = Solution()
    var n = 10
    var digits = sol.factorial(n)
    print("Factorial of", n, "is:", end=" ")
    for i in range(len(digits)):
        print(digits[i], end="")
    print()

    var n2 = 20
    var digits2 = sol.factorial(n2)
    print("Factorial of", n2, "is:", end=" ")
    for i in range(len(digits2)):
        print(digits2[i], end="")
    print()
