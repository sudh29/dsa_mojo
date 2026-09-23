# Minimum number of jumps to reach end

def min_jumps(arr: List[Int], n: Int) -> Int:
    if n <= 1:
        return 0
    if arr[0] == 0:
        return -1
    var jumps = 0
    var current_end = 0
    var farthest = 0
    for i in range(n - 1):
        if i + arr[i] > farthest:
            farthest = i + arr[i]
        if i == current_end:
            jumps += 1
            current_end = farthest
            if current_end >= n - 1:
                return jumps
    return -1

def main():
    var arr = List[Int]()
    arr.append(1); arr.append(3); arr.append(5); arr.append(8); arr.append(9)
    arr.append(2); arr.append(6); arr.append(7); arr.append(6); arr.append(8); arr.append(9)
    print("Min jumps to reach end:", min_jumps(arr, len(arr)))
