# Segregate even and odd nodes in a Linked List (even nodes followed by odd nodes)
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

    def segregate_even_odd(mut self):
        var even_start = -1
        var even_end = -1
        var odd_start = -1
        var odd_end = -1

        var curr = self.head

        while curr != -1:
            var val = self.nodes[curr].data
            var next_node = self.nodes[curr].next
            self.nodes[curr].next = -1

            if val % 2 == 0:
                if even_start == -1:
                    even_start = curr
                    even_end = curr
                else:
                    self.nodes[even_end].next = curr
                    even_end = curr
            else:
                if odd_start == -1:
                    odd_start = curr
                    odd_end = curr
                else:
                    self.nodes[odd_end].next = curr
                    odd_end = curr

            curr = next_node

        if even_start == -1:
            self.head = odd_start
        else:
            self.head = even_start
            self.nodes[even_end].next = odd_start

    def print_list(self):
        var curr = self.head
        print("[", end="")
        while curr != -1:
            print(self.nodes[curr].data, end="" if self.nodes[curr].next == -1 else " -> ")
            curr = self.nodes[curr].next
        print("]")

def main():
    var ll = LinkedList()
    _ = ll.append(17)
    _ = ll.append(15)
    _ = ll.append(8)
    _ = ll.append(9)
    _ = ll.append(2)
    _ = ll.append(4)
    _ = ll.append(6)

    print("Original List:")
    ll.print_list()

    ll.segregate_even_odd()

    print("After segregating even and odd nodes:")
    ll.print_list()
