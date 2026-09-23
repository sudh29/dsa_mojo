# Print all Palindromic Partitions of a String
# Reference: https://mojolang.org/docs/manual/get-started/

def is_palindrome(s: String, start: Int, end: Int) -> Bool:
    var i = start
    var j = end
    var bytes = s.as_bytes()
    while i < j:
        if bytes[i] != bytes[j]:
            return False
        i += 1
        j -= 1
    return True

def partition_util(
    s: String,
    start: Int,
    mut current: List[String],
    mut result: List[List[String]]
):
    var n = s.byte_length()
    if start >= n:
        var partition = List[String]()
        for i in range(len(current)):
            partition.append(current[i])
        result.append(partition^)
        return

    for end in range(start, n):
        if is_palindrome(s, start, end):
            var part = String("")
            for k in range(start, end + 1):
                part += s[byte=k]

            current.append(part)
            partition_util(s, end + 1, current, result)
            _ = current.pop(len(current) - 1)

def all_palindromic_partitions(s: String) -> List[List[String]]:
    var current = List[String]()
    var result = List[List[String]]()
    partition_util(s, 0, current, result)
    return result^

def main():
    var s = String("geeks")
    var partitions = all_palindromic_partitions(s)
    print("Palindromic partitions for '", s, "':", len(partitions))
    for i in range(len(partitions)):
        print("Partition", i + 1, ": [", end="")
        for j in range(len(partitions[i])):
            print(partitions[i][j], end=" " if j < len(partitions[i]) - 1 else "")
        print("]")
