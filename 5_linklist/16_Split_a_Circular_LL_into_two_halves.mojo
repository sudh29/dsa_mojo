# Split a Circular Linked List into two halves
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

    def split_into_two_halves(mut self) -> List[Int]:
        var res = List[Int]()
        if self.head == -1:
            res.append(-1); res.append(-1)
            return res^

        var slow = self.head
        var fast = self.head

        while self.nodes[fast].next != self.head and self.nodes[self.nodes[fast].next].next != self.head:
            slow = self.nodes[slow].next
            fast = self.nodes[self.nodes[fast].next].next

        if self.nodes[self.nodes[fast].next].next == self.head:
            fast = self.nodes[fast].next

        var head1 = self.head
        var head2 = self.nodes[slow].next

        self.nodes[fast].next = self.nodes[slow].next
        self.nodes[slow].next = self.head

        res.append(head1)
        res.append(head2)
        return res^

    def print_circular(self, start_head: Int):
        if start_head == -1:
            print("[]")
            return
        var curr = start_head
        print("[", end="")
        while True:
            print(self.nodes[curr].data, end="")
            curr = self.nodes[curr].next
            if curr == start_head:
                break
            print(" -> ", end="")
        print("]")

def main():
    var cll = CircularLinkedList()
    for i in range(1, 7):
        _ = cll.append(i)

    print("Original Circular List:")
    cll.print_circular(cll.head)

    var heads = cll.split_into_two_halves()
    print("First Half:")
    cll.print_circular(heads[0])
    print("Second Half:")
    cll.print_circular(heads[1])
