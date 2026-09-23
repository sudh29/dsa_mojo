# Heap Sort

def heapify(mut a: List[Int], n: Int, i: Int):
    var largest = i
    var left = 2 * i + 1
    var right = 2 * i + 2
    if left < n and a[left] > a[largest]:
        largest = left
    if right < n and a[right] > a[largest]:
        largest = right
    if largest != i:
        var temp = a[i]
        a[i] = a[largest]
        a[largest] = temp
        heapify(a, n, largest)

def heap_sort(mut a: List[Int]):
    var n = len(a)
    var i = n // 2 - 1
    while i >= 0:
        heapify(a, n, i)
        i -= 1

    var j = n - 1
    while j > 0:
        var temp = a[0]
        a[0] = a[j]
        a[j] = temp
        heapify(a, j, 0)
        j -= 1

def main():
    var x = List[Int]()
    x.append(12); x.append(11); x.append(13); x.append(5); x.append(6); x.append(7)
    heap_sort(x)
    print("Sorted array (Heap Sort):", end=" ")
    for i in range(len(x)):
        print(x[i], end=" ")
    print()
