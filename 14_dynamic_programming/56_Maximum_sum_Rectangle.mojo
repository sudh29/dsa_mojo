# Maximum Sum Rectangle in 2D Matrix

def kadane(arr: List[Int]) -> Int:
    var n = len(arr)
    if n == 0:
        return 0
    var max_ending_here = arr[0]
    var max_so_far = arr[0]
    for i in range(1, n):
        var cont = max_ending_here + arr[i]
        max_ending_here = arr[i] if arr[i] > cont else cont
        if max_ending_here > max_so_far:
            max_so_far = max_ending_here
    return max_so_far

def maximum_sum_rectangle(r: Int, c: Int, m: List[List[Int]]) -> Int:
    if r == 0 or c == 0:
        return 0
        
    var max_sum = -1000000000
    for top in range(r):
        var temp = List[Int]()
        for _ in range(c):
            temp.append(0)
            
        for bottom in range(top, r):
            for i in range(c):
                temp[i] += m[bottom][i]
            var max_sum_subarray = kadane(temp)
            if max_sum_subarray > max_sum:
                max_sum = max_sum_subarray
                
    return max_sum

def main():
    var r = 4
    var c = 5
    var m = List[List[Int]]()
    
    var r0 = List[Int](); r0.append(1); r0.append(2); r0.append(-1); r0.append(-4); r0.append(-20); m.append(r0^)
    var r1 = List[Int](); r1.append(-8); r1.append(-3); r1.append(4); r1.append(2); r1.append(1); m.append(r1^)
    var r2 = List[Int](); r2.append(3); r2.append(8); r2.append(10); r2.append(1); r2.append(3); m.append(r2^)
    var r3 = List[Int](); r3.append(-4); r3.append(-1); r3.append(1); r3.append(7); r3.append(-6); m.append(r3^)
    
    print("Maximum sum rectangle:", maximum_sum_rectangle(r, c, m))
