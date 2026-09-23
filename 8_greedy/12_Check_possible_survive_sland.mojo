# Check if it is Possible to Survive on Island
# Reference: https://mojolang.org/docs/manual/get-started/

def minimum_days_to_survive(s: Int, n: Int, m: Int) -> Int:
    # Cannot survive if daily consumption > daily buying capacity
    # Or if surviving > 6 days and 6 buying days cannot cover 7 days of consumption
    if m > n or (s > 6 and (n * 6) < (m * 7)):
        return -1

    var total_food = s * m
    var days = total_food // n
    if total_food % n > 0:
        days += 1

    return days

def main():
    # S = 10, N = 16, M = 2
    print("Days to survive (10, 16, 2):", minimum_days_to_survive(10, 16, 2))

    # S = 10, N = 9, M = 8 (Cannot survive Sunday)
    print("Days to survive (10, 9, 8):", minimum_days_to_survive(10, 9, 8))
