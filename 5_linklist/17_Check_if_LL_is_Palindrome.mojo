# Check if a Linked List is Palindrome
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

    def is_palindrome(self) -> Bool:
        var vals = List[Int]()
        var curr = self.head
        while curr != -1:
            vals.append(self.nodes[curr].data)
            curr = self.nodes[curr].next

        var n = len(vals)
        for i in range(n // 2):
            if vals[i] != vals[n - 1 - i]:
                return False

        return True

    def print_list(self):
        var curr = self.head
        print("[", end="")
        while curr != -1:
            print(self.nodes[curr].data, end="" if self.nodes[curr].next == -1 else " -> ")
            curr = self.nodes[curr].next
        print("]")

def main():
    var ll1 = LinkedList()
    _ = ll1.append(1); _ = ll1.append(2); _ = ll1.append(2); _ = ll1.append(1)
    print("List 1: "); ll1.print_list()
    print("Is Palindrome?", ll1.is_palindrome())

    var ll2 = LinkedList()
    _ = ll2.append(1); _ = ll2.append(2); _ = ll2.append(3)
    print("List 2: "); ll2.print_list()
    print("Is Palindrome?", ll2.is_palindrome())
