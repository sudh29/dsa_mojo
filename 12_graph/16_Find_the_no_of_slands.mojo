# Find Number of Islands (8 directions)

def dfs_island(row: Int, col: Int, mut grid: List[List[Int]], n: Int, m: Int):
    if row < 0 or col < 0 or row >= n or col >= m or grid[row][col] != 1:
        return
        
    grid[row][col] = -1
    
    dfs_island(row + 1, col, grid, n, m)
    dfs_island(row - 1, col, grid, n, m)
    dfs_island(row, col + 1, grid, n, m)
    dfs_island(row, col - 1, grid, n, m)
    dfs_island(row + 1, col + 1, grid, n, m)
    dfs_island(row + 1, col - 1, grid, n, m)
    dfs_island(row - 1, col + 1, grid, n, m)
    dfs_island(row - 1, col - 1, grid, n, m)

def num_islands(mut grid: List[List[Int]]) -> Int:
    var n = len(grid)
    if n == 0:
        return 0
    var m = len(grid[0])
    
    var count = 0
    for i in range(n):
        for j in range(m):
            if grid[i][j] == 1:
                dfs_island(i, j, grid, n, m)
                count += 1
                
    return count

def main():
    var grid = List[List[Int]]()
    var r0 = List[Int](); r0.append(0); r0.append(1); grid.append(r0^)
    var r1 = List[Int](); r1.append(1); r1.append(0); grid.append(r1^)
    var r2 = List[Int](); r2.append(1); r2.append(1); grid.append(r2^)
    var r3 = List[Int](); r3.append(1); r3.append(0); grid.append(r3^)
    
    print("Number of islands:", num_islands(grid))
