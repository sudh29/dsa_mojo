# Topological Sort (Kahn's Algorithm)

def topo_sort(v: Int, adj: List[List[Int]]) -> List[Int]:
    var indegree = List[Int]()
    for _ in range(v):
        indegree.append(0)

    for i in range(v):
        for j in range(len(adj[i])):
            indegree[adj[i][j]] += 1

    var q = List[Int]()
    var head = 0
    for i in range(v):
        if indegree[i] == 0:
            q.append(i)

    var res = List[Int]()
    while head < len(q):
        var u = q[head]
        head += 1
        res.append(u)
        for j in range(len(adj[u])):
            var neighbor = adj[u][j]
            indegree[neighbor] -= 1
            if indegree[neighbor] == 0:
                q.append(neighbor)

    return res^

def main():
    var v = 6
    var adj = List[List[Int]]()
    for _ in range(v):
        adj.append(List[Int]())

    adj[5].append(2); adj[5].append(0)
    adj[4].append(0); adj[4].append(1)
    adj[2].append(3)
    adj[3].append(1)

    var order = topo_sort(v, adj)
    print("Topological order:", end=" ")
    for i in range(len(order)):
        print(order[i], end=" ")
    print()
