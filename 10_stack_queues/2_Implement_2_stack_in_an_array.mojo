# Implement Two Stacks in an Array
# Reference: https://mojolang.org/docs/manual/get-started/

struct TwoStacks:
    var size: Int
    var arr: List[Int]
    var top1: Int
    var top2: Int

    def __init__(out self, size: Int = 100):
        self.size = size
        self.arr = List[Int]()
        for _ in range(size):
            self.arr.append(0)
        self.top1 = -1
        self.top2 = size

    def push1(mut self, x: Int) -> Bool:
        if self.top2 - self.top1 > 1:
            self.top1 += 1
            self.arr[self.top1] = x
            return True
        else:
            print("Stack 1 Overflow")
            return False

    def push2(mut self, x: Int) -> Bool:
        if self.top2 - self.top1 > 1:
            self.top2 -= 1
            self.arr[self.top2] = x
            return True
        else:
            print("Stack 2 Overflow")
            return False

    def pop1(mut self) -> Int:
        if self.top1 == -1:
            return -1
        var val = self.arr[self.top1]
        self.top1 -= 1
        return val

    def pop2(mut self) -> Int:
        if self.top2 == self.size:
            return -1
        var val = self.arr[self.top2]
        self.top2 += 1
        return val

def main():
    var ts = TwoStacks(10)
    _ = ts.push1(5)
    _ = ts.push2(10)
    _ = ts.push2(15)
    _ = ts.push1(11)
    _ = ts.push2(7)

    print("Popped from stack 1:", ts.pop1())
    print("Popped from stack 2:", ts.pop2())
