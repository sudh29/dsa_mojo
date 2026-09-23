# Array Subset of Another Array
# Pattern: Hash Map / Set Lookup / Frequency Counting
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def is_subset(self, a1: List[Int], a2: List[Int]) -> Bool:
        var n = len(a1)
        var m = len(a2)
        if m > n:
            return False

        # Sort copies of both arrays
        var s1 = List[Int]()
        for i in range(n):
            s1.append(a1[i])
        for i in range(n):
            for j in range(i + 1, n):
                if s1[j] < s1[i]:
                    var t = s1[i]
                    s1[i] = s1[j]
                    s1[j] = t

        var s2 = List[Int]()
        for i in range(m):
            s2.append(a2[i])
        for i in range(m):
            for j in range(i + 1, m):
                if s2[j] < s2[i]:
                    var t = s2[i]
                    s2[i] = s2[j]
                    s2[j] = t

        # Two pointer match
        var p1 = 0
        var p2 = 0
        while p1 < n and p2 < m:
            if s1[p1] == s2[p2]:
                p1 += 1
                p2 += 1
            elif s1[p1] < s2[p2]:
                p1 += 1
            else:
                return False

        return p2 == m

def main():
    var sol = Solution()
    var a1: List[Int] = [11, 1, 13, 21, 3, 7]
    var a2: List[Int] = [11, 3, 7, 1]
    print("Array 1: [11, 1, 13, 21, 3, 7]")
    print("Array 2: [11, 3, 7, 1]")
    print("Is Array 2 subset of Array 1:", "Yes" if sol.is_subset(a1, a2) else "No")

    var a3: List[Int] = [1, 2, 3, 4, 5]
    var a4: List[Int] = [1, 2, 7]
    print("Array 3: [1, 2, 3, 4, 5]")
    print("Array 4: [1, 2, 7]")
    print("Is Array 4 subset of Array 3:", "Yes" if sol.is_subset(a3, a4) else "No")
