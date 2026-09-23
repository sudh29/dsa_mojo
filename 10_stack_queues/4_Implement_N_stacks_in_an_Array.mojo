# Implement K Stacks in a single Array of size N
# Reference: https://mojolang.org/docs/manual/get-started/

struct KStacks:
    var k: Int
    var n: Int
    var arr: List[Int]
    var top: List[Int]
    var next_arr: List[Int]
    var free_idx: Int

    def __init__(out self, k: Int, n: Int):
        self.k = k
        self.n = n
        self.arr = List[Int]()
        self.top = List[Int]()
        self.next_arr = List[Int]()
        self.free_idx = 0

        for _ in range(n):
            self.arr.append(0)

        for _ in range(k):
            self.top.append(-1)

        for i in range(n - 1):
            self.next_arr.append(i + 1)
        self.next_arr.append(-1)

    def is_full(self) -> Bool:
        return self.free_idx == -1

    def is_empty(self, sn: Int) -> Bool:
        return self.top[sn] == -1

    def push(mut self, item: Int, sn: Int) -> Bool:
        if self.is_full():
            print("Stack Overflow")
            return False

        var i = self.free_idx
        self.free_idx = self.next_arr[i]
        self.next_arr[i] = self.top[sn]
        self.top[sn] = i
        self.arr[i] = item
        return True

    def pop(mut self, sn: Int) -> Int:
        if self.is_empty(sn):
            print("Stack Underflow")
            return -1

        var i = self.top[sn]
        self.top[sn] = self.next_arr[i]
        self.next_arr[i] = self.free_idx
        self.free_idx = i
        return self.arr[i]

def main():
    var k = 3
    var n = 10
    var ks = KStacks(k, n)

    _ = ks.push(15, 2)
    _ = ks.push(45, 2)
    _ = ks.push(17, 1)
    _ = ks.push(49, 1)
    _ = ks.push(39, 1)
    _ = ks.push(11, 0)
    _ = ks.push(9, 0)
    _ = ks.push(7, 0)

    print("Popped from stack 2:", ks.pop(2))
    print("Popped from stack 1:", ks.pop(1))
    print("Popped from stack 0:", ks.pop(0))
