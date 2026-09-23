# Sort a Stack using Recursion
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def sorted_insert(self, mut s: List[Int], element: Int):
        if len(s) == 0 or element > s[len(s) - 1]:
            s.append(element)
            return

        var temp = s[len(s) - 1]
        _ = s.pop()
        self.sorted_insert(s, element)
        s.append(temp)

    def sort_stack(self, mut s: List[Int]):
        if len(s) > 0:
            var temp = s[len(s) - 1]
            _ = s.pop()
            self.sort_stack(s)
            self.sorted_insert(s, temp)

def main():
    var sol = Solution()
    var s: List[Int] = [30, -5, 18, 14, -3]
    print("Stack before sorting:", end=" [")
    for i in range(len(s)):
        print(s[i], end=", " if i < len(s) - 1 else "")
    print("]")

    sol.sort_stack(s)

    print("Stack after sorting (bottom to top):", end=" [")
    for i in range(len(s)):
        print(s[i], end=", " if i < len(s) - 1 else "")
    print("]")
