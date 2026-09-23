# Print Anagrams Together

def sort_string(s: String) -> String:
    var chars = List[String]()
    for i in range(s.byte_length()):
        chars.append(String(s[byte=i]))
    for i in range(len(chars)):
        for j in range(i + 1, len(chars)):
            if chars[j] < chars[i]:
                var temp = chars[i]
                chars[i] = chars[j]
                chars[j] = temp
    var res = String("")
    for i in range(len(chars)):
        res += chars[i]
    return res^

struct AnagramGroup(Movable):
    var key: String
    var words: List[String]

    def __init__(out self, key: String):
        self.key = key
        self.words = List[String]()

def group_anagrams(words: List[String]) -> List[List[String]]:
    var groups = List[AnagramGroup]()
    for i in range(len(words)):
        var word = words[i]
        var key = sort_string(word)
        var found = False
        for g_idx in range(len(groups)):
            if groups[g_idx].key == key:
                groups[g_idx].words.append(word)
                found = True
                break
        if not found:
            var new_group = AnagramGroup(key)
            new_group.words.append(word)
            groups.append(new_group^)
            
    var res = List[List[String]]()
    for i in range(len(groups)):
        var wlist = List[String]()
        for j in range(len(groups[i].words)):
            wlist.append(groups[i].words[j])
        res.append(wlist^)
    return res^

def main():
    var words = List[String]()
    words.append("act")
    words.append("god")
    words.append("cat")
    words.append("dog")
    words.append("tac")
    
    var groups = group_anagrams(words)
    print("Anagram groups:")
    for i in range(len(groups)):
        print("Group", i + 1, ":", end=" ")
        for j in range(len(groups[i])):
            print(groups[i][j], end=" ")
        print()
