# Find Duplicate Characters in a String
# Pattern: Frequency Counting / Hash Table
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def find_duplicates(self, s: String) -> List[String]:
        var duplicates = List[String]()
        var seen = List[String]()
        var added = List[String]()

        for i in range(s.byte_length()):
            var ch = String(s[byte=i])
            var already_seen = False
            for j in range(len(seen)):
                if seen[j] == ch:
                    already_seen = True
                    break

            if already_seen:
                var already_added = False
                for k in range(len(added)):
                    if added[k] == ch:
                        already_added = True
                        break
                if not already_added:
                    duplicates.append(ch)
                    added.append(ch)
            else:
                seen.append(ch)

        return duplicates^

def main():
    var sol = Solution()
    var s = String("geeksforgeeks")
    print("String:", s)
    var dups = sol.find_duplicates(s)
    print("Duplicate characters:", end=" [")
    for i in range(len(dups)):
        print("\"" + dups[i] + "\"", end=", " if i < len(dups) - 1 else "")
    print("]")
