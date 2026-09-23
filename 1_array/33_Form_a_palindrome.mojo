# Form a Palindrome (Min Insertions / Min Merges)
# Pattern: Dynamic Programming / Two Pointer
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    # Minimum insertions to make string a palindrome (2D DP)
    def min_insertions(self, s: String) -> Int:
        var n = s.byte_length()
        if n <= 1:
            return 0

        # Initialize n x n 2D DP table with zeros
        var dp = List[List[Int]]()
        for i in range(n):
            var row = List[Int]()
            for j in range(n):
                row.append(0)
            dp.append(row^)

        for gap in range(1, n):
            var l = 0
            for h in range(gap, n):
                if s[byte=l] == s[byte=h]:
                    dp[l][h] = dp[l + 1][h - 1]
                else:
                    var opt1 = dp[l][h - 1]
                    var opt2 = dp[l + 1][h]
                    var min_val = opt1 if opt1 < opt2 else opt2
                    dp[l][h] = min_val + 1
                l += 1

        return dp[0][n - 1]

    # Minimum merge operations to make array a palindrome (Two Pointer)
    def min_merge_operations(self, mut arr: List[Int]) -> Int:
        var n = len(arr)
        var left = 0
        var right = n - 1
        var merges = 0

        while left <= right:
            if arr[left] == arr[right]:
                left += 1
                right -= 1
            elif arr[left] < arr[right]:
                left += 1
                arr[left] = arr[left] + arr[left - 1]
                merges += 1
            else:
                right -= 1
                arr[right] = arr[right] + arr[right + 1]
                merges += 1

        return merges

def main():
    var sol = Solution()
    var str1 = String("abcd")
    print("String 1:", str1)
    print("Min insertions to make palindrome:", sol.min_insertions(str1))

    var str2 = String("aba")
    print("String 2:", str2)
    print("Min insertions to make palindrome:", sol.min_insertions(str2))

    var arr: List[Int] = [1, 4, 5, 9, 1]
    print("Array: [1, 4, 5, 9, 1]")
    print("Min merges to make array palindrome:", sol.min_merge_operations(arr))
