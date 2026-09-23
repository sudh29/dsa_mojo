# Minimum Step by Knight (BFS)

struct KnightState(ImplicitlyCopyable, Movable):
    var x: Int
    var y: Int
    var dist: Int

    def __init__(out self, x: Int, y: Int, dist: Int):
        self.x = x
        self.y = y
        self.dist = dist

    def __init__(out self, *, copy: KnightState):
        self.x = copy.x
        self.y = copy.y
        self.dist = copy.dist

def is_valid(x: Int, y: Int, n: Int) -> Bool:
    return x >= 1 and x <= n and y >= 1 and y <= n

def min_step_to_reach_target(knight_pos: List[Int], target_pos: List[Int], n: Int) -> Int:
    var dx = List[Int]()
    dx.append(2); dx.append(2); dx.append(-2); dx.append(-2)
    dx.append(1); dx.append(1); dx.append(-1); dx.append(-1)
    
    var dy = List[Int]()
    dy.append(1); dy.append(-1); dy.append(1); dy.append(-1)
    dy.append(2); dy.append(-2); dy.append(2); dy.append(-2)
    
    var queue = List[KnightState]()
    var head = 0
    queue.append(KnightState(knight_pos[0], knight_pos[1], 0))
    
    var visited = List[List[Bool]]()
    for _ in range(n + 1):
        var row = List[Bool]()
        for _ in range(n + 1):
            row.append(False)
        visited.append(row^)
        
    visited[knight_pos[0]][knight_pos[1]] = True
    
    while head < len(queue):
        var state = queue[head]
        head += 1
        
        if state.x == target_pos[0] and state.y == target_pos[1]:
            return state.dist
            
        for i in range(8):
            var new_x = state.x + dx[i]
            var new_y = state.y + dy[i]
            
            if is_valid(new_x, new_y, n) and not visited[new_x][new_y]:
                visited[new_x][new_y] = True
                queue.append(KnightState(new_x, new_y, state.dist + 1))
                
    return -1

def main():
    var n = 6
    var knight_pos = List[Int]()
    knight_pos.append(4); knight_pos.append(5)
    var target_pos = List[Int]()
    target_pos.append(1); target_pos.append(1)
    print("Min knight steps:", min_step_to_reach_target(knight_pos, target_pos, n))
