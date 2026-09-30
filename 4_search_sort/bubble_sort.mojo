# Bubble Sort

def bubble_sort(mut a: List[Int]):
    var n = len(a)
    for k in range(1, n):
        var flag = 0
        for i in range(n - k):
            if a[i] > a[i + 1]:
                var temp = a[i]
                a[i] = a[i + 1]
                a[i + 1] = temp
                flag = 1
        if flag == 0:
            break

from std.testing import assert_true, assert_equal

def main() raises:
    var a = List[Int]()
    a.append(8); a.append(2); a.append(6); a.append(7); a.append(2); a.append(1); a.append(0); a.append(3)
    bubble_sort(a)
    print("Sorted array (Bubble Sort):", end=" ")
    for i in range(len(a)):
        print(a[i], end=" ")
    print()
    assert_equal(len(a), 8)
    for i in range(len(a) - 1):
        assert_true(a[i] <= a[i + 1])
