# Smallest window that contains all distinct characters of itself
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def find_sub_string(self, s: String) -> Int:
        var n = s.byte_length()
        if n == 0:
            return 0
        var bytes = s.as_bytes()

        # Count total distinct characters in s
        var has_char = List[Bool]()
        for _ in range(256):
            has_char.append(False)

        var total_distinct = 0
        for i in range(n):
            var code = Int(bytes[i])
            if not has_char[code]:
                has_char[code] = True
                total_distinct += 1

        var char_count = List[Int]()
        for _ in range(256):
            char_count.append(0)

        var min_len = n + 1
        var left = 0
        var distinct_in_window = 0

        for right in range(n):
            var r_code = Int(bytes[right])
            char_count[r_code] += 1
            if char_count[r_code] == 1:
                distinct_in_window += 1

            while distinct_in_window == total_distinct:
                var window_len = right - left + 1
                if window_len < min_len:
                    min_len = window_len

                var l_code = Int(bytes[left])
                char_count[l_code] -= 1
                if char_count[l_code] == 0:
                    distinct_in_window -= 1
                left += 1

        return min_len if min_len <= n else 0

def main():
    var sol = Solution()
    var s1 = String("aabcbcdbca")
    var s2 = String("aaab")
    var s3 = String("geeksforgeeks")

    print("String:", s1, "-> Smallest window:", sol.find_sub_string(s1))
    print("String:", s2, "-> Smallest window:", sol.find_sub_string(s2))
    print("String:", s3, "-> Smallest window:", sol.find_sub_string(s3))
