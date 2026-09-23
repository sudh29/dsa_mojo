# Unique rows in boolean matrix using Trie

struct BitTrieNode(Movable):
    var child0: Int
    var child1: Int
    var is_end: Bool

    def __init__(out self):
        self.child0 = -1
        self.child1 = -1
        self.is_end = False

struct BitTrie:
    var nodes: List[BitTrieNode]

    def __init__(out self):
        self.nodes = List[BitTrieNode]()
        self.nodes.append(BitTrieNode())

    def insert(mut self, row: List[Int]) -> Bool:
        var current = 0
        for i in range(len(row)):
            var bit = row[i]
            if bit == 0:
                if self.nodes[current].child0 == -1:
                    self.nodes.append(BitTrieNode())
                    self.nodes[current].child0 = len(self.nodes) - 1
                current = self.nodes[current].child0
            else:
                if self.nodes[current].child1 == -1:
                    self.nodes.append(BitTrieNode())
                    self.nodes[current].child1 = len(self.nodes) - 1
                current = self.nodes[current].child1

        if self.nodes[current].is_end:
            return False
        self.nodes[current].is_end = True
        return True

def unique_row(row: Int, col: Int, m: List[List[Int]]) -> List[List[Int]]:
    var trie = BitTrie()
    var res = List[List[Int]]()
    for i in range(row):
        if trie.insert(m[i]):
            var row_copy = List[Int]()
            for j in range(col):
                row_copy.append(m[i][j])
            res.append(row_copy^)
    return res^

def main():
    var row = 3
    var col = 4
    var m = List[List[Int]]()
    
    var r0 = List[Int](); r0.append(1); r0.append(1); r0.append(0); r0.append(1); m.append(r0^)
    var r1 = List[Int](); r1.append(1); r1.append(0); r1.append(0); r1.append(1); m.append(r1^)
    var r2 = List[Int](); r2.append(1); r2.append(1); r2.append(0); r2.append(1); m.append(r2^)
    
    var unique = unique_row(row, col, m)
    print("Unique rows count:", len(unique))
    for i in range(len(unique)):
        for j in range(col):
            print(unique[i][j], end=" ")
        print("$")
