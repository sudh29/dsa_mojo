# Knuth-Morris-Pratt (KMP) Algorithm
# Pattern: Longest Prefix Suffix (LPS) Array / Linear String Search
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def compute_lps_array(self, pattern: String) -> List[Int]:
        var m = pattern.byte_length()
        var lps = List[Int]()
        for _ in range(m):
            lps.append(0)

        var length = 0
        var i = 1
        var p_bytes = pattern.as_bytes()

        while i < m:
            if p_bytes[i] == p_bytes[length]:
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

    def kmp_search(self, text: String, pattern: String) -> List[Int]:
        var matches = List[Int]()
        var n = text.byte_length()
        var m = pattern.byte_length()
        if m == 0 or m > n:
            return matches^

        var lps = self.compute_lps_array(pattern)
        var i = 0
        var j = 0
        var p_bytes = pattern.as_bytes()
        var t_bytes = text.as_bytes()

        while i < n:
            if p_bytes[j] == t_bytes[i]:
                i += 1
                j += 1

            if j == m:
                matches.append(i - j)
                j = lps[j - 1]
            elif i < n and p_bytes[j] != t_bytes[i]:
                if j != 0:
                    j = lps[j - 1]
                else:
                    i += 1

        return matches^

def main():
    var sol = Solution()
    var text = String("ABABDABACDABABCABAB")
    var pattern = String("ABABCABAB")
    print("Text:", text)
    print("Pattern:", pattern)

    var lps = sol.compute_lps_array(pattern)
    print("LPS Array:", end=" [")
    for k in range(len(lps)):
        print(lps[k], end=", " if k < len(lps) - 1 else "")
    print("]")

    var matches = sol.kmp_search(text, pattern)
    print("Pattern found at indices:", end=" [")
    for k in range(len(matches)):
        print(matches[k], end=", " if k < len(matches) - 1 else "")
    print("]")
