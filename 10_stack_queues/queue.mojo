# Queue implementation and basic FIFO operations
# Reference: https://mojolang.org/docs/manual/get-started/

struct SimpleQueue:
    var data: List[String]
    var front_idx: Int

    def __init__(out self):
        self.data = List[String]()
        self.front_idx = 0

    def append(mut self, item: String):
        self.data.append(item)

    def pop_left(mut self) -> String:
        if self.front_idx >= len(self.data):
            return ""
        var item = self.data[self.front_idx]
        self.front_idx += 1
        return item

    def print_queue(self):
        print("[", end="")
        for i in range(self.front_idx, len(self.data)):
            print("'", self.data[i], "'", end="" if i == len(self.data) - 1 else ", ")
        print("]")

def main():
    var q = SimpleQueue()
    q.append("a")
    q.append("b")
    q.append("c")

    print("Queue after enqueuing 'a', 'b', 'c':")
    q.print_queue()

    _ = q.pop_left()
    _ = q.pop_left()

    print("Queue after popping 2 elements:")
    q.print_queue()
