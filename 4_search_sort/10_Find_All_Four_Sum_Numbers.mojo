# Find all unique quadruplets that sum up to a target number (4-Sum)
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def sort_arr(self, mut arr: List[Int]):
        var n = len(arr)
        for i in range(n):
            for j in range(0, n - i - 1):
                if arr[j] > arr[j + 1]:
                    var tmp = arr[j]
                    arr[j] = arr[j + 1]
                    arr[j + 1] = tmp

    def four_sum(self, mut arr: List[Int], total_k: Int) -> List[List[Int]]:
        self.sort_arr(arr)
        var n = len(arr)
        var res = List[List[Int]]()

        for i in range(n - 3):
            if i > 0 and arr[i] == arr[i - 1]:
                continue

            for j in range(i + 1, n - 2):
                if j > i + 1 and arr[j] == arr[j - 1]:
                    continue

                var k = j + 1
                var l = n - 1

                while k < l:
                    var current_sum = arr[i] + arr[j] + arr[k] + arr[l]

                    if current_sum == total_k:
                        var quad = List[Int]()
                        quad.append(arr[i])
                        quad.append(arr[j])
                        quad.append(arr[k])
                        quad.append(arr[l])
                        res.append(quad^)

                        while k < l and arr[k] == arr[k + 1]:
                            k += 1
                        while k < l and arr[l] == arr[l - 1]:
                            l -= 1

                        k += 1
                        l -= 1
                    elif current_sum < total_k:
                        k += 1
                    else:
                        l -= 1

        return res^

def main():
    var sol = Solution()
    var arr: List[Int] = [0, 0, 2, 1, 1]
    var target = 3

    var quadruplets = sol.four_sum(arr, target)
    print("4-Sum Target:", target)
    print("Unique Quadruplets found:")
    for i in range(len(quadruplets)):
        print("[", quadruplets[i][0], ",", quadruplets[i][1], ",", quadruplets[i][2], ",", quadruplets[i][3], "]")
