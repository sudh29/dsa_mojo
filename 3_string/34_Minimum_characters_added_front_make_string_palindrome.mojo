# Minimum characters to be added at front to make string palindrome (KMP LPS algorithm)
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def reverse_str(self, s: String) -> String:
        var res = String("")
        var n = s.byte_length()
        for i in range(n - 1, -1, -1):
            res += s[byte=i]
        return res^

    def compute_lps(self, s: String) -> List[Int]:
        var n = s.byte_length()
        var lps = List[Int]()
        for _ in range(n):
            lps.append(0)

        var length = 0
        var i = 1
        var bytes = s.as_bytes()

        while i < n:
            if bytes[i] == bytes[length]:
                length += 1
                lps[i] = length
                i += 1
            else:
                if length != 0:
                    length = lps[length - 1]
                else:
                    lps[i] = 0
                    i += 1

        return lps^

    def min_char_added(self, s: String) -> Int:
        var rev = self.reverse_str(s)
        var augmented = s + "$" + rev
        var lps = self.compute_lps(augmented)
        var longest_palindromic_prefix_len = lps[augmented.byte_length() - 1]
        return s.byte_length() - longest_palindromic_prefix_len

def main():
    var sol = Solution()
    var s1 = String("ABC")
    var s2 = String("AACECAAAA")
    var s3 = String("ABCD")

    print("String:", s1, "-> Min chars added at front:", sol.min_char_added(s1))
    print("String:", s2, "-> Min chars added at front:", sol.min_char_added(s2))
    print("String:", s3, "-> Min chars added at front:", sol.min_char_added(s3))
