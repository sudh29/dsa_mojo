# Implement Queue using an Array (Circular Queue)
# Reference: https://mojolang.org/docs/manual/get-started/

struct Queue:
    var capacity: Int
    var front: Int
    var rear: Int
    var size: Int
    var array: List[Int]

    def __init__(out self, capacity: Int = 100):
        self.capacity = capacity
        self.front = 0
        self.size = 0
        self.rear = capacity - 1
        self.array = List[Int]()
        for _ in range(capacity):
            self.array.append(0)

    def is_full(self) -> Bool:
        return self.size == self.capacity

    def is_empty(self) -> Bool:
        return self.size == 0

    def enqueue(mut self, item: Int) -> Bool:
        if self.is_full():
            print("Queue is full")
            return False
        self.rear = (self.rear + 1) % self.capacity
        self.array[self.rear] = item
        self.size += 1
        return True

    def dequeue(mut self) -> Int:
        if self.is_empty():
            print("Queue is empty")
            return -1
        var item = self.array[self.front]
        self.front = (self.front + 1) % self.capacity
        self.size -= 1
        return item

    def get_front(self) -> Int:
        if self.is_empty():
            return -1
        return self.array[self.front]

    def get_rear(self) -> Int:
        if self.is_empty():
            return -1
        return self.array[self.rear]

def main():
    var q = Queue(5)
    _ = q.enqueue(10)
    _ = q.enqueue(20)
    _ = q.enqueue(30)

    print("Front element:", q.get_front())
    print("Rear element:", q.get_rear())
    print("Dequeued:", q.dequeue())
    print("Front after dequeue:", q.get_front())
