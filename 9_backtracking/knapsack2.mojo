# Fractional Knapsack Problem using Greedy Approach
# Reference: https://mojolang.org/docs/manual/get-started/

struct KnapsackItem(ImplicitlyCopyable, Movable):
    var weight: Float64
    var value: Float64

    def __init__(out self, weight: Float64, value: Float64):
        self.weight = weight
        self.value = value

    def __init__(out self, *, copy: KnapsackItem):
        self.weight = copy.weight
        self.value = copy.value

def knapsack_fractional(max_weight: Float64, mut items: List[KnapsackItem]) -> Float64:
    var n = len(items)
    # Sort items descending by value / weight ratio
    for i in range(n):
        var max_idx = i
        var max_ratio = items[i].value / items[i].weight
        for j in range(i + 1, n):
            var ratio = items[j].value / items[j].weight
            if ratio > max_ratio:
                max_ratio = ratio
                max_idx = j
        if max_idx != i:
            var tmp = items[i]
            items[i] = items[max_idx]
            items[max_idx] = tmp

    var total_value = 0.0
    var remaining_weight = max_weight

    for i in range(n):
        if remaining_weight >= items[i].weight:
            remaining_weight -= items[i].weight
            total_value += items[i].value
        else:
            var fraction = remaining_weight / items[i].weight
            total_value += items[i].value * fraction
            remaining_weight = 0.0
            break

    return total_value

def main():
    var items = List[KnapsackItem]()
    items.append(KnapsackItem(10.0, 60.0))
    items.append(KnapsackItem(20.0, 100.0))
    items.append(KnapsackItem(30.0, 120.0))

    var w = 50.0
    print("Maximum value in fractional knapsack:", knapsack_fractional(w, items))
