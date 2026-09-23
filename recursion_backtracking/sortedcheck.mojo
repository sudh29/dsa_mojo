# Check if Array is Sorted using Recursion
# Reference: https://mojolang.org/docs/manual/get-started/

def is_sorted_recursive(arr: List[Int], idx: Int) -> Bool:
    if len(arr) <= 1 or idx >= len(arr) - 1:
        return True

    return arr[idx] <= arr[idx + 1] and is_sorted_recursive(arr, idx + 1)

def check_sorted(arr: List[Int]) -> Bool:
    return is_sorted_recursive(arr, 0)

def main():
    var a = List[Int]()
    a.append(1)
    a.append(2)
    a.append(3)
    a.append(4)
    a.append(5)
    a.append(6)
    a.append(7)
    print("Is [1..7] sorted:", check_sorted(a))

    var b = List[Int]()
    b.append(1)
    b.append(5)
    b.append(671)
    b.append(1)
    b.append(6)
    b.append(3)
    b.append(2)
    b.append(0)
    print("Is [1, 5, 671, 1, 6, 3, 2, 0] sorted:", check_sorted(b))
