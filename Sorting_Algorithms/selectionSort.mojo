# Selection Sort Algorithm

def selection_sort(mut a: List[Int]):
    var n = len(a)
    for i in range(n):
        var min_idx = i
        for j in range(i + 1, n):
            if a[j] < a[min_idx]:
                min_idx = j
        if min_idx != i:
            var temp = a[i]
            a[i] = a[min_idx]
            a[min_idx] = temp

def main():
    var x = List[Int]()
    x.append(5); x.append(2); x.append(6); x.append(7); x.append(2); x.append(1); x.append(0); x.append(3)
    selection_sort(x)
    print("Sorted array (Selection Sort):", end=" ")
    for i in range(len(x)):
        print(x[i], end=" ")
    print()
