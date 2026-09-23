# Pattern Searching (Substring Index Finder)
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def strstr(self, text: String, pattern: String) -> Int:
        var m = pattern.byte_length()
        var n = text.byte_length()

        if m == 0:
            return 0
        if m > n:
            return -1

        var t_bytes = text.as_bytes()
        var p_bytes = pattern.as_bytes()

        for i in range(n - m + 1):
            var is_match = True
            for j in range(m):
                if t_bytes[i + j] != p_bytes[j]:
                    is_match = False
                    break
            if is_match:
                return i

        return -1

def main():
    var sol = Solution()
    var text = String("aaaaaabc")
    var p1 = String("abc")
    var p2 = String("xyz")

    print("Text:", text)
    print("Pattern 1 '", p1, "' found at index:", sol.strstr(text, p1))
    print("Pattern 2 '", p2, "' found at index:", sol.strstr(text, p2))
