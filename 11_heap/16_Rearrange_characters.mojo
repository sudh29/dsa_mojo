# Rearrange characters in a string such that no two adjacent are same
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def rearrange_string(self, s: String) -> String:
        var n = s.byte_length()
        if n <= 1:
            return s

        var freq = List[Int]()
        for _ in range(26):
            freq.append(0)

        for i in range(n):
            var code = Int(s.as_bytes()[i]) - 97
            if code >= 0 and code < 26:
                freq[code] += 1

        var max_f = 0
        var max_c = 0
        for i in range(26):
            if freq[i] > max_f:
                max_f = freq[i]
                max_c = i

        if max_f > (n + 1) // 2:
            return "-1"

        var res = List[String]()
        for _ in range(n):
            res.append("")

        var idx = 0

        while freq[max_c] > 0:
            res[idx] = chr(97 + max_c)
            idx += 2
            freq[max_c] -= 1

        for c in range(26):
            while freq[c] > 0:
                if idx >= n:
                    idx = 1
                res[idx] = chr(97 + c)
                idx += 2
                freq[c] -= 1

        var output = String("")
        for i in range(n):
            output += res[i]

        return output^

def main():
    var sol = Solution()
    var s1 = String("geeksforgeeks")
    var s2 = String("bbbabaaacd")
    var s3 = String("bbbbb")

    print(s1, "-> Rearranged:", sol.rearrange_string(s1))
    print(s2, "-> Rearranged:", sol.rearrange_string(s2))
    print(s3, "-> Rearranged:", sol.rearrange_string(s3))
