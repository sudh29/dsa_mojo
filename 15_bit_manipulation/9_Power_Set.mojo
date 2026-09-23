# Power Set (Generate All Subsequences)
# Reference: https://mojolang.org/docs/manual/get-started/

def all_possible_strings(s: String) -> List[String]:
    var n = s.byte_length()
    var power_set_size = 1 << n
    var temp = List[String]()

    for i in range(1, power_set_size):
        var sub = String("")
        for j in range(n):
            if (i & (1 << j)) != 0:
                sub += s[byte=j]
        temp.append(sub)

    # Sort lexicographically
    for i in range(len(temp)):
        var min_idx = i
        for j in range(i + 1, len(temp)):
            if temp[j] < temp[min_idx]:
                min_idx = j
        if min_idx != i:
            var tmp = temp[i]
            temp[i] = temp[min_idx]
            temp[min_idx] = tmp

    return temp^

def main():
    var s = String("abc")
    var subs = all_possible_strings(s)
    print("Power set of 'abc':", end=" [")
    for i in range(len(subs)):
        print("'" + subs[i] + "'", end=", " if i < len(subs) - 1 else "")
    print("]")
