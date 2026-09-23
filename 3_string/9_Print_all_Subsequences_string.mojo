# Print All Subsequences of a String
# Pattern: Recursion / Backtracking
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def generate_subsequences(self, s: String, index: Int, current: String, mut result: List[String]):
        if index == s.byte_length():
            if current.byte_length() > 0:
                result.append(current)
            return

        # Include current character
        self.generate_subsequences(s, index + 1, current + s[byte=index], result)
        # Exclude current character
        self.generate_subsequences(s, index + 1, current, result)

    def all_subsequences(self, s: String) -> List[String]:
        var result = List[String]()
        self.generate_subsequences(s, 0, String(""), result)
        return result^

def main():
    var sol = Solution()
    var s = String("abc")
    print("String:", s)
    var subs = sol.all_subsequences(s)
    print("All subsequences:", end=" [")
    for i in range(len(subs)):
        print("\"" + subs[i] + "\"", end=", " if i < len(subs) - 1 else "")
    print("]")
