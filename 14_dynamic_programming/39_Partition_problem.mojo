# Partition Problem (Equal Sum Partition)

def equal_partition(n: Int, arr: List[Int]) -> Int:
    var total_sum = 0
    for i in range(n):
        total_sum += arr[i]
        
    if total_sum % 2 != 0:
        return 0
        
    var target = total_sum // 2
    var dp = List[Bool]()
    for _ in range(target + 1):
        dp.append(False)
    dp[0] = True
    
    for i in range(n):
        var num = arr[i]
        for j in range(target, num - 1, -1):
            if dp[j - num]:
                dp[j] = True
                
    return 1 if dp[target] else 0

def main():
    var arr = List[Int]()
    arr.append(1); arr.append(5); arr.append(11); arr.append(5)
    print("Equal partition possible:", equal_partition(len(arr), arr))
