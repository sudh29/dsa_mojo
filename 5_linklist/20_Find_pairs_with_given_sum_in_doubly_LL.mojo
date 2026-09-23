# Find pairs with given sum in a sorted Doubly Linked List
# Reference: https://mojolang.org/docs/manual/get-started/

struct DNode:
    var data: Int
    var next: Int
    var prev: Int

    def __init__(out self, data: Int, next: Int = -1, prev: Int = -1):
        self.data = data
        self.next = next
        self.prev = prev

struct DoublyLinkedList:
    var nodes: List[DNode]
    var head: Int

    def __init__(out self):
        self.nodes = List[DNode]()
        self.head = -1

    def append(mut self, data: Int) -> Int:
        var idx = len(self.nodes)
        self.nodes.append(DNode(data, -1, -1))
        if self.head == -1:
            self.head = idx
        else:
            var curr = self.head
            while self.nodes[curr].next != -1:
                curr = self.nodes[curr].next
            self.nodes[curr].next = idx
            self.nodes[idx].prev = curr
        return idx

    def find_pairs_with_sum(self, target: Int) -> List[List[Int]]:
        var res = List[List[Int]]()
        if self.head == -1:
            return res^

        var first = self.head
        var last = self.head
        while self.nodes[last].next != -1:
            last = self.nodes[last].next

        while first != -1 and last != -1 and first != last and self.nodes[last].next != first:
            var sum_val = self.nodes[first].data + self.nodes[last].data
            if sum_val == target:
                var pair = List[Int]()
                pair.append(self.nodes[first].data)
                pair.append(self.nodes[last].data)
                res.append(pair^)
                first = self.nodes[first].next
                last = self.nodes[last].prev
            elif sum_val < target:
                first = self.nodes[first].next
            else:
                last = self.nodes[last].prev

        return res^

def main():
    var dll = DoublyLinkedList()
    _ = dll.append(1)
    _ = dll.append(2)
    _ = dll.append(4)
    _ = dll.append(5)
    _ = dll.append(6)
    _ = dll.append(8)
    _ = dll.append(9)

    var target = 7
    var pairs = dll.find_pairs_with_sum(target)
    print("Pairs with sum", target, "in [1, 2, 4, 5, 6, 8, 9]:")
    for i in range(len(pairs)):
        print("(", pairs[i][0], ",", pairs[i][1], ")")
