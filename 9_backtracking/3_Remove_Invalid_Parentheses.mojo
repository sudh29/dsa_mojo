# Remove Invalid Parentheses (BFS)
# Reference: https://mojolang.org/docs/manual/get-started/

def is_valid_parentheses(s: String) -> Bool:
    var count = 0
    for i in range(s.byte_length()):
        if s[byte=i] == "(":
            count += 1
        elif s[byte=i] == ")":
            count -= 1
            if count < 0:
                return False
    return count == 0

def remove_invalid_parentheses(s: String) -> List[String]:
    var res = List[String]()
    if s.byte_length() == 0:
        res.append("")
        return res^

    var queue = List[String]()
    var visited = List[String]()

    queue.append(s)
    visited.append(s)
    var found = False

    var head = 0
    while head < len(queue):
        var level_size = len(queue) - head
        var next_level_found = False

        for _ in range(level_size):
            var curr = queue[head]
            head += 1

            if is_valid_parentheses(curr):
                res.append(curr)
                next_level_found = True

            if not found:
                for i in range(curr.byte_length()):
                    var ch = String(curr[byte=i])
                    if ch != "(" and ch != ")":
                        continue

                    var temp = String("")
                    for j in range(curr.byte_length()):
                        if j != i:
                            temp += curr[byte=j]

                    var already_visited = False
                    for v in range(len(visited)):
                        if visited[v] == temp:
                            already_visited = True
                            break

                    if not already_visited:
                        visited.append(temp)
                        queue.append(temp)

        if next_level_found:
            break

    return res^

def main():
    var s1 = String("()())()")
    var res1 = remove_invalid_parentheses(s1)
    print("Valid strings for '()())()':", end=" [")
    for i in range(len(res1)):
        print("'" + res1[i] + "'", end=", " if i < len(res1) - 1 else "")
    print("]")

    var s2 = String("(a)())()")
    var res2 = remove_invalid_parentheses(s2)
    print("Valid strings for '(a)())()':", end=" [")
    for i in range(len(res2)):
        print("'" + res2[i] + "'", end=", " if i < len(res2) - 1 else "")
    print("]")
