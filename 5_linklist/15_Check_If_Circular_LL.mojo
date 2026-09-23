# Check if a Linked List is Circular
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

    def make_circular(mut self):
        if self.head == -1:
            return
        var curr = self.head
        while self.nodes[curr].next != -1:
            curr = self.nodes[curr].next
        self.nodes[curr].next = self.head

    def is_circular(self) -> Bool:
        if self.head == -1:
            return True

        var curr = self.nodes[self.head].next
        while curr != -1 and curr != self.head:
            curr = self.nodes[curr].next

        return curr == self.head

def main():
    var ll1 = LinkedList()
    _ = ll1.append(1); _ = ll1.append(2); _ = ll1.append(3)
    print("Linear list: Is circular?", ll1.is_circular())

    var ll2 = LinkedList()
    _ = ll2.append(1); _ = ll2.append(2); _ = ll2.append(3)
    ll2.make_circular()
    print("Circular list: Is circular?", ll2.is_circular())
