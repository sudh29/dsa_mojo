# Count all subarrays/subsequences with product less than K

def count_sub_array_product_less_than_k(a: List[Int], n: Int, k: Int) -> Int:
    var start = 0
    var prod = 1
    var count = 0
    for end in range(n):
        prod *= a[end]
        while start <= end and prod >= k:
            prod //= a[start]
            start += 1
        count += end - start + 1
    return count

def main():
    var a = List[Int]()
    a.append(1)
    a.append(2)
    a.append(3)
    a.append(4)
    var k = 10
    print("Count subarrays with product < k:", count_sub_array_product_less_than_k(a, len(a), k))
