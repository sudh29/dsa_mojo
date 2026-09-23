# Number of flips to make binary string alternate ('0101...' or '1010...')
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def min_flips(self, s: String) -> Int:
        var n = s.byte_length()
        var flips_start_0 = 0
        var flips_start_1 = 0
        var bytes = s.as_bytes()

        for i in range(n):
            var expected_0 = 48 if (i % 2 == 0) else 49
            var expected_1 = 49 if (i % 2 == 0) else 48

            if Int(bytes[i]) != expected_0:
                flips_start_0 += 1
            if Int(bytes[i]) != expected_1:
                flips_start_1 += 1

        return flips_start_0 if flips_start_0 < flips_start_1 else flips_start_1

def main():
    var sol = Solution()
    var s1 = String("001")
    var s2 = String("0001010111")
    var s3 = String("1111")

    print("String:", s1, "-> Min flips:", sol.min_flips(s1))
    print("String:", s2, "-> Min flips:", sol.min_flips(s2))
    print("String:", s3, "-> Min flips:", sol.min_flips(s3))
