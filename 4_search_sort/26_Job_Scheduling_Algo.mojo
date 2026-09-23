# Maximum Profit Job Scheduling (Weighted Interval Scheduling)
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def sort_jobs(self, mut starts: List[Int], mut ends: List[Int], mut profits: List[Int]):
        var n = len(starts)
        for i in range(n):
            for j in range(0, n - i - 1):
                if ends[j] > ends[j + 1]:
                    var te = ends[j]
                    ends[j] = ends[j + 1]
                    ends[j + 1] = te

                    var ts = starts[j]
                    starts[j] = starts[j + 1]
                    starts[j + 1] = ts

                    var tp = profits[j]
                    profits[j] = profits[j + 1]
                    profits[j + 1] = tp

    def job_scheduling(self, mut start_time: List[Int], mut end_time: List[Int], mut profit: List[Int]) -> Int:
        var n = len(start_time)
        if n == 0:
            return 0

        self.sort_jobs(start_time, end_time, profit)

        var dp = List[Int]()
        for _ in range(n):
            dp.append(0)
        dp[0] = profit[0]

        for i in range(1, n):
            var inc = profit[i]
            var last = -1
            var low = 0
            var high = i - 1

            while low <= high:
                var mid = low + (high - low) // 2
                if end_time[mid] <= start_time[i]:
                    last = mid
                    low = mid + 1
                else:
                    high = mid - 1

            if last != -1:
                inc += dp[last]

            var exc = dp[i - 1]
            dp[i] = max(inc, exc)

        return dp[n - 1]

def main():
    var sol = Solution()
    var start_time: List[Int] = [1, 2, 3, 3]
    var end_time: List[Int] = [3, 4, 5, 6]
    var profit: List[Int] = [50, 10, 40, 70]
    print("Job Scheduling Max Profit:", sol.job_scheduling(start_time, end_time, profit))
