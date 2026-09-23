# Split Binary String into Substrings with Equal 0s and 1s
# Pattern: Greedy / Counter Balance
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def max_substr(self, s: String) -> Int:
        var c0 = 0
        var c1 = 0
        var count = 0
        var bytes = s.as_bytes()

        for i in range(s.byte_length()):
            if bytes[i] == 48:
                c0 += 1
            elif bytes[i] == 49:
                c1 += 1

            if c0 == c1:
                count += 1

        if c0 != c1:
            return -1
        return count

def main():
    var sol = Solution()
    var s1 = String("0100110101")
    print("String:", s1, "-> Max balanced substrings:", sol.max_substr(s1))

    var s2 = String("0111100010")
    print("String:", s2, "-> Max balanced substrings:", sol.max_substr(s2))

    var s3 = String("0000111")
    print("String:", s3, "-> Max balanced substrings:", sol.max_substr(s3))
