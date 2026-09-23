# Bishu and Soldiers: Count soldiers defeated and cumulative power
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

    def answer_query(self, mut soldier_powers: List[Int], bishnu_power: Int) -> List[Int]:
        self.sort_arr(soldier_powers)
        var count = 0
        var total_strength = 0

        for i in range(len(soldier_powers)):
            if soldier_powers[i] <= bishnu_power:
                count += 1
                total_strength += soldier_powers[i]
            else:
                break

        var res = List[Int]()
        res.append(count)
        res.append(total_strength)
        return res^

def main():
    var sol = Solution()
    var soldiers: List[Int] = [1, 2, 3, 4, 5, 6, 7]
    var queries: List[Int] = [3, 10, 2]
    print("Soldier Powers: [1, 2, 3, 4, 5, 6, 7]")
    for q in range(len(queries)):
        var power = queries[q]
        var ans = sol.answer_query(soldiers, power)
        print("Query with Bishu Power", power, "-> Defeated:", ans[0], ", Total Power:", ans[1])
