# Reverse a Doubly Linked List
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

    def reverse(mut self):
        if self.head == -1 or self.nodes[self.head].next == -1:
            return

        var curr = self.head
        var temp = -1

        while curr != -1:
            temp = self.nodes[curr].prev
            self.nodes[curr].prev = self.nodes[curr].next
            self.nodes[curr].next = temp
            curr = self.nodes[curr].prev

        if temp != -1:
            self.head = self.nodes[temp].prev

    def print_list(self):
        var curr = self.head
        print("[", end="")
        while curr != -1:
            print(self.nodes[curr].data, end="" if self.nodes[curr].next == -1 else " <-> ")
            curr = self.nodes[curr].next
        print("]")

def main():
    var dll = DoublyLinkedList()
    _ = dll.append(3)
    _ = dll.append(4)
    _ = dll.append(5)
    _ = dll.append(6)

    print("Original Doubly Linked List:")
    dll.print_list()

    dll.reverse()

    print("Reversed Doubly Linked List:")
    dll.print_list()
