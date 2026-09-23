# Buy and Sell Stock III (At Most 2 Transactions)
# Pattern: Dynamic Programming / Bidirectional Scan
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def max_profit(self, prices: List[Int]) -> Int:
        var n = len(prices)
        if n <= 1:
            return 0

        # left[i] stores max profit possible in prices[0..i]
        var left = List[Int]()
        for _ in range(n):
            left.append(0)

        var min_price = prices[0]
        var max_left_profit = 0
        for i in range(1, n):
            if prices[i] < min_price:
                min_price = prices[i]
            var profit = prices[i] - min_price
            if profit > max_left_profit:
                max_left_profit = profit
            left[i] = max_left_profit

        # right[i] stores max profit possible in prices[i..n-1]
        var right = List[Int]()
        for _ in range(n):
            right.append(0)

        var max_price = prices[n - 1]
        var max_right_profit = 0
        for i in range(n - 2, -1, -1):
            if prices[i] > max_price:
                max_price = prices[i]
            var profit = max_price - prices[i]
            if profit > max_right_profit:
                max_right_profit = profit
            right[i] = max_right_profit

        # Combine two transactions
        var total_max_profit = right[0]
        for i in range(n - 1):
            var combined = left[i] + right[i + 1]
            if combined > total_max_profit:
                total_max_profit = combined

        return total_max_profit

def main():
    var sol = Solution()
    var prices1: List[Int] = [3, 3, 5, 0, 0, 3, 1, 4]
    print("Stock prices 1: [3, 3, 5, 0, 0, 3, 1, 4]")
    print("Max profit (at most 2 transactions):", sol.max_profit(prices1))

    var prices2: List[Int] = [1, 2, 3, 4, 5]
    print("Stock prices 2: [1, 2, 3, 4, 5]")
    print("Max profit (at most 2 transactions):", sol.max_profit(prices2))
