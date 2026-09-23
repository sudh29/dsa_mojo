# Remove loop in Linked List
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

    def remove_loop(mut self):
        var slow = self.head
        var fast = self.head
        var loop_node = -1

        while fast != -1 and self.nodes[fast].next != -1:
            slow = self.nodes[slow].next
            fast = self.nodes[self.nodes[fast].next].next
            if slow == fast:
                loop_node = slow
                break

        if loop_node != -1:
            # Check if loop starts at head
            slow = self.head
            if slow == loop_node:
                while self.nodes[fast].next != slow:
                    fast = self.nodes[fast].next
                self.nodes[fast].next = -1
            else:
                while self.nodes[slow].next != self.nodes[fast].next:
                    slow = self.nodes[slow].next
                    fast = self.nodes[fast].next
                self.nodes[fast].next = -1

    def print_list(self):
        var curr = self.head
        var count = 0
        print("[", end="")
        while curr != -1 and count < 20:
            print(self.nodes[curr].data, end="" if self.nodes[curr].next == -1 else " -> ")
            curr = self.nodes[curr].next
            count += 1
        print("]")

def main():
    var ll = LinkedList()
    _ = ll.append(1)
    _ = ll.append(2)
    var target = ll.append(3)
    _ = ll.append(4)
    _ = ll.append(5)

    ll.create_loop(target)
    print("Loop present before removal?", ll.detect_loop())

    ll.remove_loop()
    print("Loop present after removal?", ll.detect_loop())

    print("List after loop removal:")
    ll.print_list()
