# Array Removals

def sort_arr(mut arr: List[Int]):
    for i in range(len(arr)):
        for j in range(i + 1, len(arr)):
            if arr[j] < arr[i]:
                var temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp

def removals(mut arr: List[Int], n: Int, k: Int) -> Int:
    if n <= 1:
        return 0
    sort_arr(arr)
    var min_rem = n
    var j = 0
    for i in range(n):
        while j < n and arr[j] - arr[i] <= k:
            j += 1
        var cur_rem = n - (j - i)
        if cur_rem < min_rem:
            min_rem = cur_rem
    return min_rem

def main():
    var arr = List[Int]()
    arr.append(1); arr.append(3); arr.append(4); arr.append(9); arr.append(10); arr.append(11); arr.append(12); arr.append(17); arr.append(20)
    var k = 4
    print("Array removals:", removals(arr, len(arr), k))
