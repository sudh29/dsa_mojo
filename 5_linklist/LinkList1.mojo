# Complete Singly Linked List Data Structure and Operations
# Reference: https://mojolang.org/docs/manual/get-started/

struct Node:
    var data: Int
    var next: Int

    def __init__(out self, data: Int, next: Int = -1):
        self.data = data
        self.next = next

struct LinkList:
    var nodes: List[Node]
    var head: Int

    def __init__(out self):
        self.nodes = List[Node]()
        self.head = -1

    def push(mut self, new_data: Int):
        var idx = len(self.nodes)
        self.nodes.append(Node(new_data, self.head))
        self.head = idx

    def append(mut self, new_data: Int):
        var idx = len(self.nodes)
        self.nodes.append(Node(new_data, -1))
        if self.head == -1:
            self.head = idx
            return

        var current = self.head
        while self.nodes[current].next != -1:
            current = self.nodes[current].next
        self.nodes[current].next = idx

    def insert_after(mut self, prev_node_idx: Int, new_data: Int):
        if prev_node_idx < 0 or prev_node_idx >= len(self.nodes):
            print("Given previous node index is invalid")
            return
        var idx = len(self.nodes)
        self.nodes.append(Node(new_data, self.nodes[prev_node_idx].next))
        self.nodes[prev_node_idx].next = idx

    def delete_node(mut self, key: Int):
        var current = self.head
        var prev = -1

        if current != -1 and self.nodes[current].data == key:
            self.head = self.nodes[current].next
            return

        while current != -1 and self.nodes[current].data != key:
            prev = current
            current = self.nodes[current].next

        if current == -1:
            return

        self.nodes[prev].next = self.nodes[current].next

    def delete_list(mut self):
        self.head = -1
        self.nodes.clear()

    def print_list(self):
        var current = self.head
        print("[", end="")
        while current != -1:
            print(self.nodes[current].data, end="" if self.nodes[current].next == -1 else " -> ")
            current = self.nodes[current].next
        print("]")

def main():
    var l_list = LinkList()
    l_list.append(6)
    l_list.push(7)
    l_list.push(1)
    l_list.append(4)
    l_list.append(11)

    print("Linked list created:")
    l_list.print_list()

    print("Deleting node 4:")
    l_list.delete_node(4)
    l_list.print_list()

    print("Deleting entire list:")
    l_list.delete_list()
    l_list.print_list()
