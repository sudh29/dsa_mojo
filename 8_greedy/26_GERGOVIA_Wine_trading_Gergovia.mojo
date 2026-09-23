# Wine Trading in Gergovia (GERGOVIA)
# Reference: https://mojolang.org/docs/manual/get-started/

def calculate_work_units(demands: List[Int]) -> Int:
    var total_work_units = 0
    var net_demand = 0

    for i in range(len(demands)):
        net_demand += demands[i]
        total_work_units += net_demand if net_demand >= 0 else -net_demand

    return total_work_units

def main():
    # Example 1: 5 houses: [5, -4, 1, -3, 1] -> work units = 9
    var d1 = List[Int]()
    d1.append(5)
    d1.append(-4)
    d1.append(1)
    d1.append(-3)
    d1.append(1)

    print("Work units for [5, -4, 1, -3, 1]:", calculate_work_units(d1))

    # Example 2: 6 houses: [-1000, -1000, -1000, 1000, 1000, 1000] -> work units = 9000
    var d2 = List[Int]()
    d2.append(-1000)
    d2.append(-1000)
    d2.append(-1000)
    d2.append(1000)
    d2.append(1000)
    d2.append(1000)

    print("Work units for [-1000, -1000, -1000, 1000, 1000, 1000]:", calculate_work_units(d2))
