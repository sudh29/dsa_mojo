# Boyer Moore Algorithm for Pattern Searching (Bad Character Heuristic)
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def bad_char_heuristic(self, pat: String, size: Int) -> List[Int]:
        var bad_char = List[Int]()
        for _ in range(256):
            bad_char.append(-1)

        var p_bytes = pat.as_bytes()
        for i in range(size):
            bad_char[Int(p_bytes[i])] = i

        return bad_char^

    def search_pattern(self, txt: String, pat: String) -> List[Int]:
        var occurrences = List[Int]()
        var m = pat.byte_length()
        var n = txt.byte_length()
        if m == 0 or m > n:
            return occurrences^

        var bad_char = self.bad_char_heuristic(pat, m)
        var p_bytes = pat.as_bytes()
        var t_bytes = txt.as_bytes()
        var s = 0

        while s <= (n - m):
            var j = m - 1

            while j >= 0 and p_bytes[j] == t_bytes[s + j]:
                j -= 1

            if j < 0:
                occurrences.append(s)
                if s + m < n:
                    var next_char_code = Int(t_bytes[s + m])
                    var shift = bad_char[next_char_code]
                    s += (m - shift)
                else:
                    s += 1
            else:
                var curr_char_code = Int(t_bytes[s + j])
                var shift = bad_char[curr_char_code]
                var step = j - shift
                if step < 1:
                    step = 1
                s += step

        return occurrences^

def main():
    var sol = Solution()
    var text = String("ABAAABCDABABCABAB")
    var pattern = String("ABC")

    print("Text:", text)
    print("Pattern:", pattern)

    var matches = sol.search_pattern(text, pattern)
    print("Pattern found at index positions:", end=" [")
    for i in range(len(matches)):
        print(matches[i], end=", " if i < len(matches) - 1 else "")
    print("]")
