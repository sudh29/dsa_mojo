# Longest Common Subsequence (LCS)
# Reference: https://mojolang.org/docs/manual/get-started/

def lcs(s1: String, s2: String) -> Int:
    var n = s1.byte_length()
    var m = s2.byte_length()
    var b1 = s1.as_bytes()
    var b2 = s2.as_bytes()

    var prev = List[Int]()
    for _ in range(m + 1):
        prev.append(0)

    var curr = List[Int]()
    for _ in range(m + 1):
        curr.append(0)

    for i in range(1, n + 1):
        for j in range(1, m + 1):
            if b1[i - 1] == b2[j - 1]:
                curr[j] = 1 + prev[j - 1]
            else:
                var top = prev[j]
                var left = curr[j - 1]
                curr[j] = top if top > left else left

        for j in range(m + 1):
            prev[j] = curr[j]
            curr[j] = 0

    return prev[m]

def main():
    var s1 = String("ABCDGH")
    var s2 = String("AEDFHR")
    print("LCS of ABCDGH and AEDFHR:", lcs(s1, s2))

    var s3 = String("ABC")
    var s4 = String("AC")
    print("LCS of ABC and AC:", lcs(s3, s4))
