# Check if Given Preorder Traversal is Valid for a BST
# Reference: https://mojolang.org/docs/manual/get-started/

def is_valid_preorder(preorder: List[Int]) -> Bool:
    var n = len(preorder)
    var stack = List[Int]()
    var root = -2147483648

    for i in range(n):
        var val = preorder[i]
        # If we find a node who is on right side and smaller than root, return False
        if val < root:
            return False

        # If val is in right subtree of stack elements, pop and update root
        while len(stack) > 0 and stack[len(stack) - 1] < val:
            root = stack[len(stack) - 1]
            _ = stack.pop(len(stack) - 1)

        stack.append(val)

    return True

def main():
    # Valid preorder: [40, 30, 35, 80, 100]
    var pre1 = List[Int]()
    pre1.append(40)
    pre1.append(30)
    pre1.append(35)
    pre1.append(80)
    pre1.append(100)
    print("Preorder 1 is valid BST:", is_valid_preorder(pre1))

    # Invalid preorder: [40, 30, 35, 20, 80, 100]
    var pre2 = List[Int]()
    pre2.append(40)
    pre2.append(30)
    pre2.append(35)
    pre2.append(20)
    pre2.append(80)
    pre2.append(100)
    print("Preorder 2 is valid BST:", is_valid_preorder(pre2))
