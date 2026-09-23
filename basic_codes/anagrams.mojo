# Check if Two Strings are Anagrams

def sort_string(s: String) -> String:
    var chars = List[String]()
    for i in range(s.byte_length()):
        chars.append(String(s[byte=i]))
    for i in range(len(chars)):
        for j in range(i + 1, len(chars)):
            if chars[j] < chars[i]:
                var temp = chars[i]
                chars[i] = chars[j]
                chars[j] = temp
    var res = String()
    for i in range(len(chars)):
        res += chars[i]
    return res^

def are_anagrams(a: String, b: String) -> Int:
    if a.byte_length() != b.byte_length():
        return 0
    var sorted_a = sort_string(a)
    var sorted_b = sort_string(b)
    return 1 if sorted_a == sorted_b else 0

def main():
    var x = String("sudh")
    var y = String("Rama")
    print("sudh and Rama:", are_anagrams(x, y))

    var i = String("dance")
    var j = String("cadne")
    print("dance and cadne:", are_anagrams(i, j))
