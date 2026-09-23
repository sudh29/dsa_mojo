# Count triplets in a sorted Doubly Linked List whose sum is equal to a given value x
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

    def count_triplets(self, x: Int) -> Int:
        if self.head == -1:
            return 0

        var count = 0
        var ptr1 = self.head
        var tail = self.head
        while self.nodes[tail].next != -1:
            tail = self.nodes[tail].next

        while ptr1 != -1 and self.nodes[ptr1].next != -1:
            var target_diff = x - self.nodes[ptr1].data
            var first = self.nodes[ptr1].next
            var last = tail

            while first != -1 and last != -1 and first != last and self.nodes[last].next != first:
                var sum_val = self.nodes[first].data + self.nodes[last].data
                if sum_val == target_diff:
                    count += 1
                    first = self.nodes[first].next
                    last = self.nodes[last].prev
                elif sum_val < target_diff:
                    first = self.nodes[first].next
                else:
                    last = self.nodes[last].prev

            ptr1 = self.nodes[ptr1].next

        return count

def main():
    var dll = DoublyLinkedList()
    _ = dll.append(1)
    _ = dll.append(2)
    _ = dll.append(4)
    _ = dll.append(5)
    _ = dll.append(6)
    _ = dll.append(8)
    _ = dll.append(9)

    var x = 17
    print("Doubly Linked List: [1, 2, 4, 5, 6, 8, 9]")
    print("Triplets with sum", x, ":", dll.count_triplets(x))
