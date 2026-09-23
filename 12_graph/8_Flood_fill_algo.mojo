# Flood Fill Algorithm

def dfs_flood(
    mut image: List[List[Int]],
    x: Int,
    y: Int,
    old_col: Int,
    new_col: Int,
    m: Int,
    n: Int
):
    if x < 0 or x >= m or y < 0 or y >= n:
        return
    if image[x][y] != old_col:
        return
        
    image[x][y] = new_col
    dfs_flood(image, x + 1, y, old_col, new_col, m, n)
    dfs_flood(image, x - 1, y, old_col, new_col, m, n)
    dfs_flood(image, x, y + 1, old_col, new_col, m, n)
    dfs_flood(image, x, y - 1, old_col, new_col, m, n)

def flood_fill(var image: List[List[Int]], sr: Int, sc: Int, new_color: Int) -> List[List[Int]]:
    var m = len(image)
    if m == 0:
        return image^
    var n = len(image[0])
    var old_color = image[sr][sc]
    if old_color != new_color:
        dfs_flood(image, sr, sc, old_color, new_color, m, n)
    return image^

def main():
    var image = List[List[Int]]()
    var r0 = List[Int](); r0.append(1); r0.append(1); r0.append(1); image.append(r0^)
    var r1 = List[Int](); r1.append(1); r1.append(1); r1.append(0); image.append(r1^)
    var r2 = List[Int](); r2.append(1); r2.append(0); r2.append(1); image.append(r2^)
    
    var res = flood_fill(image^, 1, 1, 2)
    print("Flood fill result:")
    for i in range(len(res)):
        for j in range(len(res[i])):
            print(res[i][j], end=" ")
        print()
