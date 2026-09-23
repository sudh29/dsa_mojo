# K-th Smallest Number Again across merged intervals
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def merge_intervals(self, mut starts: List[Int], mut ends: List[Int]):
        var n = len(starts)
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

        # Merge in-place
        var merged_starts = List[Int]()
        var merged_ends = List[Int]()

        if n == 0:
            return

        var cur_s = starts[0]
        var cur_e = ends[0]

        for i in range(1, n):
            if cur_e >= starts[i]:
                cur_e = max(cur_e, ends[i])
            else:
                merged_starts.append(cur_s)
                merged_ends.append(cur_e)
                cur_s = starts[i]
                cur_e = ends[i]

        merged_starts.append(cur_s)
        merged_ends.append(cur_e)

        starts = merged_starts^
        ends = merged_ends^

    def query_kth(self, starts: List[Int], ends: List[Int], var k: Int) -> Int:
        for i in range(len(starts)):
            var span = ends[i] - starts[i] + 1
            if span >= k:
                return starts[i] + k - 1
            else:
                k -= span

        return -1

def main():
    var sol = Solution()
    var starts: List[Int] = [1, 5]
    var ends: List[Int] = [3, 7]
    sol.merge_intervals(starts, ends)

    print("Merged Intervals:")
    for i in range(len(starts)):
        print("[", starts[i], ",", ends[i], "]")

    print("1st smallest:", sol.query_kth(starts, ends, 1))
    print("3rd smallest:", sol.query_kth(starts, ends, 3))
    print("5th smallest:", sol.query_kth(starts, ends, 5))
    print("10th smallest:", sol.query_kth(starts, ends, 10))
