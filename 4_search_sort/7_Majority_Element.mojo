# Majority Element using Boyer-Moore Voting Algorithm (appears > N/2 times)
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def majority_element(self, arr: List[Int]) -> Int:
        var size = len(arr)
        if size == 0:
            return -1

        var candidate = arr[0]
        var count = 1

        for i in range(1, size):
            if arr[i] == candidate:
                count += 1
            else:
                count -= 1

            if count == 0:
                candidate = arr[i]
                count = 1

        # Verification step
        var actual_count = 0
        for i in range(size):
            if arr[i] == candidate:
                actual_count += 1

        if actual_count > (size // 2):
            return candidate

        return -1

def main():
    var sol = Solution()
    var arr1: List[Int] = [3, 1, 3, 3, 2]
    var arr2: List[Int] = [1, 2, 3]
    print("Array 1 majority element:", sol.majority_element(arr1))
    print("Array 2 majority element:", sol.majority_element(arr2))
