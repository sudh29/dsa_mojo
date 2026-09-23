# Largest Sum Contiguous Subarray (Kadane's Algorithm)

def max_sub_array_sum(arr: List[Int]) -> Int:
    var n = len(arr)
    if n == 0:
        return 0
    var max_so_far = arr[0]
    var current_max = arr[0]
    for i in range(1, n):
        var with_curr = current_max + arr[i]
        current_max = arr[i] if arr[i] > with_curr else with_curr
        if current_max > max_so_far:
            max_so_far = current_max
    return max_so_far

def main():
    var arr = List[Int]()
    arr.append(-2); arr.append(-3); arr.append(4); arr.append(-1); arr.append(-2); arr.append(1); arr.append(5); arr.append(-3)
    print("Largest sum contiguous subarray:", max_sub_array_sum(arr))
