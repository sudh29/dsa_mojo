# Delete nodes which have a greater value on their right side
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

    def delete_nodes_less_than_right(mut self):
        if self.head == -1 or self.nodes[self.head].next == -1:
            return

        # 1. Reverse list
        self.reverse()

        # 2. Traverse reversed list, keeping max so far
        var current = self.head
        var max_node = self.head

        while current != -1 and self.nodes[current].next != -1:
            var next_node = self.nodes[current].next
            if self.nodes[next_node].data < self.nodes[max_node].data:
                self.nodes[current].next = self.nodes[next_node].next
            else:
                current = next_node
                max_node = next_node

        # 3. Reverse back to original order
        self.reverse()

    def print_list(self):
        var curr = self.head
        print("[", end="")
        while curr != -1:
            print(self.nodes[curr].data, end="" if self.nodes[curr].next == -1 else " -> ")
            curr = self.nodes[curr].next
        print("]")

def main():
    var ll = LinkedList()
    _ = ll.append(12)
    _ = ll.append(15)
    _ = ll.append(10)
    _ = ll.append(11)
    _ = ll.append(5)
    _ = ll.append(6)
    _ = ll.append(2)
    _ = ll.append(3)

    print("Original List:")
    ll.print_list()

    ll.delete_nodes_less_than_right()

    print("After deleting nodes with greater on right:")
    ll.print_list()
