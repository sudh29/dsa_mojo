# Longest alternating subsequence

def alternating_max_length(arr: List[Int]) -> Int:
    var n = len(arr)
    if n == 0:
        return 0
    var up = 1
    var down = 1
    for i in range(1, n):
        if arr[i] > arr[i - 1]:
            up = down + 1
        elif arr[i] < arr[i - 1]:
            down = up + 1
    return up if up > down else down

def main():
    var arr = List[Int]()
    arr.append(1); arr.append(5); arr.append(4)
    print("Longest alternating subsequence length:", alternating_max_length(arr))
