# Maximum Length of Pair Chain

struct Pair(ImplicitlyCopyable, Movable):
    var first: Int
    var second: Int

    def __init__(out self, first: Int, second: Int):
        self.first = first
        self.second = second

    def __init__(out self, *, copy: Pair):
        self.first = copy.first
        self.second = copy.second

def sort_pairs_by_second(mut pairs: List[Pair]):
    for i in range(len(pairs)):
        for j in range(i + 1, len(pairs)):
            if pairs[j].second < pairs[i].second:
                var temp = pairs[i]
                pairs[i] = pairs[j]
                pairs[j] = temp

def find_longest_chain(mut pairs: List[Pair]) -> Int:
    var n = len(pairs)
    if n == 0:
        return 0
    sort_pairs_by_second(pairs)
    var current_end = -1000000000
    var max_chain_length = 0
    for i in range(n):
        if current_end < pairs[i].first:
            current_end = pairs[i].second
            max_chain_length += 1
    return max_chain_length

def main():
    var pairs = List[Pair]()
    pairs.append(Pair(1, 2))
    pairs.append(Pair(2, 3))
    pairs.append(Pair(3, 4))
    print("Longest chain length:", find_longest_chain(pairs))
