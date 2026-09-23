# Longest Consecutive Subsequence
# Pattern: Sorting / Hash Set / Counting
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def find_longest_conseq_subseq(self, mut arr: List[Int]) -> Int:
        var n = len(arr)
        if n <= 1:
            return n

        # Sort array
        for i in range(n):
            for j in range(i + 1, n):
                if arr[j] < arr[i]:
                    var t = arr[i]
                    arr[i] = arr[j]
                    arr[j] = t

        var max_len = 1
        var curr_len = 1

        for i in range(1, n):
            if arr[i] == arr[i - 1]:
                continue
            elif arr[i] == arr[i - 1] + 1:
                curr_len += 1
                if curr_len > max_len:
                    max_len = curr_len
            else:
                curr_len = 1

        return max_len

def main():
    var sol = Solution()
    var arr: List[Int] = [2, 6, 1, 9, 4, 5, 3]
    print("Array: [2, 6, 1, 9, 4, 5, 3]")
    print("Length of Longest Consecutive Subsequence:", sol.find_longest_conseq_subseq(arr))

    var arr2: List[Int] = [1, 9, 3, 10, 4, 20, 2]
    print("Array 2: [1, 9, 3, 10, 4, 20, 2]")
    print("Length of Longest Consecutive Subsequence:", sol.find_longest_conseq_subseq(arr2))
