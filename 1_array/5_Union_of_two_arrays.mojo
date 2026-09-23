# Union and Intersection of Two Arrays
# Pattern: Hashing / Two Pointer Technique
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def do_union_count(self, a: List[Int], b: List[Int]) -> Int:
        var combined = List[Int]()
        for i in range(len(a)):
            combined.append(a[i])
        for i in range(len(b)):
            combined.append(b[i])
            
        # Sort combined
        for i in range(len(combined)):
            for j in range(i + 1, len(combined)):
                if combined[j] < combined[i]:
                    var temp = combined[i]
                    combined[i] = combined[j]
                    combined[j] = temp

        if len(combined) == 0:
            return 0
        var distinct_count = 1
        for i in range(1, len(combined)):
            if combined[i] != combined[i - 1]:
                distinct_count += 1
        return distinct_count

    def intersect(self, mut a: List[Int], mut b: List[Int]) -> List[Int]:
        # Sort both
        for i in range(len(a)):
            for j in range(i + 1, len(a)):
                if a[j] < a[i]:
                    var t = a[i]
                    a[i] = a[j]
                    a[j] = t

        for i in range(len(b)):
            for j in range(i + 1, len(b)):
                if b[j] < b[i]:
                    var t = b[i]
                    b[i] = b[j]
                    b[j] = t

        var res = List[Int]()
        var i = 0
        var j = 0
        while i < len(a) and j < len(b):
            if a[i] < b[j]:
                i += 1
            elif a[i] > b[j]:
                j += 1
            else:
                res.append(a[i])
                i += 1
                j += 1
        return res^

def main():
    var sol = Solution()
    var a: List[Int] = [1, 2, 3, 4, 5]
    var b: List[Int] = [1, 2, 3]
    print("Array A: [1, 2, 3, 4, 5]")
    print("Array B: [1, 2, 3]")
    print("Union distinct count:", sol.do_union_count(a, b))
    var inter = sol.intersect(a, b)
    print("Intersection:", end=" [")
    for i in range(len(inter)):
        print(inter[i], end=", " if i < len(inter) - 1 else "")
    print("]")
