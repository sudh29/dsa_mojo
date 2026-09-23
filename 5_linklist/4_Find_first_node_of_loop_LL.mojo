# Find first node of loop in a Linked List
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

    def create_loop(mut self, loop_to_index: Int):
        if len(self.nodes) == 0 or loop_to_index >= len(self.nodes):
            return
        var last = self.head
        while self.nodes[last].next != -1:
            last = self.nodes[last].next
        self.nodes[last].next = loop_to_index

    def find_loop_start_node(self) -> Int:
        var slow = self.head
        var fast = self.head
        var found = False

        while fast != -1 and self.nodes[fast].next != -1:
            slow = self.nodes[slow].next
            fast = self.nodes[self.nodes[fast].next].next
            if slow == fast:
                found = True
                break

        if not found:
            return -1

        slow = self.head
        while slow != fast:
            slow = self.nodes[slow].next
            fast = self.nodes[fast].next

        return slow

def main():
    var ll = LinkedList()
    _ = ll.append(10)
    _ = ll.append(20)
    var loop_start = ll.append(30)
    _ = ll.append(40)
    _ = ll.append(50)

    ll.create_loop(loop_start)

    var start_idx = ll.find_loop_start_node()
    if start_idx != -1:
        print("Loop starts at node index:", start_idx, "with value:", ll.nodes[start_idx].data)
    else:
        print("No loop found")
