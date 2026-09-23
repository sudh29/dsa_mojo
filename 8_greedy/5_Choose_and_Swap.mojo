# Choose and Swap
# Reference: https://mojolang.org/docs/manual/get-started/

def choose_and_swap(s: String) -> String:
    var n = s.byte_length()
    # First occurrence index for each character 'a'..'z'
    var first_idx = List[Int]()
    for _ in range(26):
        first_idx.append(-1)

    for i in range(n):
        var c = Int(s.as_bytes()[i]) - 97
        if first_idx[c] == -1:
            first_idx[c] = i

    var ch1 = -1
    var ch2 = -1

    for i in range(n):
        var c1 = Int(s.as_bytes()[i]) - 97
        var found = False
        for c2 in range(c1):
            if first_idx[c2] > first_idx[c1]:
                ch1 = c1
                ch2 = c2
                found = True
                break
        if found:
            break

    if ch1 == -1:
        return s

    var res = String("")
    for i in range(n):
        var c = Int(s.as_bytes()[i]) - 97
        if c == ch1:
            res += chr(ch2 + 97)
        elif c == ch2:
            res += chr(ch1 + 97)
        else:
            res += s[byte=i]

    return res^

def main():
    var s1 = String("ccad")
    print("Original:", s1, "-> Swapped:", choose_and_swap(s1))

    var s2 = String("abba")
    print("Original:", s2, "-> Swapped:", choose_and_swap(s2))
