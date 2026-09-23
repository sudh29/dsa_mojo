# Implement Stack using an Array
# Reference: https://mojolang.org/docs/manual/get-started/

struct Stack:
    var capacity: Int
    var top: Int
    var a: List[Int]

    def __init__(out self, capacity: Int = 1000):
        self.capacity = capacity
        self.top = -1
        self.a = List[Int]()
        for _ in range(capacity):
            self.a.append(0)

    def push(mut self, x: Int) -> Bool:
        if self.top >= (self.capacity - 1):
            print("Stack Overflow")
            return False
        self.top += 1
        self.a[self.top] = x
        return True

    def pop(mut self) -> Int:
        if self.top < 0:
            print("Stack Underflow")
            return -1
        var x = self.a[self.top]
        self.top -= 1
        return x

    def peek(self) -> Int:
        if self.top < 0:
            print("Stack is Empty")
            return -1
        return self.a[self.top]

    def is_empty(self) -> Bool:
        return self.top < 0

def main():
    var stack = Stack(100)
    _ = stack.push(10)
    _ = stack.push(20)
    _ = stack.push(30)

    print("Peek top element:", stack.peek())
    print("Popped element:", stack.pop())
    print("Peek after pop:", stack.peek())
    print("Is empty?", stack.is_empty())
