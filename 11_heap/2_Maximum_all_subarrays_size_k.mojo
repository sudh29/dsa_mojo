# Maximum of all subarrays of size k (Sliding Window Maximum)
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def max_of_subarrays(self, arr: List[Int], n: Int, k: Int) -> List[Int]:
        var ans = List[Int]()
        if n == 0 or k <= 0:
            return ans^

        # Deque implementation using list to store indices of window elements
        var dq = List[Int]()
        var dq_head = 0

        for i in range(n):
            # Remove indices that are out of this window
            while dq_head < len(dq) and dq[dq_head] <= (i - k):
                dq_head += 1

            # Remove smaller elements from back of deque
            while len(dq) > dq_head and arr[i] >= arr[dq[len(dq) - 1]]:
                _ = dq.pop()

            dq.append(i)

            # Once the first window of size k is formed, append front to result
            if i >= k - 1:
                ans.append(arr[dq[dq_head]])

        return ans^

def main():
    var sol = Solution()
    var arr: List[Int] = [1, 3, -1, -3, 5, 3, 6, 7]
    var k = 3

    print("Array: [1, 3, -1, -3, 5, 3, 6, 7], k =", k)
    var maxs = sol.max_of_subarrays(arr, len(arr), k)

    print("Maximums in every sliding window:", end=" [")
    for i in range(len(maxs)):
        print(maxs[i], end=", " if i < len(maxs) - 1 else "")
    print("]")
