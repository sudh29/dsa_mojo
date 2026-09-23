# Remove duplicate element from sorted Linked List
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

    def remove_duplicates(mut self):
        var curr = self.head
        while curr != -1 and self.nodes[curr].next != -1:
            var next_node = self.nodes[curr].next
            if self.nodes[curr].data == self.nodes[next_node].data:
                self.nodes[curr].next = self.nodes[next_node].next
            else:
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
    _ = ll.append(2)
    _ = ll.append(2)
    _ = ll.append(4)
    _ = ll.append(5)
    _ = ll.append(5)
    _ = ll.append(5)

    print("Original sorted list:")
    ll.print_list()

    ll.remove_duplicates()

    print("List after removing duplicates:")
    ll.print_list()
