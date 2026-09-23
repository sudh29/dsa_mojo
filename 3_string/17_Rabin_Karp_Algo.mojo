# Rabin-Karp Algorithm for Pattern Searching
# Pattern: Rolling Hash / String Matching
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def rabin_karp_search(self, text: String, pattern: String) -> List[Int]:
        var res = List[Int]()
        var n = text.byte_length()
        var m = pattern.byte_length()
        if m == 0 or m > n:
            return res^

        var t_bytes = text.as_bytes()
        var p_bytes = pattern.as_bytes()

        var prime = 101
        var d = 256
        var p_hash = 0
        var t_hash = 0
        var h = 1

        for _ in range(m - 1):
            h = (h * d) % prime

        for i in range(m):
            p_hash = (d * p_hash + Int(p_bytes[i])) % prime
            t_hash = (d * t_hash + Int(t_bytes[i])) % prime

        for i in range(n - m + 1):
            if p_hash == t_hash:
                var is_match = True
                for j in range(m):
                    if t_bytes[i + j] != p_bytes[j]:
                        is_match = False
                        break
                if is_match:
                    res.append(i)

            if i < n - m:
                t_hash = (d * (t_hash - Int(t_bytes[i]) * h) + Int(t_bytes[i + m])) % prime
                if t_hash < 0:
                    t_hash += prime

        return res^

def main():
    var sol = Solution()
    var text = String("geeksforgeeks")
    var pattern = String("geek")
    print("Text:", text, ", Pattern:", pattern)
    var matches = sol.rabin_karp_search(text, pattern)
    print("Pattern found at indices:", end=" [")
    for i in range(len(matches)):
        print(matches[i], end=", " if i < len(matches) - 1 else "")
    print("]")
