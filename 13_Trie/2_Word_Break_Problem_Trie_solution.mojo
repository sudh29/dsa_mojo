# Word Break Problem using Trie

struct TrieNode(Movable):
    var children: List[Int]
    var is_end_of_word: Bool

    def __init__(out self):
        self.children = List[Int]()
        for _ in range(26):
            self.children.append(-1)
        self.is_end_of_word = False

struct Trie:
    var nodes: List[TrieNode]

    def __init__(out self):
        self.nodes = List[TrieNode]()
        self.nodes.append(TrieNode())

    def insert(mut self, word: String):
        var current = 0
        var bytes = word.as_bytes()
        for i in range(word.byte_length()):
            var idx = Int(bytes[i]) - 97
            if idx < 0 or idx >= 26:
                continue
            if self.nodes[current].children[idx] == -1:
                self.nodes.append(TrieNode())
                self.nodes[current].children[idx] = len(self.nodes) - 1
            current = self.nodes[current].children[idx]
        self.nodes[current].is_end_of_word = True

    def search(self, word: String) -> Bool:
        var current = 0
        var bytes = word.as_bytes()
        for i in range(word.byte_length()):
            var idx = Int(bytes[i]) - 97
            if idx < 0 or idx >= 26:
                return False
            if self.nodes[current].children[idx] == -1:
                return False
            current = self.nodes[current].children[idx]
        return self.nodes[current].is_end_of_word

def substr(s: String, start: Int, end: Int) -> String:
    var res = String("")
    for i in range(start, end):
        res += s[byte=i]
    return res^

def word_break(n: Int, s: String, dictionary: List[String]) -> Int:
    var trie = Trie()
    for i in range(len(dictionary)):
        trie.insert(dictionary[i])
        
    var m = s.byte_length()
    var dp = List[Bool]()
    for _ in range(m + 1):
        dp.append(False)
    dp[0] = True
    
    for i in range(1, m + 1):
        for j in range(i):
            if dp[j]:
                var sub = substr(s, j, i)
                if trie.search(sub):
                    dp[i] = True
                    break
                    
    return 1 if dp[m] else 0

def main():
    var s = String("ilike")
    var dictionary = List[String]()
    dictionary.append("i")
    dictionary.append("like")
    dictionary.append("sam")
    dictionary.append("sung")
    print("Word break possible:", word_break(len(dictionary), s, dictionary))
