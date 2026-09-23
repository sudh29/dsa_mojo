# Add two numbers represented by linked lists
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

    def print_number(self):
        var curr = self.head
        while curr != -1:
            print(self.nodes[curr].data, end="")
            curr = self.nodes[curr].next
        print()

struct Solution:
    def __init__(out self):
        pass

    def add_two_lists(self, mut l1: LinkedList, mut l2: LinkedList) -> LinkedList:
        l1.reverse()
        l2.reverse()

        var res = LinkedList()
        var c1 = l1.head
        var c2 = l2.head
        var carry = 0

        while c1 != -1 or c2 != -1 or carry > 0:
            var sum_val = carry
            if c1 != -1:
                sum_val += l1.nodes[c1].data
                c1 = l1.nodes[c1].next
            if c2 != -1:
                sum_val += l2.nodes[c2].data
                c2 = l2.nodes[c2].next

            _ = res.append(sum_val % 10)
            carry = sum_val // 10

        res.reverse()
        return res^

def main():
    var sol = Solution()
    var num1 = LinkedList()
    _ = num1.append(4)
    _ = num1.append(5)

    var num2 = LinkedList()
    _ = num2.append(3)
    _ = num2.append(4)
    _ = num2.append(5)

    print("Num 1: ", end=""); num1.print_number()
    print("Num 2: ", end=""); num2.print_number()

    var sum_ll = sol.add_two_lists(num1, num2)
    print("Sum:   ", end=""); sum_ll.print_number()
