# Check if Strings are Rotations of Each Other
# Pattern: String Concatenation & Substring Search
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def is_substring(self, text: String, pattern: String) -> Bool:
        var n = text.byte_length()
        var m = pattern.byte_length()
        if m == 0:
            return True
        if m > n:
            return False

        var t_bytes = text.as_bytes()
        var p_bytes = pattern.as_bytes()
        for i in range(n - m + 1):
            var is_match = True
            for j in range(m):
                if t_bytes[i + j] != p_bytes[j]:
                    is_match = False
                    break
            if is_match:
                return True
        return False

    def are_rotations(self, s1: String, s2: String) -> Bool:
        if s1.byte_length() != s2.byte_length():
            return False
        var doubled = s1 + s1
        return self.is_substring(doubled, s2)

def main():
    var sol = Solution()
    var s1 = String("ABCD")
    var s2 = String("CDAB")
    print("s1:", s1, ", s2:", s2)
    print("Are rotations:", sol.are_rotations(s1, s2))

    var s3 = String("ABCD")
    var s4 = String("ACBD")
    print("s3:", s3, ", s4:", s4)
    print("Are rotations:", sol.are_rotations(s3, s4))
