# Converting Roman Numerals to Decimal
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def char_to_val(self, c: String) -> Int:
        if c == "I":
            return 1
        elif c == "V":
            return 5
        elif c == "X":
            return 10
        elif c == "L":
            return 50
        elif c == "C":
            return 100
        elif c == "D":
            return 500
        elif c == "M":
            return 1000
        return 0

    def roman_to_decimal(self, s: String) -> Int:
        var total = 0
        var n = s.byte_length()

        for i in range(n):
            var curr_val = self.char_to_val(String(s[byte=i]))
            if i + 1 < n and curr_val < self.char_to_val(String(s[byte=i + 1])):
                total -= curr_val
            else:
                total += curr_val

        return total

def main():
    var sol = Solution()
    var tests = List[String]()
    tests.append("III")
    tests.append("IV")
    tests.append("IX")
    tests.append("LVIII")
    tests.append("MCMXCIV")

    for i in range(len(tests)):
        var s = tests[i]
        print("Roman:", s, "-> Decimal:", sol.roman_to_decimal(s))
