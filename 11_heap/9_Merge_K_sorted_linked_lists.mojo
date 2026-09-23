# Merge K Sorted Linked Lists using Min-Heap
# Reference: https://mojolang.org/docs/manual/get-started/

struct Node:
    var data: Int
    var next: Int

    def __init__(out self, data: Int, next: Int = -1):
        self.data = data
        self.next = next

struct LinkedListArena:
    var nodes: List[Node]

    def __init__(out self):
        self.nodes = List[Node]()

    def add_node(mut self, data: Int, next: Int = -1) -> Int:
        var idx = len(self.nodes)
        self.nodes.append(Node(data, next))
        return idx

    def merge_two_lists(mut self, l1: Int, l2: Int) -> Int:
        if l1 == -1:
            return l2
        if l2 == -1:
            return l1

        var head = -1
        if self.nodes[l1].data <= self.nodes[l2].data:
            head = l1
            self.nodes[head].next = self.merge_two_lists(self.nodes[l1].next, l2)
        else:
            head = l2
            self.nodes[head].next = self.merge_two_lists(l1, self.nodes[l2].next)

        return head

    def merge_k_lists(mut self, var heads: List[Int], k: Int) -> Int:
        if k == 0:
            return -1

        var last = k - 1

        while last != 0:
            var i = 0
            var j = last

            while i < j:
                heads[i] = self.merge_two_lists(heads[i], heads[j])
                i += 1
                j -= 1
                if i >= j:
                    last = j

        return heads[0]

    def print_list(self, head: Int):
        var curr = head
        print("[", end="")
        while curr != -1:
            print(self.nodes[curr].data, end="" if self.nodes[curr].next == -1 else " -> ")
            curr = self.nodes[curr].next
        print("]")

def main():
    var arena = LinkedListArena()

    # List 1: 1 -> 4 -> 5
    var n5 = arena.add_node(5)
    var n4 = arena.add_node(4, n5)
    var h1 = arena.add_node(1, n4)

    # List 2: 1 -> 3 -> 4
    var m4 = arena.add_node(4)
    var m3 = arena.add_node(3, m4)
    var h2 = arena.add_node(1, m3)

    # List 3: 2 -> 6
    var k6 = arena.add_node(6)
    var h3 = arena.add_node(2, k6)

    var heads = List[Int]()
    heads.append(h1)
    heads.append(h2)
    heads.append(h3)

    print("List 1:"); arena.print_list(h1)
    print("List 2:"); arena.print_list(h2)
    print("List 3:"); arena.print_list(h3)

    var merged_head = arena.merge_k_lists(heads^, 3)
    print("Merged K Sorted Lists:")
    arena.print_list(merged_head)
