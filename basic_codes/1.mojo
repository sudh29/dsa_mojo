# Basic syntax and arithmetic in Mojo

def main():
    print("Hello world")
    print("Hi this is different way")
    print("This is also other way")

    var a = 123
    var c = 4455.32323
    print("integer:", a)
    print("float:", c)
    print("addition:", Float64(a) + c)
    print("subtraction:", c - Float64(a))
    print("multiplication:", c * Float64(a))
    print("division:", c / Float64(a))

    var m = 10
    var n = 10
    print("Boolean m == n:", m == n)
    print("Boolean m > n:", m > n)
    print("Int(True):", Int(True))
    print("Int(False):", Int(False))
