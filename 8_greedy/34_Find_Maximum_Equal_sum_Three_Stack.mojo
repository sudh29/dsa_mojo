# Find Maximum Equal Sum of Three Stacks
# Reference: https://mojolang.org/docs/manual/get-started/

def max_equal_sum(
    mut s1: List[Int],
    mut s2: List[Int],
    mut s3: List[Int]
) -> Int:
    var sum1 = 0
    for i in range(len(s1)):
        sum1 += s1[i]

    var sum2 = 0
    for i in range(len(s2)):
        sum2 += s2[i]

    var sum3 = 0
    for i in range(len(s3)):
        sum3 += s3[i]

    var top1 = 0
    var top2 = 0
    var top3 = 0

    var n1 = len(s1)
    var n2 = len(s2)
    var n3 = len(s3)

    while top1 < n1 and top2 < n2 and top3 < n3:
        if sum1 == sum2 and sum2 == sum3:
            return sum1

        # Pop from stack with highest sum
        if sum1 >= sum2 and sum1 >= sum3:
            sum1 -= s1[top1]
            top1 += 1
        elif sum2 >= sum1 and sum2 >= sum3:
            sum2 -= s2[top2]
            top2 += 1
        else:
            sum3 -= s3[top3]
            top3 += 1

    return 0

def main():
    var s1 = List[Int](); s1.append(3); s1.append(2); s1.append(1); s1.append(1); s1.append(1)
    var s2 = List[Int](); s2.append(4); s2.append(3); s2.append(2)
    var s3 = List[Int](); s3.append(1); s3.append(1); s3.append(4); s3.append(1)

    print("Max equal sum of three stacks:", max_equal_sum(s1, s2, s3))
