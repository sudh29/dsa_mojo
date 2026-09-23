# Parenthesis Checker: Check if brackets (), {}, [] are balanced
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def is_balanced(self, s: String) -> Bool:
        var stack = List[String]()

        for i in range(s.byte_length()):
            var ch = String(s[byte=i])

            if ch == "(" or ch == "{" or ch == "[":
                stack.append(ch)
            elif ch == ")" or ch == "}" or ch == "]":
                if len(stack) == 0:
                    return False

                var top_ch = stack[len(stack) - 1]
                _ = stack.pop()

                if ch == ")" and top_ch != "(":
                    return False
                if ch == "}" and top_ch != "{":
                    return False
                if ch == "]" and top_ch != "[":
                    return False

        return len(stack) == 0

def main():
    var sol = Solution()
    var s1 = String("{([])}")
    var s2 = String("()")
    var s3 = String("([]")
    var s4 = String("([)]")

    print(s1, "-> Balanced?", sol.is_balanced(s1))
    print(s2, "-> Balanced?", sol.is_balanced(s2))
    print(s3, "-> Balanced?", sol.is_balanced(s3))
    print(s4, "-> Balanced?", sol.is_balanced(s4))
