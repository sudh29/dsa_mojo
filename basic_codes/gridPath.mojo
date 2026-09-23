# Unique Paths in Grid with Obstacles

def unique_paths_with_obstacles(a: List[List[Int]]) -> Int:
    var m = len(a)
    if m == 0:
        return 0
    var n = len(a[0])
    
    var paths = List[List[Int]]()
    for _ in range(m):
        var row = List[Int]()
        for _ in range(n):
            row.append(0)
        paths.append(row^)
        
    if a[0][0] == 0:
        paths[0][0] = 1
        
    for i in range(1, m):
        if a[i][0] == 0:
            paths[i][0] = paths[i - 1][0]
            
    for j in range(1, n):
        if a[0][j] == 0:
            paths[0][j] = paths[0][j - 1]
            
    for i in range(1, m):
        for j in range(1, n):
            if a[i][j] == 0:
                paths[i][j] = paths[i - 1][j] + paths[i][j - 1]
                
    return paths[m - 1][n - 1]

def main():
    var a = List[List[Int]]()
    var r0 = List[Int](); r0.append(0); r0.append(0); r0.append(0); a.append(r0^)
    var r1 = List[Int](); r1.append(0); r1.append(1); r1.append(0); a.append(r1^)
    var r2 = List[Int](); r2.append(0); r2.append(0); r2.append(0); a.append(r2^)
    
    print("Unique paths in grid:", unique_paths_with_obstacles(a))
