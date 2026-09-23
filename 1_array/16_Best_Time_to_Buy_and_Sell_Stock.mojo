# Best Time to Buy and Sell Stock
# Pattern: Greedy / One Pass
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def max_profit(self, prices: List[Int]) -> Int:
        var n = len(prices)
        if n <= 1:
            return 0

        var min_price = prices[0]
        var max_profit = 0

        for i in range(1, n):
            if prices[i] < min_price:
                min_price = prices[i]
            var profit = prices[i] - min_price
            if profit > max_profit:
                max_profit = profit

        return max_profit

def main():
    var sol = Solution()
    var prices: List[Int] = [7, 1, 5, 3, 6, 4]
    print("Stock prices: [7, 1, 5, 3, 6, 4]")
    print("Maximum profit:", sol.max_profit(prices))
