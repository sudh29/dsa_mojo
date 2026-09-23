# Check if two strings are Isomorphic
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def are_isomorphic(self, str1: String, str2: String) -> Bool:
        var n = str1.byte_length()
        if n != str2.byte_length():
            return False

        var map1 = List[Int]()
        var map2 = List[Int]()
        for _ in range(256):
            map1.append(-1)
            map2.append(-1)

        var b1 = str1.as_bytes()
        var b2 = str2.as_bytes()

        for i in range(n):
            var c1 = Int(b1[i])
            var c2 = Int(b2[i])

            if map1[c1] != -1 and map1[c1] != c2:
                return False
            if map2[c2] != -1 and map2[c2] != c1:
                return False

            map1[c1] = c2
            map2[c2] = c1

        return True

def main():
    var sol = Solution()
    var s1 = String("aab")
    var s2 = String("xxy")

    var s3 = String("aab")
    var s4 = String("xyz")

    var s5 = String("paper")
    var s6 = String("title")

    print("Isomorphic('", s1, "', '", s2, "'):", sol.are_isomorphic(s1, s2))
    print("Isomorphic('", s3, "', '", s4, "'):", sol.are_isomorphic(s3, s4))
    print("Isomorphic('", s5, "', '", s6, "'):", sol.are_isomorphic(s5, s6))
