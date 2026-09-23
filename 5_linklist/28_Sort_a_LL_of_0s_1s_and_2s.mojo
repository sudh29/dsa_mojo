# Sort a linked list of 0s, 1s and 2s
# Reference: https://mojolang.org/docs/manual/get-started/

struct Node:
    var data: Int
    var next: Int

    def __init__(out self, data: Int, next: Int = -1):
        self.data = data
        self.next = next

struct LinkedList:
    var nodes: List[Node]
    var head: Int

    def __init__(out self):
        self.nodes = List[Node]()
        self.head = -1

    def append(mut self, data: Int) -> Int:
        var idx = len(self.nodes)
        self.nodes.append(Node(data, -1))
        if self.head == -1:
            self.head = idx
        else:
            var curr = self.head
            while self.nodes[curr].next != -1:
                curr = self.nodes[curr].next
            self.nodes[curr].next = idx
        return idx

    def segregate(mut self):
        var c0 = 0
        var c1 = 0
        var c2 = 0

        var curr = self.head
        while curr != -1:
            if self.nodes[curr].data == 0:
                c0 += 1
            elif self.nodes[curr].data == 1:
                c1 += 1
            else:
                c2 += 1
            curr = self.nodes[curr].next

        curr = self.head
        while curr != -1:
            if c0 > 0:
                self.nodes[curr].data = 0
                c0 -= 1
            elif c1 > 0:
                self.nodes[curr].data = 1
                c1 -= 1
            else:
                self.nodes[curr].data = 2
                c2 -= 1
            curr = self.nodes[curr].next

    def print_list(self):
        var curr = self.head
        print("[", end="")
        while curr != -1:
            print(self.nodes[curr].data, end="" if self.nodes[curr].next == -1 else " -> ")
            curr = self.nodes[curr].next
        print("]")

def main():
    var ll = LinkedList()
    _ = ll.append(1)
    _ = ll.append(2)
    _ = ll.append(2)
    _ = ll.append(1)
    _ = ll.append(2)
    _ = ll.append(0)
    _ = ll.append(2)
    _ = ll.append(2)

    print("Original List:")
    ll.print_list()

    ll.segregate()

    print("Sorted List (0s, 1s, 2s):")
    ll.print_list()
