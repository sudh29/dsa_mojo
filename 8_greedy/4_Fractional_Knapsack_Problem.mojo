# Fractional Knapsack Problem
# Reference: https://mojolang.org/docs/manual/get-started/

struct Item(ImplicitlyCopyable, Movable):
    var value: Float64
    var weight: Float64

    def __init__(out self, value: Float64, weight: Float64):
        self.value = value
        self.weight = weight

    def __init__(out self, *, copy: Item):
        self.value = copy.value
        self.weight = copy.weight

def fractional_knapsack(w: Float64, mut items: List[Item]) -> Float64:
    var n = len(items)
    # Sort items descending by ratio value/weight
    for i in range(n):
        var max_idx = i
        var max_ratio = items[i].value / items[i].weight
        for j in range(i + 1, n):
            var ratio_j = items[j].value / items[j].weight
            if ratio_j > max_ratio:
                max_ratio = ratio_j
                max_idx = j
        if max_idx != i:
            var tmp = items[i]
            items[i] = items[max_idx]
            items[max_idx] = tmp

    var current_w = w
    var total_val = 0.0

    for i in range(n):
        if items[i].weight <= current_w:
            current_w -= items[i].weight
            total_val += items[i].value
        else:
            total_val += items[i].value * (current_w / items[i].weight)
            break

    return total_val

def main():
    var items = List[Item]()
    items.append(Item(60.0, 10.0))
    items.append(Item(100.0, 20.0))
    items.append(Item(120.0, 30.0))

    var w = 50.0
    var max_val = fractional_knapsack(w, items)
    print("Maximum value in knapsack:", max_val)
