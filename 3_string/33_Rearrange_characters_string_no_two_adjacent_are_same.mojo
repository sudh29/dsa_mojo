# Rearrange characters in a string such that no two adjacent are same
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def rearrange_string(self, s: String) -> String:
        var n = s.byte_length()
        if n <= 1:
            return s

        # Frequency array for ASCII characters
        var freq = List[Int]()
        for _ in range(256):
            freq.append(0)

        var bytes = s.as_bytes()
        for i in range(n):
            var code = Int(bytes[i])
            freq[code] += 1

        # Check maximum frequency
        var max_f = 0
        var max_char_code = 0
        for i in range(256):
            if freq[i] > max_f:
                max_f = freq[i]
                max_char_code = i

        # If highest frequency is more than half (rounded up), impossible
        if max_f > (n + 1) // 2:
            return "-1"

        # Fill characters: place highest frequency char at even indices first
        var res = List[String]()
        for _ in range(n):
            res.append("")

        var idx = 0

        # Place the most frequent character
        while freq[max_char_code] > 0:
            res[idx] = chr(max_char_code)
            idx += 2
            freq[max_char_code] -= 1

        # Place remaining characters
        for c in range(256):
            while freq[c] > 0:
                if idx >= n:
                    idx = 1
                res[idx] = chr(c)
                idx += 2
                freq[c] -= 1

        var output = String("")
        for i in range(n):
            output += res[i]

        return output^

def main():
    var sol = Solution()
    var s1 = String("aaabc")
    var s2 = String("aaabb")
    var s3 = String("baaba")

    print("String:", s1, "-> Rearranged:", sol.rearrange_string(s1))
    print("String:", s2, "-> Rearranged:", sol.rearrange_string(s2))
    print("String:", s3, "-> Rearranged:", sol.rearrange_string(s3))
