# Print All Permutations of a String
# Reference: https://mojolang.org/docs/manual/get-started/

def solve_permutations(
    mut chars: List[String],
    index: Int,
    mut res: List[String]
):
    if index == len(chars) - 1:
        var s_out = String("")
        for i in range(len(chars)):
            s_out += chars[i]
        res.append(s_out)
        return

    var seen = List[String]()
    for i in range(index, len(chars)):
        var already_seen = False
        for s_idx in range(len(seen)):
            if seen[s_idx] == chars[i]:
                already_seen = True
                break

        if not already_seen:
            seen.append(chars[i])

            var tmp = chars[index]
            chars[index] = chars[i]
            chars[i] = tmp

            solve_permutations(chars, index + 1, res)

            chars[i] = chars[index]
            chars[index] = tmp

def find_permutations(s: String) -> List[String]:
    var chars = List[String]()
    for i in range(s.byte_length()):
        chars.append(String(s[byte=i]))

    var res = List[String]()
    if len(chars) > 0:
        solve_permutations(chars, 0, res)

    # Sort lexicographically
    for i in range(len(res)):
        var min_idx = i
        for j in range(i + 1, len(res)):
            if res[j] < res[min_idx]:
                min_idx = j
        if min_idx != i:
            var tmp = res[i]
            res[i] = res[min_idx]
            res[min_idx] = tmp

    return res^

def main():
    var s = String("ABC")
    var perms = find_permutations(s)
    print("Permutations of 'ABC':", end=" [")
    for i in range(len(perms)):
        print(perms[i], end=", " if i < len(perms) - 1 else "")
    print("]")
