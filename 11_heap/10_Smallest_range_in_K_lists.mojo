# Smallest range covering at least one element from each of K sorted lists
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def smallest_range(self, lists: List[List[Int]], k: Int) -> List[Int]:
        var ptrs = List[Int]()
        for _ in range(k):
            ptrs.append(0)

        var min_range = 1000000000
        var range_start = 0
        var range_end = 0

        while True:
            var min_val = 1000000000
            var max_val = -1000000000
            var min_list_idx = -1

            for i in range(k):
                var val = lists[i][ptrs[i]]
                if val < min_val:
                    min_val = val
                    min_list_idx = i
                if val > max_val:
                    max_val = val

            if (max_val - min_val) < min_range:
                min_range = max_val - min_val
                range_start = min_val
                range_end = max_val

            ptrs[min_list_idx] += 1
            if ptrs[min_list_idx] == len(lists[min_list_idx]):
                break

        var res = List[Int]()
        res.append(range_start)
        res.append(range_end)
        return res^

def main():
    var sol = Solution()
    var lists = List[List[Int]]()

    var l1: List[Int] = [4, 10, 15, 24, 26]
    var l2: List[Int] = [0, 9, 12, 20]
    var l3: List[Int] = [5, 18, 22, 30]
    lists.append(l1^)
    lists.append(l2^)
    lists.append(l3^)

    var r = sol.smallest_range(lists, 3)
    print("Smallest range covering at least one element from each of 3 lists: [", r[0], ",", r[1], "]")
