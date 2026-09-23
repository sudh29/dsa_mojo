# Intersection Point in Y Shaped Linked Lists
# Reference: https://mojolang.org/docs/manual/get-started/

struct Node:
    var data: Int
    var next: Int

    def __init__(out self, data: Int, next: Int = -1):
        self.data = data
        self.next = next

struct SharedArena:
    var nodes: List[Node]

    def __init__(out self):
        self.nodes = List[Node]()

    def add_node(mut self, data: Int, next: Int = -1) -> Int:
        var idx = len(self.nodes)
        self.nodes.append(Node(data, next))
        return idx

    def get_length(self, head: Int) -> Int:
        var length = 0
        var curr = head
        while curr != -1:
            length += 1
            curr = self.nodes[curr].next
        return length

    def find_intersection_point(self, head1: Int, head2: Int) -> Int:
        var len1 = self.get_length(head1)
        var len2 = self.get_length(head2)

        var c1 = head1
        var c2 = head2

        if len1 > len2:
            for _ in range(len1 - len2):
                c1 = self.nodes[c1].next
        elif len2 > len1:
            for _ in range(len2 - len1):
                c2 = self.nodes[c2].next

        while c1 != -1 and c2 != -1:
            if c1 == c2:
                return self.nodes[c1].data
            c1 = self.nodes[c1].next
            c2 = self.nodes[c2].next

        return -1

def main():
    var arena = SharedArena()

    # Common segment: 15 -> 30
    var n30 = arena.add_node(30, -1)
    var n15 = arena.add_node(15, n30)

    # List 1: 3 -> 6 -> 9 -> 15 -> 30
    var n9 = arena.add_node(9, n15)
    var n6 = arena.add_node(6, n9)
    var head1 = arena.add_node(3, n6)

    # List 2: 10 -> 15 -> 30
    var head2 = arena.add_node(10, n15)

    var intersection_val = arena.find_intersection_point(head1, head2)
    print("Intersection Point Data Value:", intersection_val)
