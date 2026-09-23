# Find the first repeated word in a string
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def split_words(self, s: String) -> List[String]:
        var words = List[String]()
        var current = String("")
        var n = s.byte_length()

        for i in range(n):
            if s[byte=i] == " ":
                if current.byte_length() > 0:
                    words.append(current)
                    current = String("")
            else:
                current += s[byte=i]

        if current.byte_length() > 0:
            words.append(current)

        return words^

    def find_first_repeated_word(self, s: String) -> String:
        var words = self.split_words(s)
        var seen = List[String]()

        for i in range(len(words)):
            var w = words[i]
            var is_seen = False
            for j in range(len(seen)):
                if seen[j] == w:
                    is_seen = True
                    break

            if is_seen:
                return w
            else:
                seen.append(w)

        return "NoRepetition"

def main():
    var sol = Solution()
    var s1 = String("Ravi had been saying that he had been there")
    var s2 = String("he had had he")
    var s3 = String("hello world welcome")

    print("Sentence 1:", s1)
    print("First repeated word:", sol.find_first_repeated_word(s1))

    print("Sentence 2:", s2)
    print("First repeated word:", sol.find_first_repeated_word(s2))

    print("Sentence 3:", s3)
    print("First repeated word:", sol.find_first_repeated_word(s3))
