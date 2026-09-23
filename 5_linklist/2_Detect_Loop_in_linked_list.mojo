# Detect Loop in Linked List using Floyd's Cycle-Finding Algorithm (Tortoise and Hare)
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

    def detect_loop(self) -> Bool:
        var slow = self.head
        var fast = self.head

        while fast != -1 and self.nodes[fast].next != -1:
            slow = self.nodes[slow].next
            fast = self.nodes[self.nodes[fast].next].next

            if slow == fast and slow != -1:
                return True

        return False

def main():
    var ll1 = LinkedList()
    _ = ll1.append(1)
    _ = ll1.append(2)
    _ = ll1.append(3)
    _ = ll1.append(4)
    print("List without loop: Loop detected?", ll1.detect_loop())

    var ll2 = LinkedList()
    _ = ll2.append(10)
    var target = ll2.append(20)
    _ = ll2.append(30)
    _ = ll2.append(40)
    ll2.create_loop(target)
    print("List with loop to node 20: Loop detected?", ll2.detect_loop())
