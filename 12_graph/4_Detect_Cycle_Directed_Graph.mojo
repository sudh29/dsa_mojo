# Detect Cycle in a Directed Graph

def dfs_cycle_directed(val: Int, adj: List[List[Int]], mut visited: List[Bool], mut rec_stack: List[Bool]) -> Bool:
    visited[val] = True
    rec_stack[val] = True
    
    for i in range(len(adj[val])):
        var neighbor = adj[val][i]
        if not visited[neighbor]:
            if dfs_cycle_directed(neighbor, adj, visited, rec_stack):
                return True
        elif rec_stack[neighbor]:
            return True
            
    rec_stack[val] = False
    return False

def is_cyclic_directed(v: Int, adj: List[List[Int]]) -> Bool:
    var visited = List[Bool]()
    var rec_stack = List[Bool]()
    for _ in range(v):
        visited.append(False)
        rec_stack.append(False)
        
    for i in range(v):
        if not visited[i]:
            if dfs_cycle_directed(i, adj, visited, rec_stack):
                return True
                
    return False

def main():
    var v = 4
    var adj = List[List[Int]]()
    for _ in range(v):
        adj.append(List[Int]())
        
    adj[0].append(1)
    adj[1].append(2)
    adj[2].append(3)
    adj[3].append(1) # Cycle: 1 -> 2 -> 3 -> 1
    
    print("Is directed graph cyclic:", is_cyclic_directed(v, adj))
