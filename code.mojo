# Minimum Platforms and Array Utilities

def sort_float_list(mut arr: List[Float64]):
    for i in range(len(arr)):
        for j in range(i + 1, len(arr)):
            if arr[j] < arr[i]:
                var temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp

def min_platform(mut arrival: List[Float64], mut departure: List[Float64]) -> Int:
    var n = len(arrival)
    sort_float_list(arrival)
    sort_float_list(departure)
    
    var i = 0
    var j = 0
    var platforms_needed = 0
    var max_platforms = 0
    
    while i < n and j < n:
        if arrival[i] < departure[j]:
            platforms_needed += 1
            i += 1
            if platforms_needed > max_platforms:
                max_platforms = platforms_needed
        else:
            platforms_needed -= 1
            j += 1
            
    return max_platforms

def min_steps_to_zero(arr: List[Int]) -> Int:
    var max_val = 0
    for i in range(len(arr)):
        if arr[i] > max_val:
            max_val = arr[i]
    return max_val

def main():
    var arrival = List[Float64]()
    arrival.append(9.00); arrival.append(9.40); arrival.append(9.50)
    arrival.append(11.00); arrival.append(15.00); arrival.append(18.00)

    var departure = List[Float64]()
    departure.append(9.10); departure.append(12.00); departure.append(11.20)
    departure.append(11.30); departure.append(19.00); departure.append(20.00)

    print("Minimum platforms needed:", min_platform(arrival, departure))

    var arr = List[Int]()
    arr.append(1); arr.append(5); arr.append(6)
    print("Steps to reduce array to zero:", min_steps_to_zero(arr))
