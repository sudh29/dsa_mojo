# Balanced Parentheses Problem
# Pattern: Stack Matching / Expression Validation
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def is_par(self, s: String) -> Bool:
        var stack = List[String]()
        for i in range(s.byte_length()):
            var ch = String(s[byte=i])
            if ch == "{" or ch == "[" or ch == "(":
                stack.append(ch)
            else:
                if len(stack) == 0:
                    return False
                var top = stack[len(stack) - 1]
                _ = stack.pop(len(stack) - 1)
                if ch == "}" and top != "{":
                    return False
                if ch == "]" and top != "[":
                    return False
                if ch == ")" and top != "(":
                    return False

        return len(stack) == 0

def main():
    var sol = Solution()
    var s1 = String("{([])}")
    print("Expression 1:", s1, "-> Balanced:", sol.is_par(s1))

    var s2 = String("()")
    print("Expression 2:", s2, "-> Balanced:", sol.is_par(s2))

    var s3 = String("([]")
    print("Expression 3:", s3, "-> Balanced:", sol.is_par(s3))
