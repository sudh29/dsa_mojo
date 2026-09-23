# Longest Palindrome in a String
# Pattern: Expand Around Center / Two Pointer
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def expand_around_center(self, s: String, left_idx: Int, right_idx: Int) -> Tuple[Int, Int]:
        var l = left_idx
        var r = right_idx
        var n = s.byte_length()
        var bytes = s.as_bytes()
        while l >= 0 and r < n and bytes[l] == bytes[r]:
            l -= 1
            r += 1
        return (l + 1, r - l - 1)

    def longest_palindrome(self, s: String) -> String:
        var n = s.byte_length()
        if n <= 1:
            return s

        var start = 0
        var max_len = 1

        for i in range(n):
            # Odd length palindromes
            var odd = self.expand_around_center(s, i, i)
            if odd[1] > max_len:
                start = odd[0]
                max_len = odd[1]

            # Even length palindromes
            var even = self.expand_around_center(s, i, i + 1)
            if even[1] > max_len:
                start = even[0]
                max_len = even[1]

        var res = String("")
        for k in range(start, start + max_len):
            res += s[byte=k]
        return res^

def main():
    var sol = Solution()
    var s1 = String("babad")
    print("String:", s1, "-> Longest palindrome:", sol.longest_palindrome(s1))

    var s2 = String("cbbd")
    print("String:", s2, "-> Longest palindrome:", sol.longest_palindrome(s2))

    var s3 = String("aaaabbaa")
    print("String:", s3, "-> Longest palindrome:", sol.longest_palindrome(s3))
