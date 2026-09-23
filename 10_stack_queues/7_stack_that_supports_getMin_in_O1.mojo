# Special Stack that supports getMin() in O(1) time and O(1) extra space
# Reference: https://mojolang.org/docs/manual/get-started/

struct SpecialStack:
    var s: List[Int]
    var min_stack: List[Int]

    def __init__(out self):
        self.s = List[Int]()
        self.min_stack = List[Int]()

    def push(mut self, x: Int):
        self.s.append(x)
        if len(self.min_stack) == 0 or x <= self.min_stack[len(self.min_stack) - 1]:
            self.min_stack.append(x)

    def pop(mut self) -> Int:
        if len(self.s) == 0:
            print("Stack is Empty")
            return -1

        var top_val = self.s[len(self.s) - 1]
        _ = self.s.pop()

        if top_val == self.min_stack[len(self.min_stack) - 1]:
            _ = self.min_stack.pop()

        return top_val

    def peek(self) -> Int:
        if len(self.s) == 0:
            return -1
        return self.s[len(self.s) - 1]

    def get_min(self) -> Int:
        if len(self.min_stack) == 0:
            return -1
        return self.min_stack[len(self.min_stack) - 1]

    def is_empty(self) -> Bool:
        return len(self.s) == 0

def main():
    var s = SpecialStack()
    s.push(18)
    s.push(19)
    s.push(29)
    s.push(15)
    s.push(16)

    print("Current minimum:", s.get_min()) # 15
    print("Popped:", s.pop())             # 16
    print("Current minimum:", s.get_min()) # 15
    print("Popped:", s.pop())             # 15
    print("Current minimum:", s.get_min()) # 18
