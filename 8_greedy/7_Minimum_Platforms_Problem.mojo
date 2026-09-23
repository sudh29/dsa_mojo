# Minimum Platforms Problem
# Reference: https://mojolang.org/docs/manual/get-started/

def minimum_platforms(mut arr: List[Int], mut dep: List[Int]) -> Int:
    var n = len(arr)
    # Sort arrival times
    for i in range(n):
        var min_idx = i
        for k in range(i + 1, n):
            if arr[k] < arr[min_idx]:
                min_idx = k
        if min_idx != i:
            var tmp = arr[i]
            arr[i] = arr[min_idx]
            arr[min_idx] = tmp

    # Sort departure times
    for i in range(n):
        var min_idx = i
        for k in range(i + 1, n):
            if dep[k] < dep[min_idx]:
                min_idx = k
        if min_idx != i:
            var tmp = dep[i]
            dep[i] = dep[min_idx]
            dep[min_idx] = tmp

    var plat_needed = 1
    var max_plat = 1
    var i = 1
    var j = 0

    while i < n and j < n:
        if arr[i] <= dep[j]:
            plat_needed += 1
            i += 1
        else:
            plat_needed -= 1
            j += 1

        if plat_needed > max_plat:
            max_plat = plat_needed

    return max_plat

def main():
    var arr = List[Int]()
    arr.append(900)
    arr.append(940)
    arr.append(950)
    arr.append(1100)
    arr.append(1500)
    arr.append(1800)

    var dep = List[Int]()
    dep.append(910)
    dep.append(1200)
    dep.append(1120)
    dep.append(1130)
    dep.append(1900)
    dep.append(2000)

    var min_plat = minimum_platforms(arr, dep)
    print("Minimum platforms required:", min_plat)
