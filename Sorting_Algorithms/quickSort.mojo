# Quick Sort Algorithm

def partition(mut a: List[Int], start: Int, end: Int) -> Int:
    var pivot = a[end]
    var p_index = start
    for i in range(start, end):
        if a[i] <= pivot:
            var temp = a[i]
            a[i] = a[p_index]
            a[p_index] = temp
            p_index += 1
    var temp2 = a[p_index]
    a[p_index] = a[end]
    a[end] = temp2
    return p_index

def quick_sort_range(mut a: List[Int], start: Int, end: Int):
    if start < end:
        var p = partition(a, start, end)
        quick_sort_range(a, start, p - 1)
        quick_sort_range(a, p + 1, end)

def quick_sort(mut a: List[Int]):
    if len(a) > 1:
        quick_sort_range(a, 0, len(a) - 1)

def main():
    var x = List[Int]()
    x.append(5); x.append(22); x.append(-6); x.append(7); x.append(2); x.append(1); x.append(0); x.append(3)
    quick_sort(x)
    print("Sorted array (Quick Sort):", end=" ")
    for i in range(len(x)):
        print(x[i], end=" ")
    print()
