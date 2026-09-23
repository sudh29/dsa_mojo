# File & Buffer Operations Demonstration

struct SimpleBuffer:
    var data: String
    var position: Int

    def __init__(out self):
        self.data = String()
        self.position = 0

    def write(mut self, text: String):
        self.data += text
        self.position = self.data.byte_length()

    def seek(mut self, pos: Int):
        if pos <= self.data.byte_length():
            self.position = pos

    def read(mut self, length: Int) -> String:
        var res = String()
        var end = self.position + length
        if end > self.data.byte_length():
            end = self.data.byte_length()
        for i in range(self.position, end):
            res += self.data[byte=i]
        self.position = end
        return res^

def main():
    var buf = SimpleBuffer()
    buf.write("Mojo is a great systems language.\nYeah its fast!!\n")
    print("Buffer length:", buf.data.byte_length())
    print("Current position:", buf.position)

    buf.seek(0)
    var chunk1 = buf.read(10)
    print("Read chunk 1:", chunk1)

    buf.seek(0)
    var chunk2 = buf.read(20)
    print("Read chunk 2:", chunk2)
