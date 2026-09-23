# Rearrange Characters such that No Two Adjacent are Same
# Reference: https://mojolang.org/docs/manual/get-started/

def rearrange_string(s: String) -> String:
    var n = s.byte_length()
    if n <= 1:
        return s

    var freqs = List[Int]()
    for _ in range(26):
        freqs.append(0)

    for i in range(n):
        var c = Int(s.as_bytes()[i]) - 97
        if c >= 0 and c < 26:
            freqs[c] += 1

    var max_freq = 0
    var max_char = 0
    for i in range(26):
        if freqs[i] > max_freq:
            max_freq = freqs[i]
            max_char = i

    var max_allowed = (n + 1) // 2
    if max_freq > max_allowed:
        return ""

    var res = List[String]()
    for _ in range(n):
        res.append("")

    # Place the majority character at even indices
    var idx = 0
    while freqs[max_char] > 0:
        res[idx] = chr(max_char + 97)
        idx += 2
        freqs[max_char] -= 1

    # Place the rest
    for i in range(26):
        while freqs[i] > 0:
            if idx >= n:
                idx = 1
            res[idx] = chr(i + 97)
            idx += 2
            freqs[i] -= 1

    var result_str = String("")
    for i in range(n):
        result_str += res[i]

    return result_str^

def main():
    var s1 = String("aaabc")
    var out1 = rearrange_string(s1)
    print("Rearranged '", s1, "': '", out1, "'")

    var s2 = String("aaabb")
    var out2 = rearrange_string(s2)
    print("Rearranged '", s2, "': '", out2, "'")

    var s3 = String("aaa")
    var out3 = rearrange_string(s3)
    print("Rearranged '", s3, "': '", out3, "' (empty means impossible)")
