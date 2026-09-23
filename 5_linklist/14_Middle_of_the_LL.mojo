# Middle of the Linked List
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

    def find_middle_node(self) -> Int:
        var slow = self.head
        var fast = self.head

        while fast != -1 and self.nodes[fast].next != -1:
            slow = self.nodes[slow].next
            fast = self.nodes[self.nodes[fast].next].next

        if slow != -1:
            return self.nodes[slow].data
        return -1

    def print_list(self):
        var curr = self.head
        print("[", end="")
        while curr != -1:
            print(self.nodes[curr].data, end="" if self.nodes[curr].next == -1 else " -> ")
            curr = self.nodes[curr].next
        print("]")

def main():
    var ll1 = LinkedList()
    for i in range(1, 6):
        _ = ll1.append(i)

    print("List 1 (odd count):")
    ll1.print_list()
    print("Middle Node Value:", ll1.find_middle_node())

    var ll2 = LinkedList()
    for i in range(1, 7):
        _ = ll2.append(i)

    print("List 2 (even count):")
    ll2.print_list()
    print("Middle Node Value:", ll2.find_middle_node())
