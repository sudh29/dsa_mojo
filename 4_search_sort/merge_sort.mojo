# Merge Sort Algorithm

def merge(mut a: List[Int], left: Int, mid: Int, right: Int):
    var temp = List[Int]()
    var i = left
    var j = mid + 1

    while i <= mid and j <= right:
        if a[i] <= a[j]:
            temp.append(a[i])
            i += 1
        else:
            temp.append(a[j])
            j += 1

    while i <= mid:
        temp.append(a[i])
        i += 1

    while j <= right:
        temp.append(a[j])
        j += 1

    for k in range(len(temp)):
        a[left + k] = temp[k]

def merge_sort_range(mut a: List[Int], left: Int, right: Int):
    if left < right:
        var mid = left + (right - left) // 2
        merge_sort_range(a, left, mid)
        merge_sort_range(a, mid + 1, right)
        merge(a, left, mid, right)

def merge_sort(mut a: List[Int]):
    if len(a) > 1:
        merge_sort_range(a, 0, len(a) - 1)

def main():
    var a = List[Int]()
    a.append(5); a.append(2); a.append(6); a.append(7); a.append(2); a.append(1); a.append(0); a.append(3)
    merge_sort(a)
    print("Sorted array (Merge Sort):", end=" ")
    for i in range(len(a)):
        print(a[i], end=" ")
    print()
