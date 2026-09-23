# Deletion and Reverse in a Circular Linked List
# Reference: https://mojolang.org/docs/manual/get-started/

struct Node:
    var data: Int
    var next: Int

    def __init__(out self, data: Int, next: Int = -1):
        self.data = data
        self.next = next

struct CircularLinkedList:
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
            self.nodes[idx].next = idx
        else:
            var curr = self.head
            while self.nodes[curr].next != self.head:
                curr = self.nodes[curr].next
            self.nodes[curr].next = idx
            self.nodes[idx].next = self.head
        return idx

    def delete_node(mut self, key: Int):
        if self.head == -1:
            return

        var curr = self.head
        var prev = -1

        # Check if head is the node to delete
        if self.nodes[self.head].data == key:
            # Find the last node
            while self.nodes[curr].next != self.head:
                curr = self.nodes[curr].next

            if curr == self.head:
                self.head = -1
                return

            self.nodes[curr].next = self.nodes[self.head].next
            self.head = self.nodes[self.head].next
            return

        curr = self.head
        while self.nodes[curr].next != self.head and self.nodes[curr].data != key:
            prev = curr
            curr = self.nodes[curr].next

        if self.nodes[curr].data == key:
            self.nodes[prev].next = self.nodes[curr].next

    def reverse(mut self):
        if self.head == -1:
            return

        var prev = -1
        var curr = self.head
        var next_node = -1

        # Break circularity temporarily to reverse
        var last = self.head
        while self.nodes[last].next != self.head:
            last = self.nodes[last].next

        while True:
            next_node = self.nodes[curr].next
            self.nodes[curr].next = prev
            prev = curr
            curr = next_node
            if curr == self.head:
                break

        self.nodes[self.head].next = prev
        self.head = prev

    def print_list(self):
        if self.head == -1:
            print("[]")
            return
        var curr = self.head
        print("[", end="")
        while True:
            print(self.nodes[curr].data, end="")
            curr = self.nodes[curr].next
            if curr == self.head:
                break
            print(" -> ", end="")
        print("]")

def main():
    var cll = CircularLinkedList()
    for i in range(1, 6):
        _ = cll.append(i)

    print("Initial Circular List:")
    cll.print_list()

    print("Deleting node 3:")
    cll.delete_node(3)
    cll.print_list()

    print("Reversing circular list:")
    cll.reverse()
    cll.print_list()
