# Buy Maximum Stocks if i Stocks Can be Bought on i-th Day
# Reference: https://mojolang.org/docs/manual/get-started/

struct StockDay(ImplicitlyCopyable, Movable):
    var price: Int
    var max_qty: Int

    def __init__(out self, price: Int, max_qty: Int):
        self.price = price
        self.max_qty = max_qty

    def __init__(out self, *, copy: StockDay):
        self.price = copy.price
        self.max_qty = copy.max_qty

def buy_maximum_products(n: Int, k: Int, price: List[Int]) -> Int:
    var days = List[StockDay]()
    for i in range(n):
        days.append(StockDay(price[i], i + 1))

    # Sort days ascending by stock price
    for i in range(n):
        var min_idx = i
        for j in range(i + 1, n):
            if days[j].price < days[min_idx].price:
                min_idx = j
        if min_idx != i:
            var tmp = days[i]
            days[i] = days[min_idx]
            days[min_idx] = tmp

    var budget = k
    var total_bought = 0

    for i in range(n):
        var p = days[i].price
        var qty = days[i].max_qty

        if p * qty <= budget:
            total_bought += qty
            budget -= p * qty
        else:
            total_bought += budget // p
            break

    return total_bought

def main():
    var price = List[Int]()
    price.append(10)
    price.append(7)
    price.append(19)

    var k = 45
    var ans = buy_maximum_products(len(price), k, price)
    print("Maximum stocks that can be bought with", k, ":", ans)
