# Given a sequence of words, group all anagrams together
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def sort_string(self, s: String) -> String:
        var chars = List[String]()
        for i in range(s.byte_length()):
            chars.append(String(s[byte=i]))

        # Simple bubble sort for small character arrays
        var n = len(chars)
        for i in range(n):
            for j in range(0, n - i - 1):
                if chars[j] > chars[j + 1]:
                    var tmp = chars[j]
                    chars[j] = chars[j + 1]
                    chars[j + 1] = tmp

        var res = String("")
        for i in range(n):
            res += chars[i]
        return res^

    def group_anagrams(self, words: List[String]) -> List[List[String]]:
        var keys = List[String]()
        var groups = List[List[String]]()

        for i in range(len(words)):
            var word = words[i]
            var key = self.sort_string(word)

            var found = False
            for k in range(len(keys)):
                if keys[k] == key:
                    groups[k].append(word)
                    found = True
                    break

            if not found:
                keys.append(key)
                var new_group = List[String]()
                new_group.append(word)
                groups.append(new_group^)

        return groups^

def main():
    var sol = Solution()
    var words = List[String]()
    words.append("act")
    words.append("god")
    words.append("cat")
    words.append("dog")
    words.append("tac")

    var grouped = sol.group_anagrams(words)
    print("Anagram Groups:")
    for i in range(len(grouped)):
        print("Group", i + 1, ":", end=" [")
        for j in range(len(grouped[i])):
            print(grouped[i][j], end=", " if j < len(grouped[i]) - 1 else "")
        print("]")
