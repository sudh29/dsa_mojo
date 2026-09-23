# Checking Valid Shuffle of Two Strings
# Pattern: Frequency Counting / Interleaving Check
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def valid_shuffle(self, str1: String, str2: String, shuffle: String) -> Bool:
        var n1 = str1.byte_length()
        var n2 = str2.byte_length()
        var n = shuffle.byte_length()
        if n != n1 + n2:
            return False

        var freq = List[Int]()
        for _ in range(256):
            freq.append(0)

        var b1 = str1.as_bytes()
        var b2 = str2.as_bytes()
        var b_sh = shuffle.as_bytes()

        for i in range(n1):
            freq[Int(b1[i])] += 1
        for i in range(n2):
            freq[Int(b2[i])] += 1
        for i in range(n):
            freq[Int(b_sh[i])] -= 1

        for i in range(256):
            if freq[i] != 0:
                return False
        return True

def main():
    var sol = Solution()
    var s1 = String("BA")
    var s2 = String("XY")
    var shuffle1 = String("ABYX")
    print("s1: BA, s2: XY, shuffle: ABYX -> Valid:", sol.valid_shuffle(s1, s2, shuffle1))

    var shuffle2 = String("ABYZ")
    print("s1: BA, s2: XY, shuffle: ABYZ -> Valid:", sol.valid_shuffle(s1, s2, shuffle2))
