# Canonical Trie implementation in Mojo 1.1

struct TrieNode(Movable):
    var children: List[Int]
    var is_end_of_word: Bool

    def __init__(out self):
        self.children = List[Int]()
        for _ in range(26):
            self.children.append(-1)
        self.is_end_of_word = False

struct Trie(Movable):
    var nodes: List[TrieNode]

    def __init__(out self):
        self.nodes = List[TrieNode]()
        self.nodes.append(TrieNode())

    def insert(mut self, key: String):
        var current = 0
        var bytes = key.as_bytes()
        for i in range(key.byte_length()):
            var idx = Int(bytes[i]) - 97
            if idx < 0 or idx >= 26:
                continue
            if self.nodes[current].children[idx] == -1:
                self.nodes.append(TrieNode())
                self.nodes[current].children[idx] = len(self.nodes) - 1
            current = self.nodes[current].children[idx]
        self.nodes[current].is_end_of_word = True

    def search(self, key: String) -> Bool:
        var current = 0
        var bytes = key.as_bytes()
        for i in range(key.byte_length()):
            var idx = Int(bytes[i]) - 97
            if idx < 0 or idx >= 26:
                return False
            if self.nodes[current].children[idx] == -1:
                return False
            current = self.nodes[current].children[idx]
        return self.nodes[current].is_end_of_word

    def starts_with(self, prefix: String) -> Bool:
        var current = 0
        var bytes = prefix.as_bytes()
        for i in range(prefix.byte_length()):
            var idx = Int(bytes[i]) - 97
            if idx < 0 or idx >= 26:
                return False
            if self.nodes[current].children[idx] == -1:
                return False
            current = self.nodes[current].children[idx]
        return True
