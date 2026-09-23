# Count and Say Problem
# Pattern: Run-Length Encoding / Simulation
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def run_length_encode(self, s: String) -> String:
        var res = String("")
        var n = s.byte_length()
        if n == 0:
            return res^

        var count = 1
        var curr_char = String(s[byte=0])

        for i in range(1, n):
            var ch = String(s[byte=i])
            if ch == curr_char:
                count += 1
            else:
                res += String(count) + curr_char
                curr_char = ch
                count = 1

        res += String(count) + curr_char
        return res^

    def count_and_say(self, n: Int) -> String:
        var current = String("1")
        for _ in range(n - 1):
            current = self.run_length_encode(current)
        return current

def main():
    var sol = Solution()
    for i in range(1, 6):
        print("Count and Say (", i, "):", sol.count_and_say(i))
