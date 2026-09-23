# Word Break Problem
# Pattern: Dynamic Programming / String Segmentation
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def word_in_dict(self, word: String, dictionary: List[String]) -> Bool:
        for i in range(len(dictionary)):
            if dictionary[i] == word:
                return True
        return False

    def word_break(self, s: String, dictionary: List[String]) -> Bool:
        var n = s.byte_length()
        if n == 0:
            return True

        # dp[i] is True if s[0..i-1] can be segmented
        var dp = List[Bool]()
        for _ in range(n + 1):
            dp.append(False)
        dp[0] = True

        for i in range(1, n + 1):
            for j in range(i):
                if dp[j]:
                    var sub = String("")
                    for k in range(j, i):
                        sub += s[byte=k]

                    if self.word_in_dict(sub, dictionary):
                        dp[i] = True
                        break

        return dp[n]

def main():
    var sol = Solution()
    var dict1 = List[String]()
    dict1.append("apple"); dict1.append("pen")
    var s1 = String("applepenapple")
    print("String:", s1, "-> Can word break:", sol.word_break(s1, dict1))

    var dict2 = List[String]()
    dict2.append("cats"); dict2.append("dog"); dict2.append("sand"); dict2.append("and"); dict2.append("cat")
    var s2 = String("catsandog")
    print("String:", s2, "-> Can word break:", sol.word_break(s2, dict2))
