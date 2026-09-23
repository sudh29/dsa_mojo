# Add 1 to a number represented as Linked List
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

    def reverse(mut self):
        var curr = self.head
        var prev = -1
        while curr != -1:
            var next_node = self.nodes[curr].next
            self.nodes[curr].next = prev
            prev = curr
            curr = next_node
        self.head = prev

    def add_one(mut self):
        self.reverse()

        var curr = self.head
        var carry = 1
        var prev = -1

        while curr != -1 and carry > 0:
            var total = self.nodes[curr].data + carry
            self.nodes[curr].data = total % 10
            carry = total // 10
            prev = curr
            curr = self.nodes[curr].next

        if carry > 0:
            var new_node_idx = len(self.nodes)
            self.nodes.append(Node(carry, -1))
            self.nodes[prev].next = new_node_idx

        self.reverse()

    def print_number(self):
        var curr = self.head
        while curr != -1:
            print(self.nodes[curr].data, end="")
            curr = self.nodes[curr].next
        print()

def main():
    var ll = LinkedList()
    _ = ll.append(1)
    _ = ll.append(9)
    _ = ll.append(9)

    print("Initial number: ", end="")
    ll.print_number()

    ll.add_one()

    print("Number + 1:     ", end="")
    ll.print_number()
