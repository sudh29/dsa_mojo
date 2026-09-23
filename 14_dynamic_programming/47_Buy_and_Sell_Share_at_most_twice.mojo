# Buy and Sell a Share at most twice

def max_profit(n: Int, price: List[Int]) -> Int:
    if n <= 1:
        return 0
        
    var left_profit = List[Int]()
    var right_profit = List[Int]()
    for _ in range(n):
        left_profit.append(0)
        right_profit.append(0)
        
    var min_price = price[0]
    for i in range(1, n):
        if price[i] < min_price:
            min_price = price[i]
        var p = price[i] - min_price
        left_profit[i] = p if p > left_profit[i - 1] else left_profit[i - 1]
        
    var max_price = price[n - 1]
    var i = n - 2
    while i >= 0:
        if price[i] > max_price:
            max_price = price[i]
        var p = max_price - price[i]
        right_profit[i] = p if p > right_profit[i + 1] else right_profit[i + 1]
        i -= 1
        
    var ans = 0
    for j in range(n):
        var total = left_profit[j] + right_profit[j]
        if total > ans:
            ans = total
            
    return ans^

def main():
    var price = List[Int]()
    price.append(10); price.append(22); price.append(5); price.append(75); price.append(65); price.append(80)
    print("Max profit at most twice:", max_profit(len(price), price))
