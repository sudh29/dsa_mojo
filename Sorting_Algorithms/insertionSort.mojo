# Insertion Sort

def insertion_sort(mut a: List[Int]):
    var n = len(a)
    for i in range(1, n):
        var value = a[i]
        var hole = i
        while hole > 0 and a[hole - 1] > value:
            a[hole] = a[hole - 1]
            hole -= 1
        a[hole] = value

def main():
    var x = List[Int]()
    x.append(5); x.append(2); x.append(6); x.append(7); x.append(2); x.append(1); x.append(0); x.append(3)
    insertion_sort(x)
    print("Sorted array (Insertion Sort):", end=" ")
    for i in range(len(x)):
        print(x[i], end=" ")
    print()
