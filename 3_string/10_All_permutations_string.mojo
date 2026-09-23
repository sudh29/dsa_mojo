# All Permutations of a String
# Pattern: Backtracking / Permutation Recursion
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def permute_helper(self, mut chars: List[String], left: Int, right: Int, mut result: List[String]):
        if left == right:
            var p = String("")
            for i in range(len(chars)):
                p += chars[i]
            var exists = False
            for k in range(len(result)):
                if result[k] == p:
                    exists = True
                    break
            if not exists:
                result.append(p)
            return

        for i in range(left, right + 1):
            var t = chars[left]
            chars[left] = chars[i]
            chars[i] = t

            self.permute_helper(chars, left + 1, right, result)

            var t2 = chars[left]
            chars[left] = chars[i]
            chars[i] = t2

    def find_permutation(self, s: String) -> List[String]:
        var chars = List[String]()
        for i in range(s.byte_length()):
            chars.append(String(s[byte=i]))
        var result = List[String]()
        if len(chars) > 0:
            self.permute_helper(chars, 0, len(chars) - 1, result)
        return result^

def main():
    var sol = Solution()
    var s = String("ABC")
    print("String:", s)
    var perms = sol.find_permutation(s)
    print("All permutations:", end=" [")
    for i in range(len(perms)):
        print("\"" + perms[i] + "\"", end=", " if i < len(perms) - 1 else "")
    print("]")
