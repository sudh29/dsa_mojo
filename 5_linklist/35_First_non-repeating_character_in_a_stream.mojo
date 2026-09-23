# First non-repeating character in a stream
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def first_non_repeating(self, stream: String) -> String:
        var freq = List[Int]()
        for _ in range(26):
            freq.append(0)

        var q = List[String]()
        var q_front = 0
        var result = String("")

        for i in range(stream.byte_length()):
            var ch = String(stream[byte=i])
            var code = Int(stream.as_bytes()[i]) - 97

            if code >= 0 and code < 26:
                freq[code] += 1
                q.append(ch)

                while q_front < len(q):
                    var front_code = Int(q[q_front].as_bytes()[0]) - 97
                    if freq[front_code] > 1:
                        q_front += 1
                    else:
                        break

                if q_front < len(q):
                    result += q[q_front]
                else:
                    result += "#"

        return result

def main():
    var sol = Solution()
    var s1 = String("aabc")
    var s2 = String("zz")
    var s3 = String("geeksforgeeks")

    print("Stream:", s1, "-> First non-repeating sequence:", sol.first_non_repeating(s1))
    print("Stream:", s2, "-> First non-repeating sequence:", sol.first_non_repeating(s2))
    print("Stream:", s3, "-> First non-repeating sequence:", sol.first_non_repeating(s3))
