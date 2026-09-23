# Reverse a String using Stack
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def reverse_string(self, s: String) -> String:
        var stack = List[String]()
        for i in range(s.byte_length()):
            stack.append(String(s[byte=i]))

        var reversed_s = String("")
        while len(stack) > 0:
            var ch = stack[len(stack) - 1]
            _ = stack.pop()
            reversed_s += ch

        return reversed_s

def main():
    var sol = Solution()
    var s1 = String("GeeksforGeeks")
    var s2 = String("MojoLanguage")

    print("Original:", s1, "-> Reversed:", sol.reverse_string(s1))
    print("Original:", s2, "-> Reversed:", sol.reverse_string(s2))
