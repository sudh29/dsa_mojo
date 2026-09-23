# Hello World and Basic Control Flow

def main():
    var hi = String("hello world")
    print(hi)

    var color = String("cat")
    var color2 = String(" in the sea.")
    print(color + color2)

    if color == "fish":
        print("fish")
    elif color == "cat":
        print("cat")
    else:
        print("rat")

    for num in range(1, 4):
        print(num)

    var count = 0
    while count < 3:
        print("count:", count)
        count += 1
