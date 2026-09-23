# Convert Sentence into Its Equivalent Mobile Numeric Keypad Sequence
# Pattern: Lookup Mapping / String Encoding
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def char_to_keypad(self, c: String) -> String:
        if c == "A" or c == "a": return "2"
        elif c == "B" or c == "b": return "22"
        elif c == "C" or c == "c": return "222"
        elif c == "D" or c == "d": return "3"
        elif c == "E" or c == "e": return "33"
        elif c == "F" or c == "f": return "333"
        elif c == "G" or c == "g": return "4"
        elif c == "H" or c == "h": return "44"
        elif c == "I" or c == "i": return "444"
        elif c == "J" or c == "j": return "5"
        elif c == "K" or c == "k": return "55"
        elif c == "L" or c == "l": return "555"
        elif c == "M" or c == "m": return "6"
        elif c == "N" or c == "n": return "66"
        elif c == "O" or c == "o": return "666"
        elif c == "P" or c == "p": return "7"
        elif c == "Q" or c == "q": return "77"
        elif c == "R" or c == "r": return "777"
        elif c == "S" or c == "s": return "7777"
        elif c == "T" or c == "t": return "8"
        elif c == "U" or c == "u": return "88"
        elif c == "V" or c == "v": return "888"
        elif c == "W" or c == "w": return "9"
        elif c == "X" or c == "x": return "99"
        elif c == "Y" or c == "y": return "999"
        elif c == "Z" or c == "z": return "9999"
        elif c == " ": return "0"
        return ""

    def print_sequence(self, s: String) -> String:
        var res = String("")
        for i in range(s.byte_length()):
            res += self.char_to_keypad(String(s[byte=i]))
        return res^

def main():
    var sol = Solution()
    var s = String("GEEKSFORGEEKS")
    print("Sentence:", s)
    print("Keypad Sequence:", sol.print_sequence(s))

    var s2 = String("HELLO WORLD")
    print("Sentence:", s2)
    print("Keypad Sequence:", sol.print_sequence(s2))
