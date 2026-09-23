# Binary Tree Problems with Patterns

| File | Pattern(s) |
|------|------------|
| [0_Level_order_traversal.mojo](0_Level_order_traversal.mojo) | BFS / Queue |
| [1_Reverse_Level_Order_traversal.mojo](1_Reverse_Level_Order_traversal.mojo) | BFS / Stack |
| [2_Height_of_a_tree.mojo](2_Height_of_a_tree.mojo) | Recursion / DFS |
| [3_Diameter_of_a_tree.mojo](3_Diameter_of_a_tree.mojo) | DFS / Recursion |
| [4_Mirror_of_a_tree.mojo](4_Mirror_of_a_tree.mojo) | Recursion / Tree Manipulation |
| [5_Inorder_Traversal.mojo](5_Inorder_Traversal.mojo) | DFS / Inorder Traversal |
| [6_Preorder_Traversal.mojo](6_Preorder_Traversal.mojo) | DFS / Preorder Traversal |
| [7_Postorder_Traversal.mojo](7_Postorder_Traversal.mojo) | DFS / Postorder Traversal |
| [8_Left_View_tree.mojo](8_Left_View_tree.mojo) | BFS / Level Order with First Node |
| [9_Right_View_Tree.mojo](9_Right_View_Tree.mojo) | BFS / Level Order with Last Node |
| [10_Top_View_tree.mojo](10_Top_View_tree.mojo) | BFS / Horizontal Distance Map |
| [11_Bottom_View_tree.mojo](11_Bottom_View_tree.mojo) | BFS / Last Node at Each HD |
| [12_Zig_Zag_tree.mojo](12_Zig_Zag_tree.mojo) | BFS / Level Order with Direction Toggle |
| [13_Check_tree_balanced_or_not.mojo](13_Check_tree_balanced_or_not.mojo) | DFS / Height Check |
| [14_Diagonal_Traversal_tree.mojo](14_Diagonal_Traversal_tree.mojo) | Hashing / Queue |
| [15_Boundary_traversal_tree.mojo](15_Boundary_traversal_tree.mojo) | DFS + BFS / Boundary Collection |
| [16_Construct_Binary_Tree_String_Bracket_Representation.mojo](16_Construct_Binary_Tree_String_Bracket_Representation.mojo) | DFS / String Construction |
| [17_Convert_Binary_tree_Doubly_Linked_List.mojo](17_Convert_Binary_tree_Doubly_Linked_List.mojo) | Inorder Traversal / DLL Formation |
| [18_Convert_Binary_tree_Sum_tree.mojo](18_Convert_Binary_tree_Sum_tree.mojo) | Postorder DFS / Subtree Sum |
| [19_Construct_Binary_tree_from_Inorder_and_preorder_traversal.mojo](19_Construct_Binary_tree_from_Inorder_and_preorder_traversal.mojo) | Recursion / Tree Reconstruction |
| [20_Find_minimum_swaps_required_convert_Binary_tree_into_BST.mojo](20_Find_minimum_swaps_required_convert_Binary_tree_into_BST.mojo) | Inorder Traversal / Sorting |
| [21_Check_if_Binary_tree_is_Sum_tree_or_not.mojo](21_Check_if_Binary_tree_is_Sum_tree_or_not.mojo) | Recursion / Subtree Sum Validation |
| [22_Leaf_at_same_leve.mojo](22_Leaf_at_same_leve.mojo) | BFS / Level Consistency |
| [23_Check_Binary_Tree_duplicate_subtrees.mojo](23_Check_Binary_Tree_duplicate_subtrees.mojo) | DFS / Hashing Subtrees |
| [24_Check_Mirror_N-ary_tree.mojo](24_Check_Mirror_N-ary_tree.mojo) | Recursion / Symmetry Check |
| [25_Sum_Nodes_Longest_path_from_root_leaf_node.mojo](25_Sum_Nodes_Longest_path_from_root_leaf_node.mojo) | DFS / Depth + Path Sum |
| [26_Check_graph_tree_or_not.mojo](26_Check_graph_tree_or_not.mojo) | Graph / Cycle Detection |
| [27_Find_Largest_subtree_sum_tree.mojo](27_Find_Largest_subtree_sum_tree.mojo) | Postorder DFS / Subtree Sum |
| [28_Maximum_Sum_nodes_Binary_tree_adjacent.mojo](28_Maximum_Sum_nodes_Binary_tree_adjacent.mojo) | Tree DP / Include-Exclude |
| [29_Print_all_K_Sum_paths_Binary_tree.mojo](29_Print_all_K_Sum_paths_Binary_tree.mojo) | DFS / Backtracking |
| [30_Find_LCA_Binary_tree.mojo](30_Find_LCA_Binary_tree.mojo) | DFS / Recursion |
| [31_Find_distance_between_nodes_Binary_tree.mojo](31_Find_distance_between_nodes_Binary_tree.mojo) | LCA + Depth Count |
| [32_Kth_Ancestor_node_Binary_tree.mojo](32_Kth_Ancestor_node_Binary_tree.mojo) | DFS / Backtracking |
| [33_Find_all_Duplicate_subtrees_Binary_tree.mojo](33_Find_all_Duplicate_subtrees_Binary_tree.mojo) | DFS / Subtree Serialization |
| [34_Tree_Isomorphism_Problem.mojo](34_Tree_Isomorphism_Problem.mojo) | Recursion / Tree Comparison |


In a tree structure, Depth First Search (DFS) and Breadth First Search (BFS) algorithms are used to traverse the nodes.

## Tree Arena Architecture in Mojo
```mojo
struct TreeNode:
    var val: Int
    var left: Int
    var right: Int

    def __init__(out self, val: Int, left: Int = -1, right: Int = -1):
        self.val = val
        self.left = left
        self.right = right

struct TreeArena:
    var nodes: List[TreeNode]

    def __init__(out self):
        self.nodes = List[TreeNode]()

    def add_node(mut self, val: Int, left: Int = -1, right: Int = -1) -> Int:
        var idx = len(self.nodes)
        self.nodes.append(TreeNode(val, left, right))
        return idx
```
