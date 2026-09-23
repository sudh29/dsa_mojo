# Huffman Coding
# Reference: https://mojolang.org/docs/manual/get-started/

struct HuffmanNode:
    var char_val: String
    var freq: Int
    var left: Int
    var right: Int

    def __init__(out self, char_val: String, freq: Int, left: Int = -1, right: Int = -1):
        self.char_val = char_val
        self.freq = freq
        self.left = left
        self.right = right

struct HuffmanArena:
    var nodes: List[HuffmanNode]

    def __init__(out self):
        self.nodes = List[HuffmanNode]()

    def add_node(mut self, char_val: String, freq: Int, left: Int = -1, right: Int = -1) -> Int:
        var idx = len(self.nodes)
        self.nodes.append(HuffmanNode(char_val, freq, left, right))
        return idx

    def generate_codes(self, root: Int, current_code: String, mut codes: List[String]):
        if root == -1:
            return

        if self.nodes[root].left == -1 and self.nodes[root].right == -1:
            codes.append(current_code)
            return

        self.generate_codes(self.nodes[root].left, current_code + "0", codes)
        self.generate_codes(self.nodes[root].right, current_code + "1", codes)

def huffman_codes(chars: String, freqs: List[Int]) -> List[String]:
    var arena = HuffmanArena()
    var active_nodes = List[Int]()

    for i in range(chars.byte_length()):
        var ch = String(chars[byte=i])
        var idx = arena.add_node(ch, freqs[i])
        active_nodes.append(idx)

    while len(active_nodes) > 1:
        # Find 2 nodes with minimum frequency
        # 1st min
        var min1_pos = 0
        for i in range(1, len(active_nodes)):
            if arena.nodes[active_nodes[i]].freq < arena.nodes[active_nodes[min1_pos]].freq:
                min1_pos = i
        var left_idx = active_nodes.pop(min1_pos)

        # 2nd min
        var min2_pos = 0
        for i in range(1, len(active_nodes)):
            if arena.nodes[active_nodes[i]].freq < arena.nodes[active_nodes[min2_pos]].freq:
                min2_pos = i
        var right_idx = active_nodes.pop(min2_pos)

        var sum_freq = arena.nodes[left_idx].freq + arena.nodes[right_idx].freq
        var parent_idx = arena.add_node("", sum_freq, left_idx, right_idx)
        active_nodes.append(parent_idx)

    var codes = List[String]()
    if len(active_nodes) == 1:
        arena.generate_codes(active_nodes[0], "", codes)

    return codes^

def main():
    var chars = String("abcdef")
    var freqs = List[Int]()
    freqs.append(5)
    freqs.append(9)
    freqs.append(12)
    freqs.append(13)
    freqs.append(16)
    freqs.append(45)

    var codes = huffman_codes(chars, freqs)
    print("Huffman Codes (preorder):", end=" [")
    for i in range(len(codes)):
        print(codes[i], end=", " if i < len(codes) - 1 else "")
    print("]")
