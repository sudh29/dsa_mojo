# Design a stack with operations on middle element in O(1) time
# Reference: https://mojolang.org/docs/manual/get-started/

struct DLLNode:
    var data: Int
    var prev: Int
    var next: Int

    def __init__(out self, data: Int, prev: Int = -1, next: Int = -1):
        self.data = data
        self.prev = prev
        self.next = next

struct MidStack:
    var nodes: List[DLLNode]
    var head: Int
    var mid: Int
    var count: Int

    def __init__(out self):
        self.nodes = List[DLLNode]()
        self.head = -1
        self.mid = -1
        self.count = 0

    def push(mut self, data: Int):
        var new_node_idx = len(self.nodes)
        self.nodes.append(DLLNode(data, -1, self.head))

        if self.head != -1:
            self.nodes[self.head].prev = new_node_idx

        self.head = new_node_idx
        self.count += 1

        if self.count == 1:
            self.mid = new_node_idx
        elif self.count % 2 != 0:
            self.mid = self.nodes[self.mid].prev

    def pop(mut self) -> Int:
        if self.count == 0:
            print("Stack Underflow")
            return -1

        var popped_val = self.nodes[self.head].data
        self.head = self.nodes[self.head].next

        if self.head != -1:
            self.nodes[self.head].prev = -1

        self.count -= 1

        if self.count % 2 == 0:
            if self.mid != -1:
                self.mid = self.nodes[self.mid].next

        return popped_val

    def find_middle(self) -> Int:
        if self.count == 0:
            return -1
        return self.nodes[self.mid].data

def main():
    var ms = MidStack()
    ms.push(11)
    ms.push(22)
    ms.push(33)
    ms.push(44)
    ms.push(55)

    print("Middle element:", ms.find_middle())
    print("Popped:", ms.pop())
    print("Middle element after pop:", ms.find_middle())
    print("Popped:", ms.pop())
    print("Middle element after pop:", ms.find_middle())
