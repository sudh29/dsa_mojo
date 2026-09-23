# Reverse a Linked List in groups of given size k
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

    def reverse_k_group_from(mut self, node_idx: Int, k: Int) -> Int:
        if node_idx == -1:
            return -1

        var curr = node_idx
        var prev = -1
        var next_node = -1
        var count = 0

        while curr != -1 and count < k:
            next_node = self.nodes[curr].next
            self.nodes[curr].next = prev
            prev = curr
            curr = next_node
            count += 1

        if next_node != -1:
            self.nodes[node_idx].next = self.reverse_k_group_from(next_node, k)

        return prev

    def reverse_in_groups(mut self, k: Int):
        self.head = self.reverse_k_group_from(self.head, k)

    def print_list(self):
        var curr = self.head
        print("[", end="")
        while curr != -1:
            print(self.nodes[curr].data, end="" if self.nodes[curr].next == -1 else " -> ")
            curr = self.nodes[curr].next
        print("]")

def main():
    var ll = LinkedList()
    for i in range(1, 9):
        _ = ll.append(i)

    print("Original List:")
    ll.print_list()

    var k = 3
    print("Reversing in groups of k =", k)
    ll.reverse_in_groups(k)
    ll.print_list()
