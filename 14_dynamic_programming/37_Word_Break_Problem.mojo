# Word Break Problem

def substr(s: String, start: Int, end: Int) -> String:
    var res = String("")
    for i in range(start, end):
        res += s[byte=i]
    return res^

def contains_word(dict_words: List[String], target: String) -> Bool:
    for i in range(len(dict_words)):
        if dict_words[i] == target:
            return True
    return False

def word_break(s: String, dictionary: List[String]) -> Int:
    var n = s.byte_length()
    var dp = List[Bool]()
    for _ in range(n + 1):
        dp.append(False)
    dp[0] = True
    
    for i in range(1, n + 1):
        for j in range(i):
            if dp[j]:
                var sub = substr(s, j, i)
                if contains_word(dictionary, sub):
                    dp[i] = True
                    break
                    
    return 1 if dp[n] else 0

def main():
    var s = String("ilike")
    var dict_words = List[String]()
    dict_words.append("i")
    dict_words.append("like")
    dict_words.append("sam")
    dict_words.append("sung")
    print("Word break possible:", word_break(s, dict_words))
