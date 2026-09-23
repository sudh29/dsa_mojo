# Merge Overlapping Intervals
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def merge_intervals(self, mut starts: List[Int], mut ends: List[Int]) -> List[List[Int]]:
        var n = len(starts)
        var res = List[List[Int]]()
        if n == 0:
            return res^

        # Sort intervals by start time
        for i in range(n):
            for j in range(0, n - i - 1):
                if starts[j] > starts[j + 1]:
                    var ts = starts[j]
                    starts[j] = starts[j + 1]
                    starts[j + 1] = ts

                    var te = ends[j]
                    ends[j] = ends[j + 1]
                    ends[j + 1] = te

        var cur_start = starts[0]
        var cur_end = ends[0]

        for i in range(1, n):
            if ends[i - 1] >= starts[i] or cur_end >= starts[i]:
                cur_end = max(cur_end, ends[i])
            else:
                var interval = List[Int]()
                interval.append(cur_start)
                interval.append(cur_end)
                res.append(interval^)

                cur_start = starts[i]
                cur_end = ends[i]

        var last_interval = List[Int]()
        last_interval.append(cur_start)
        last_interval.append(cur_end)
        res.append(last_interval^)

        return res^

def main():
    var sol = Solution()
    var starts: List[Int] = [1, 2, 5, 6]
    var ends: List[Int] = [3, 4, 7, 8]
    var merged = sol.merge_intervals(starts, ends)
    print("Input: [[1, 3], [2, 4], [5, 7], [6, 8]]")
    print("Merged Intervals:")
    for i in range(len(merged)):
        print("[", merged[i][0], ",", merged[i][1], "]")
