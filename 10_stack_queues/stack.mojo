# Stack implementation and basic LIFO operations
# Reference: https://mojolang.org/docs/manual/get-started/

struct SimpleStack:
    var data: List[String]

    def __init__(out self):
        self.data = List[String]()

    def push(mut self, item: String):
        self.data.append(item)

    def pop(mut self) -> String:
        if len(self.data) == 0:
            return ""
        var item = self.data[len(self.data) - 1]
        _ = self.data.pop()
        return item

    def print_stack(self):
        print("[", end="")
        for i in range(len(self.data)):
            print("'", self.data[i], "'", end="" if i == len(self.data) - 1 else ", ")
        print("]")

def main():
    var s = SimpleStack()
    s.push("a")
    s.push("b")
    s.push("c")

    print("Stack after pushing 'a', 'b', 'c':")
    s.print_stack()

    _ = s.pop()
    _ = s.pop()

    print("Stack after popping 2 elements:")
    s.print_stack()
