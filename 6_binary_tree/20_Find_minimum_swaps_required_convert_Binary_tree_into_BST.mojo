# Find Minimum Swaps Required to Convert Binary Tree into BST
# Reference: https://mojolang.org/docs/manual/get-started/

struct Pair(ImplicitlyCopyable, Movable):
    var val: Int
    var idx: Int

    def __init__(out self, val: Int, idx: Int):
        self.val = val
        self.idx = idx

    def __init__(out self, *, copy: Pair):
        self.val = copy.val
        self.idx = copy.idx

def get_inorder(arr: List[Int], n: Int, index: Int, mut res: List[Int]):
    if index >= n:
        return
    get_inorder(arr, n, 2 * index + 1, res)
    res.append(arr[index])
    get_inorder(arr, n, 2 * index + 2, res)

def min_swaps_to_sort(mut arr: List[Int]) -> Int:
    var n = len(arr)
    var pairs = List[Pair]()
    for i in range(n):
        pairs.append(Pair(arr[i], i))

    # Sort pairs by val
    for i in range(n):
        var min_idx = i
        for j in range(i + 1, n):
            if pairs[j].val < pairs[min_idx].val:
                min_idx = j
        if min_idx != i:
            var tmp = pairs[i]
            pairs[i] = pairs[min_idx]
            pairs[min_idx] = tmp

    var visited = List[Bool]()
    for _ in range(n):
        visited.append(False)

    var swaps = 0
    for i in range(n):
        if visited[i] or pairs[i].idx == i:
            continue

        var cycle_size = 0
        var j = i
        while not visited[j]:
            visited[j] = True
            j = pairs[j].idx
            cycle_size += 1

        if cycle_size > 0:
            swaps += cycle_size - 1

    return swaps

def min_swaps_to_bst(arr: List[Int]) -> Int:
    var n = len(arr)
    var inord = List[Int]()
    get_inorder(arr, n, 0, inord)
    return min_swaps_to_sort(inord)

def main():
    var tree_arr = List[Int]()
    tree_arr.append(5)
    tree_arr.append(6)
    tree_arr.append(7)
    tree_arr.append(8)
    tree_arr.append(9)
    tree_arr.append(10)
    tree_arr.append(11)

    var swaps = min_swaps_to_bst(tree_arr)
    print("Min swaps to convert to BST:", swaps)
