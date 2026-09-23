# Max length chain of pairs

struct Pair(ImplicitlyCopyable, Movable):
    var a: Int
    var b: Int

    def __init__(out self, a: Int, b: Int):
        self.a = a
        self.b = b

    def __init__(out self, *, copy: Pair):
        self.a = copy.a
        self.b = copy.b

def sort_pairs(mut p: List[Pair]):
    # Bubble sort / insertion sort by .b
    for i in range(len(p)):
        for j in range(i + 1, len(p)):
            if p[j].b < p[i].b:
                var temp = p[i]
                p[i] = p[j]
                p[j] = temp

def max_chain_len(mut p: List[Pair], n: Int) -> Int:
    if n == 0:
        return 0
    sort_pairs(p)
    var max_length = 1
    var last_selected_end = p[0].b
    for i in range(1, n):
        if p[i].a > last_selected_end:
            max_length += 1
            last_selected_end = p[i].b
    return max_length

def main():
    var pairs = List[Pair]()
    pairs.append(Pair(5, 24))
    pairs.append(Pair(39, 60))
    pairs.append(Pair(15, 28))
    pairs.append(Pair(27, 40))
    pairs.append(Pair(50, 90))
    print("Max chain length:", max_chain_len(pairs, len(pairs)))
