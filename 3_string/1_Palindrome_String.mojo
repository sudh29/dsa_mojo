# Palindrome String Check
# Pattern: Two Pointer / Symmetry Check
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def is_palindrome(self, s: String) -> Bool:
        var n = s.byte_length()
        var bytes = s.as_bytes()
        for i in range(n // 2):
            if bytes[i] != bytes[n - i - 1]:
                return False
        return True

def main():
    var sol = Solution()
    var s1 = String("racecar")
    print("String:", s1, "-> Is palindrome:", sol.is_palindrome(s1))

    var s2 = String("abba")
    print("String:", s2, "-> Is palindrome:", sol.is_palindrome(s2))

    var s3 = String("hello")
    print("String:", s3, "-> Is palindrome:", sol.is_palindrome(s3))
