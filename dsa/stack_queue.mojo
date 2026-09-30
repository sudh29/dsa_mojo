# Generic Stack and Queue implementations in Mojo 1.1

struct Stack[T: AnyType](Movable) where conforms_to(T, Movable) and conforms_to(T, ImplicitlyCopyable) and conforms_to(T, Deinitable):
    var data: List[Self.T]

    def __init__(out self):
        self.data = List[Self.T]()

    def push(mut self, item: Self.T):
        var val = item
        self.data.append(val^)

    def pop(mut self) -> Self.T:
        return self.data.pop()

    def peek(self) -> Self.T:
        return self.data[len(self.data) - 1]

    def size(self) -> Int:
        return len(self.data)

    def is_empty(self) -> Bool:
        return len(self.data) == 0

struct Queue[T: AnyType](Movable) where conforms_to(T, Movable) and conforms_to(T, ImplicitlyCopyable) and conforms_to(T, Deinitable):
    var data: List[Self.T]
    var head: Int

    def __init__(out self):
        self.data = List[Self.T]()
        self.head = 0

    def enqueue(mut self, item: Self.T):
        var val = item
        self.data.append(val^)

    def dequeue(mut self) -> Self.T:
        var val = self.data[self.head]
        self.head += 1
        return val

    def peek(self) -> Self.T:
        return self.data[self.head]

    def size(self) -> Int:
        return len(self.data) - self.head

    def is_empty(self) -> Bool:
        return self.head >= len(self.data)
