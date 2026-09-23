# All Combinations of Characters of Length K
# Reference: https://mojolang.org/docs/manual/get-started/

def all_combinations_str(arr: List[String], prefix: String, n: Int, k: Int, mut res: List[String]):
    if k == 0:
        res.append(prefix)
        return

    for i in range(n):
        var new_prefix = prefix + arr[i]
        all_combinations_str(arr, new_prefix, n, k - 1, res)

def main():
    print("First Test:")
    var set1 = List[String]()
    set1.append("1")
    set1.append("2")
    set1.append("3")

    var k1 = 2
    var res1 = List[String]()
    all_combinations_str(set1, "", len(set1), k1, res1)
    print("Combinations of length", k1, ":", end=" [")
    for i in range(len(res1)):
        print("'" + res1[i] + "'", end=", " if i < len(res1) - 1 else "")
    print("]")

    print("\nSecond Test:")
    var set2 = List[String]()
    set2.append("a")
    set2.append("b")
    set2.append("c")
    set2.append("d")

    var k2 = 2
    var res2 = List[String]()
    all_combinations_str(set2, "", len(set2), k2, res2)
    print("Combinations of length", k2, ":", end=" [")
    for i in range(len(res2)):
        print("'" + res2[i] + "'", end=", " if i < len(res2) - 1 else "")
    print("]")
