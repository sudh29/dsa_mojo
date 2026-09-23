# Evaluation of Postfix Expression using Stack
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def evaluate_postfix(self, s: String) -> Int:
        var stack = List[Int]()

        for i in range(s.byte_length()):
            var ch = s[byte=i]

            if ch == "+" or ch == "-" or ch == "*" or ch == "/":
                if len(stack) < 2:
                    return 0

                var a = stack[len(stack) - 1]
                _ = stack.pop()
                var b = stack[len(stack) - 1]
                _ = stack.pop()

                var res = 0
                if ch == "+":
                    res = b + a
                elif ch == "-":
                    res = b - a
                elif ch == "*":
                    res = b * a
                elif ch == "/":
                    res = b // a

                stack.append(res)
            else:
                # Character is a digit
                var digit = Int(s.as_bytes()[i]) - 48
                if digit >= 0 and digit <= 9:
                    stack.append(digit)

        if len(stack) > 0:
            return stack[len(stack) - 1]

        return 0

def main():
    var sol = Solution()
    var exp1 = String("231*+9-")
    var exp2 = String("123+*8-")

    print("Postfix Expression:", exp1, "-> Evaluated:", sol.evaluate_postfix(exp1))
    print("Postfix Expression:", exp2, "-> Evaluated:", sol.evaluate_postfix(exp2))
