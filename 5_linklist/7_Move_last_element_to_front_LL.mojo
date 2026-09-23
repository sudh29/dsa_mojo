# Move last element to front of a given Linked List
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

    def move_to_front(mut self):
        if self.head == -1 or self.nodes[self.head].next == -1:
            return

        var prev = -1
        var curr = self.head

        while self.nodes[curr].next != -1:
            prev = curr
            curr = self.nodes[curr].next

        # curr is now last node, prev is second last
        self.nodes[prev].next = -1
        self.nodes[curr].next = self.head
        self.head = curr

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
    _ = ll.append(3)
    _ = ll.append(4)
    _ = ll.append(5)

    print("Before moving last to front:")
    ll.print_list()

    ll.move_to_front()

    print("After moving last to front:")
    ll.print_list()
