# Check whether an Undirected Graph is a Tree or not
# Reference: https://mojolang.org/docs/manual/get-started/

def is_cyclic_util(
    curr: Int,
    mut visited: List[Bool],
    parent: Int,
    adj: List[List[Int]]
) -> Bool:
    visited[curr] = True

    for i in range(len(adj[curr])):
        var neighbor = adj[curr][i]
        if not visited[neighbor]:
            if is_cyclic_util(neighbor, visited, curr, adj):
                return True
        elif neighbor != parent:
            return True

    return False

def is_tree(n: Int, adj: List[List[Int]]) -> Bool:
    var visited = List[Bool]()
    for _ in range(n):
        visited.append(False)

    # Check for cycle starting from vertex 0
    if is_cyclic_util(0, visited, -1, adj):
        return False

    # Check for connectivity (all vertices must be reachable)
    for i in range(n):
        if not visited[i]:
            return False

    return True

def main():
    # Graph 1: Tree (5 vertices, 4 edges)
    # 1-0, 0-2, 0-3, 3-4
    var n1 = 5
    var adj1 = List[List[Int]]()
    for _ in range(n1):
        adj1.append(List[Int]())

    adj1[1].append(0); adj1[0].append(1)
    adj1[0].append(2); adj1[2].append(0)
    adj1[0].append(3); adj1[3].append(0)
    adj1[3].append(4); adj1[4].append(3)

    print("Graph 1 is tree:", is_tree(n1, adj1))

    # Graph 2: Contains cycle (1-0, 0-2, 2-1, 0-3, 3-4)
    var n2 = 5
    var adj2 = List[List[Int]]()
    for _ in range(n2):
        adj2.append(List[Int]())

    adj2[1].append(0); adj2[0].append(1)
    adj2[0].append(2); adj2[2].append(0)
    adj2[2].append(1); adj2[1].append(2)
    adj2[0].append(3); adj2[3].append(0)
    adj2[3].append(4); adj2[4].append(3)

    print("Graph 2 is tree:", is_tree(n2, adj2))
