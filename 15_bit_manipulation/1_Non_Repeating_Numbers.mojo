# Non-Repeating Numbers (Two Unique Elements)
# Reference: https://mojolang.org/docs/manual/get-started/

struct UniquePair:
    var first: Int
    var second: Int

    def __init__(out self, first: Int, second: Int):
        self.first = first
        self.second = second

def single_number(nums: List[Int]) -> UniquePair:
    var xor_sum = 0
    for i in range(len(nums)):
        xor_sum ^= nums[i]

    # Rightmost set bit
    var right_set_bit = xor_sum & (-xor_sum)

    var x = 0
    var y = 0

    for i in range(len(nums)):
        if (nums[i] & right_set_bit) != 0:
            x ^= nums[i]
        else:
            y ^= nums[i]

    if x < y:
        return UniquePair(x, y)
    else:
        return UniquePair(y, x)

def main():
    var nums = List[Int]()
    nums.append(1)
    nums.append(2)
    nums.append(3)
    nums.append(2)
    nums.append(1)
    nums.append(4)

    var res = single_number(nums)
    print("Two non-repeating numbers:", res.first, "and", res.second)
