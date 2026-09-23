# Rotate Doubly Linked List by P nodes
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

    def rotate(mut self, p: Int):
        if self.head == -1 or p == 0:
            return

        var current = self.head
        var count = 1
        while count < p and current != -1:
            current = self.nodes[current].next
            count += 1

        if current == -1 or self.nodes[current].next == -1:
            return

        var nth_node = current
        var tail = current
        while self.nodes[tail].next != -1:
            tail = self.nodes[tail].next

        self.nodes[tail].next = self.head
        self.nodes[self.head].prev = tail

        self.head = self.nodes[nth_node].next
        self.nodes[self.head].prev = -1
        self.nodes[nth_node].next = -1

    def print_list(self):
        var curr = self.head
        print("[", end="")
        while curr != -1:
            print(self.nodes[curr].data, end="" if self.nodes[curr].next == -1 else " <-> ")
            curr = self.nodes[curr].next
        print("]")

def main():
    var dll = DoublyLinkedList()
    _ = dll.append(1)
    _ = dll.append(2)
    _ = dll.append(3)
    _ = dll.append(4)
    _ = dll.append(5)
    _ = dll.append(6)

    print("Original DLL:")
    dll.print_list()

    var p = 2
    print("Rotating by", p, "nodes:")
    dll.rotate(p)
    dll.print_list()
