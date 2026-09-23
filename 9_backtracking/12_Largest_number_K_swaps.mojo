# Find Largest Number Possible in K Swaps
# Reference: https://mojolang.org/docs/manual/get-started/

def solve_k_swaps(
    mut s_chars: List[Int],
    k: Int,
    idx: Int,
    mut max_str: String
):
    var current_str = String("")
    for i in range(len(s_chars)):
        current_str += chr(s_chars[i] + 48)

    if current_str > max_str:
        max_str = current_str

    if k == 0 or idx >= len(s_chars):
        return

    var max_digit = s_chars[idx]
    for i in range(idx + 1, len(s_chars)):
        if s_chars[i] > max_digit:
            max_digit = s_chars[i]

    if max_digit != s_chars[idx]:
        for j in range(len(s_chars) - 1, idx, -1):
            if s_chars[j] == max_digit:
                var tmp = s_chars[idx]
                s_chars[idx] = s_chars[j]
                s_chars[j] = tmp

                solve_k_swaps(s_chars, k - 1, idx + 1, max_str)

                # Backtrack
                s_chars[j] = s_chars[idx]
                s_chars[idx] = tmp
    else:
        solve_k_swaps(s_chars, k, idx + 1, max_str)

def find_maximum_num(s: String, k: Int) -> String:
    var s_chars = List[Int]()
    var bytes = s.as_bytes()
    for i in range(s.byte_length()):
        s_chars.append(Int(bytes[i]) - 48)

    var max_str = s
    solve_k_swaps(s_chars, k, 0, max_str)
    return max_str

def main():
    var s1 = String("1234567")
    var k1 = 4
    print("Largest of", s1, "with", k1, "swaps:", find_maximum_num(s1, k1))

    var s2 = String("3435335")
    var k2 = 3
    print("Largest of", s2, "with", k2, "swaps:", find_maximum_num(s2, k2))
