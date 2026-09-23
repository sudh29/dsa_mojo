# Multiply two Linked Lists modulo 10^9 + 7
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

    def print_number(self):
        var curr = self.head
        while curr != -1:
            print(self.nodes[curr].data, end="")
            curr = self.nodes[curr].next
        print()

struct Solution:
    def __init__(out self):
        pass

    def multiply_two_lists(self, l1: LinkedList, l2: LinkedList) -> Int:
        var mod = 1000000007
        var num1 = 0
        var num2 = 0

        var c1 = l1.head
        while c1 != -1:
            num1 = (num1 * 10 + l1.nodes[c1].data) % mod
            c1 = l1.nodes[c1].next

        var c2 = l2.head
        while c2 != -1:
            num2 = (num2 * 10 + l2.nodes[c2].data) % mod
            c2 = l2.nodes[c2].next

        return (num1 * num2) % mod

def main():
    var sol = Solution()
    var l1 = LinkedList()
    _ = l1.append(3)
    _ = l1.append(2)

    var l2 = LinkedList()
    _ = l2.append(2)

    print("List 1: ", end=""); l1.print_number()
    print("List 2: ", end=""); l2.print_number()

    print("Product (mod 10^9+7):", sol.multiply_two_lists(l1, l2))
