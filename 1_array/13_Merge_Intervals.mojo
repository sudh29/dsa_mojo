# Merge Overlapping Intervals
# Pattern: Sorting / Interval Merging
# Reference: https://mojolang.org/docs/manual/get-started/

struct Interval(ImplicitlyCopyable, Movable):
    var start: Int
    var end: Int

    def __init__(out self, start: Int, end: Int):
        self.start = start
        self.end = end

    def __init__(out self, *, copy: Interval):
        self.start = copy.start
        self.end = copy.end

struct Solution:
    def __init__(out self):
        pass

    def merge_intervals(self, var intervals: List[Interval]) -> List[Interval]:
        var n = len(intervals)
        if n <= 1:
            return intervals^

        # Sort intervals by start time
        for i in range(n):
            for j in range(i + 1, n):
                if intervals[j].start < intervals[i].start:
                    var t = intervals[i]
                    intervals[i] = intervals[j]
                    intervals[j] = t

        var result = List[Interval]()
        var current = intervals[0]

        for i in range(1, n):
            var next_int = intervals[i]
            if current.end >= next_int.start:
                var max_end = current.end if current.end > next_int.end else next_int.end
                current.end = max_end
            else:
                result.append(current)
                current = next_int
        result.append(current)
        return result^

def main():
    var sol = Solution()
    var intervals = List[Interval]()
    intervals.append(Interval(1, 3))
    intervals.append(Interval(2, 6))
    intervals.append(Interval(8, 10))
    intervals.append(Interval(15, 18))

    print("Original intervals: [[1, 3], [2, 6], [8, 10], [15, 18]]")
    var merged = sol.merge_intervals(intervals^)
    print("Merged intervals:", end=" [")
    for i in range(len(merged)):
        print("[" + String(merged[i].start) + ", " + String(merged[i].end) + "]", end=", " if i < len(merged) - 1 else "")
    print("]")
