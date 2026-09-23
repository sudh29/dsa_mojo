# Remove Consecutive Duplicate Characters
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def remove_consecutive_character(self, s: String) -> String:
        var n = s.byte_length()
        if n <= 1:
            return s

        var bytes = s.as_bytes()
        var result = String("")
        result += s[byte=0]
        for i in range(1, n):
            if bytes[i] != bytes[i - 1]:
                result += s[byte=i]

        return result^

def main():
    var sol = Solution()
    var s1 = String("aabb")
    var s2 = String("aabaa")
    var s3 = String("geeksforgeeks")

    print("String:", s1, "-> Without consecutive duplicates:", sol.remove_consecutive_character(s1))
    print("String:", s2, "-> Without consecutive duplicates:", sol.remove_consecutive_character(s2))
    print("String:", s3, "-> Without consecutive duplicates:", sol.remove_consecutive_character(s3))
