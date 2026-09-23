# Reverse a String
# Pattern: Two Pointer / In-place Swapping
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def reverse_string(self, mut s: List[String]):
        var n = len(s)
        for i in range(n // 2):
            var temp = s[i]
            s[i] = s[n - i - 1]
            s[n - i - 1] = temp

    def reverse(self, s: String) -> String:
        var chars = List[String]()
        for i in range(s.byte_length()):
            chars.append(String(s[byte=i]))
        self.reverse_string(chars)
        var res = String("")
        for i in range(len(chars)):
            res += chars[i]
        return res^

def main():
    var sol = Solution()
    var s = String("hello")
    print("Original string:", s)
    print("Reversed string:", sol.reverse(s))

    var chars = List[String]()
    chars.append("h"); chars.append("e"); chars.append("l"); chars.append("l"); chars.append("o")
    sol.reverse_string(chars)
    print("Reversed char list:", end=" [")
    for i in range(len(chars)):
        print("\"" + chars[i] + "\"", end=", " if i < len(chars) - 1 else "")
    print("]")
