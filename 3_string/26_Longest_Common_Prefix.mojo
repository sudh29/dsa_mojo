# Longest Common Prefix across an array of strings
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def longest_common_prefix(self, strs: List[String]) -> String:
        if len(strs) == 0:
            return ""

        var min_len = strs[0].byte_length()
        for i in range(1, len(strs)):
            if strs[i].byte_length() < min_len:
                min_len = strs[i].byte_length()

        var lcp = String("")
        var b0 = strs[0].as_bytes()
        for i in range(min_len):
            for j in range(1, len(strs)):
                if strs[j].as_bytes()[i] != b0[i]:
                    return lcp
            lcp += strs[0][byte=i]

        return lcp

def main():
    var sol = Solution()
    var list1 = List[String]()
    list1.append("flower")
    list1.append("flow")
    list1.append("flight")

    var list2 = List[String]()
    list2.append("dog")
    list2.append("racecar")
    list2.append("car")

    print("List 1 LCP:", sol.longest_common_prefix(list1))
    print("List 2 LCP:", sol.longest_common_prefix(list2))
