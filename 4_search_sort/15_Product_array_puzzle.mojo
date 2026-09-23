# Product of Array Except Self (Product array puzzle)
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def product_except_self(self, nums: List[Int], n: Int) -> List[Int]:
        var total_product = 1
        var total_product_without_zero = 1
        var count_zeros = 0

        for i in range(n):
            total_product *= nums[i]
            if nums[i] != 0:
                total_product_without_zero *= nums[i]
            else:
                count_zeros += 1

        var res = List[Int]()
        for i in range(n):
            if count_zeros > 1:
                res.append(0)
            elif count_zeros == 1:
                if nums[i] == 0:
                    res.append(total_product_without_zero)
                else:
                    res.append(0)
            else:
                res.append(total_product // nums[i])

        return res^

def main():
    var sol = Solution()
    var nums1: List[Int] = [10, 3, 5, 6, 2]
    var res1 = sol.product_except_self(nums1, len(nums1))

    print("Input: [10, 3, 5, 6, 2]")
    print("Product except self:", end=" [")
    for i in range(len(res1)):
        print(res1[i], end=", " if i < len(res1) - 1 else "")
    print("]")

    var nums2: List[Int] = [12, 0]
    var res2 = sol.product_except_self(nums2, len(nums2))
    print("Input: [12, 0]")
    print("Product except self:", end=" [")
    for i in range(len(res2)):
        print(res2[i], end=", " if i < len(res2) - 1 else "")
    print("]")
