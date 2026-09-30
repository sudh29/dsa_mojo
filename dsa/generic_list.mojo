# Generic Linked List implementation in Mojo 1.1
# Parameterized over any Movable, ImplicitlyCopyable, and Deinitable type.

struct GenericNode[T: AnyType](ImplicitlyCopyable, Movable) where conforms_to(T, Movable) and conforms_to(T, ImplicitlyCopyable) and conforms_to(T, Deinitable):
    var data: Self.T
    var next: Int

    def __init__(out self, data: Self.T, next: Int = -1):
        self.data = data
        self.next = next

    def __init__(out self, *, copy: Self):
        self.data = copy.data
        self.next = copy.next

struct GenericLinkedList[T: AnyType](Movable) where conforms_to(T, Movable) and conforms_to(T, ImplicitlyCopyable) and conforms_to(T, Deinitable):
    var nodes: List[GenericNode[Self.T]]
    var head: Int

    def __init__(out self):
        self.nodes = List[GenericNode[Self.T]]()
        self.head = -1

    def append(mut self, data: Self.T) -> Int:
        var idx = len(self.nodes)
        var node = GenericNode[Self.T](data, -1)
        self.nodes.append(node^)
        if self.head == -1:
            self.head = idx
        else:
            var curr = self.head
            while self.nodes[curr].next != -1:
                curr = self.nodes[curr].next
            self.nodes[curr].next = idx
        return idx

    def prepend(mut self, data: Self.T) -> Int:
        var idx = len(self.nodes)
        var node = GenericNode[Self.T](data, self.head)
        self.nodes.append(node^)
        self.head = idx
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

    def size(self) -> Int:
        var count = 0
        var curr = self.head
        while curr != -1:
            count += 1
            curr = self.nodes[curr].next
        return count

    def is_empty(self) -> Bool:
        return self.head == -1

    def to_list(self) -> List[Self.T]:
        var res = List[Self.T]()
        var curr = self.head
        while curr != -1:
            var val = self.nodes[curr].data
            res.append(val^)
            curr = self.nodes[curr].next
        return res^
