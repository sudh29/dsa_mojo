# Find Nth node from the end of a Linked List
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

    def get_nth_from_last(self, n: Int) -> Int:
        if self.head == -1 or n <= 0:
            return -1

        var fast = self.head
        for _ in range(n - 1):
            if self.nodes[fast].next != -1:
                fast = self.nodes[fast].next
            else:
                return -1

        var slow = self.head
        while fast != -1 and self.nodes[fast].next != -1:
            fast = self.nodes[fast].next
            slow = self.nodes[slow].next

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
    var ll = LinkedList()
    for i in range(1, 10):
        _ = ll.append(i)

    print("List:")
    ll.print_list()

    print("2nd node from end:", ll.get_nth_from_last(2))
    print("5th node from end:", ll.get_nth_from_last(5))
    print("9th node from end:", ll.get_nth_from_last(9))
    print("12th node from end:", ll.get_nth_from_last(12))
