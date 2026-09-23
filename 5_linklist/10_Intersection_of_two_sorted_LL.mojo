# Intersection of two sorted Linked Lists
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

    def print_list(self):
        var curr = self.head
        print("[", end="")
        while curr != -1:
            print(self.nodes[curr].data, end="" if self.nodes[curr].next == -1 else " -> ")
            curr = self.nodes[curr].next
        print("]")

struct Solution:
    def __init__(out self):
        pass

    def find_intersection(self, l1: LinkedList, l2: LinkedList) -> LinkedList:
        var res = LinkedList()
        var c1 = l1.head
        var c2 = l2.head

        while c1 != -1 and c2 != -1:
            var v1 = l1.nodes[c1].data
            var v2 = l2.nodes[c2].data

            if v1 == v2:
                _ = res.append(v1)
                c1 = l1.nodes[c1].next
                c2 = l2.nodes[c2].next
            elif v1 < v2:
                c1 = l1.nodes[c1].next
            else:
                c2 = l2.nodes[c2].next

        return res^

def main():
    var sol = Solution()
    var l1 = LinkedList()
    _ = l1.append(1); _ = l1.append(2); _ = l1.append(3); _ = l1.append(4); _ = l1.append(6)

    var l2 = LinkedList()
    _ = l2.append(2); _ = l2.append(4); _ = l2.append(6); _ = l2.append(8)

    print("List 1: "); l1.print_list()
    print("List 2: "); l2.print_list()

    var intersection = sol.find_intersection(l1, l2)
    print("Intersection: "); intersection.print_list()
