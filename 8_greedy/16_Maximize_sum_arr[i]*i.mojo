# Maximize Sum of arr[i] * i
# Reference: https://mojolang.org/docs/manual/get-started/

def maximize_product_index_sum(mut arr: List[Int]) -> Int:
    var n = len(arr)
    var mod = 1000000007

    # Sort array ascending
    for i in range(n):
        var min_idx = i
        for j in range(i + 1, n):
            if arr[j] < arr[min_idx]:
                min_idx = j
        if min_idx != i:
            var tmp = arr[i]
            arr[i] = arr[min_idx]
            arr[min_idx] = tmp

    var total_sum = 0
    for i in range(n):
        total_sum = (total_sum + arr[i] * i) % mod

    return total_sum

def main():
    var arr = List[Int]()
    arr.append(5)
    arr.append(3)
    arr.append(2)
    arr.append(4)
    arr.append(1)

    print("Max sum of arr[i] * i:", maximize_product_index_sum(arr))
