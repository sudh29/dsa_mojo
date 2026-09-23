# Longest subsequence such that difference between adjacent is one

def longest_subseq(n: Int, a: List[Int]) -> Int:
    if n == 0:
        return 0
    var dp = List[Int]()
    for _ in range(n):
        dp.append(1)
    
    for i in range(1, n):
        for j in range(i):
            var diff = a[i] - a[j]
            if diff < 0:
                diff = -diff
            if diff == 1:
                if dp[j] + 1 > dp[i]:
                    dp[i] = dp[j] + 1
                    
    var ans = dp[0]
    for i in range(1, n):
        if dp[i] > ans:
            ans = dp[i]
    return ans^

def main():
    var a = List[Int]()
    a.append(10)
    a.append(9)
    a.append(4)
    a.append(5)
    a.append(4)
    a.append(8)
    a.append(6)
    print("Longest subsequence with diff 1:", longest_subseq(len(a), a))
