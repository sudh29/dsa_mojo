# Shortest Unique prefix for every word

struct TrieNode(Movable):
    var children: List[Int]
    var count: Int

    def __init__(out self):
        self.children = List[Int]()
        for _ in range(26):
            self.children.append(-1)
        self.count = 0

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
            self.nodes[current].count += 1

    def find_unique_prefix(self, word: String) -> String:
        var current = 0
        var prefix = String("")
        var bytes = word.as_bytes()
        for i in range(word.byte_length()):
            prefix += word[byte=i]
            var idx = Int(bytes[i]) - 97
            current = self.nodes[current].children[idx]
            if self.nodes[current].count == 1:
                break
        return prefix

def find_prefixes(arr: List[String], n: Int) -> List[String]:
    var trie = Trie()
    for i in range(n):
        trie.insert(arr[i])
        
    var res = List[String]()
    for i in range(n):
        res.append(trie.find_unique_prefix(arr[i]))
    return res^

def main():
    var arr = List[String]()
    arr.append("zebra")
    arr.append("dog")
    arr.append("duck")
    arr.append("dove")
    
    var prefixes = find_prefixes(arr, len(arr))
    print("Unique prefixes:")
    for i in range(len(prefixes)):
        print(arr[i], "->", prefixes[i])
