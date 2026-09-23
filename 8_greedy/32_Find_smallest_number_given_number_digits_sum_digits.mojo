# Find Smallest Number with Given Number of Digits and Sum of Digits
# Reference: https://mojolang.org/docs/manual/get-started/

def smallest_number(s: Int, d: Int) -> String:
    if 9 * d < s or s == 0:
        if s == 0 and d == 1:
            return "0"
        return "-1"

    var digits = List[Int]()
    for _ in range(d):
        digits.append(0)

    # Reserve 1 for the first digit if d > 1
    var remaining_sum = s - 1

    for i in range(d - 1, 0, -1):
        if remaining_sum >= 9:
            digits[i] = 9
            remaining_sum -= 9
        else:
            digits[i] = remaining_sum
            remaining_sum = 0

    digits[0] = remaining_sum + 1

    var res = ""
    for i in range(d):
        res += chr(digits[i] + ord('0'))

    return res^

def main():
    print("Smallest number with S=9, D=2:", smallest_number(9, 2))
    print("Smallest number with S=20, D=3:", smallest_number(20, 3))
    print("Smallest number with S=25, D=2:", smallest_number(25, 2))
