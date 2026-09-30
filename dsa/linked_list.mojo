# Canonical Linked List implementation in Mojo 1.1

struct Node(ImplicitlyCopyable, Movable):
    var data: Int
    var next: Int

    def __init__(out self, data: Int, next: Int = -1):
        self.data = data
        self.next = next

    def __init__(out self, *, copy: Node):
        self.data = copy.data
        self.next = copy.next

struct LinkedList(Movable):
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

    def reverse(mut self):
        var curr = self.head
        var prev = -1

        while curr != -1:
            var next_node = self.nodes[curr].next
            self.nodes[curr].next = prev
            prev = curr
            curr = next_node

        self.head = prev

    def to_list(self) -> List[Int]:
        var res = List[Int]()
        var curr = self.head
        while curr != -1:
            res.append(self.nodes[curr].data)
            curr = self.nodes[curr].next
        return res^

    def print_list(self):
        var curr = self.head
        print("[", end="")
        while curr != -1:
            print(self.nodes[curr].data, end="" if self.nodes[curr].next == -1 else " -> ")
            curr = self.nodes[curr].next
        print("]")
