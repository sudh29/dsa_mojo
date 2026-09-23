# First non-repeating character in a stream using Queue and frequency array
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def first_non_repeating(self, a: String) -> String:
        var count = List[Int]()
        for _ in range(26):
            count.append(0)

        var q = List[String]()
        var q_head = 0
        var ans = String("")

        for i in range(a.byte_length()):
            var ch = String(a[byte=i])
            var code = Int(a.as_bytes()[i]) - 97

            if code >= 0 and code < 26:
                count[code] += 1
                q.append(ch)

                while q_head < len(q):
                    var front_code = Int(q[q_head].as_bytes()[0]) - 97
                    if count[front_code] > 1:
                        q_head += 1
                    else:
                        ans += q[q_head]
                        break

                if q_head >= len(q):
                    ans += "#"

        return ans^

def main():
    var sol = Solution()
    var s1 = String("aabcc")
    var s2 = String("zz")

    print("Input:", s1, "-> Output:", sol.first_non_repeating(s1))
    print("Input:", s2, "-> Output:", sol.first_non_repeating(s2))
