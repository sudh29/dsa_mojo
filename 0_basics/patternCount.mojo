# Pattern Matching Count (Overlapping and Non-Overlapping)

def pattern_check(a: List[Int], b: List[Int]) -> Int:
    var len_a = len(a)
    var len_b = len(b)
    var i = 0
    var count = 0
    while i + len_a <= len_b:
        var is_match = True
        for j in range(len_a):
            if b[i + j] != a[j]:
                is_match = False
                break
        if is_match:
            count += 1
            i += len_a
        else:
            i += 1
    return count

def pattern_check_over(a: List[Int], b: List[Int]) -> Int:
    var len_a = len(a)
    var len_b = len(b)
    var count = 0
    var i = 0
    while i + len_a <= len_b:
        var is_match = True
        for j in range(len_a):
            if b[i + j] != a[j]:
                is_match = False
                break
        if is_match:
            count += 1
        i += 1
    return count

def main():
    var list1 = List[Int]()
    list1.append(1); list1.append(1); list1.append(1)

    var list2 = List[Int]()
    list2.append(1); list2.append(0); list2.append(1); list2.append(1); list2.append(1)
    list2.append(1); list2.append(1); list2.append(1); list2.append(1); list2.append(0)
    list2.append(0); list2.append(0)

    print("Non-overlapping count:", pattern_check(list1, list2))
    print("Overlapping count:", pattern_check_over(list1, list2))
