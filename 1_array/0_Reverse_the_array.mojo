# Reverse the Array / String
# Pattern: Two Pointer / In-place Swapping
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def reverse_word(self, s: String) -> String:
        var chars = List[String]()
        for i in range(s.byte_length()):
            chars.append(String(s[byte=i]))
        var n = len(chars)
        for i in range(n // 2):
            var temp = chars[i]
            chars[i] = chars[n - i - 1]
            chars[n - i - 1] = temp
        var result = String()
        for i in range(n):
            result += chars[i]
        return result

    def reverse_array(self, mut arr: List[Int]):
        var start = 0
        var end = len(arr) - 1
        while start < end:
            var temp = arr[start]
            arr[start] = arr[end]
            arr[end] = temp
            start += 1
            end -= 1

def main():
    var sol = Solution()
    
    # Test reverse string
    var word = String("GeeksforGeeks")
    print("Original string:", word)
    print("Reversed string:", sol.reverse_word(word))

    # Test reverse array
    var arr: List[Int] = [1, 2, 3, 4, 5, 6]
    print("Original array: [1, 2, 3, 4, 5, 6]")
    sol.reverse_array(arr)
    print("Reversed array:", end=" [")
    for i in range(len(arr)):
        print(arr[i], end=", " if i < len(arr) - 1 else "")
    print("]")
