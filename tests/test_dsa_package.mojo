# Unit Tests for shared dsa package

from std.testing import assert_equal, assert_true, assert_false
from dsa import Node, LinkedList, TreeNode, TreeArena, MinHeap, MaxHeap, Trie

def test_linked_list() raises:
    var ll = LinkedList()
    _ = ll.append(10)
    _ = ll.append(20)
    _ = ll.append(30)
    var items = ll.to_list()
    assert_equal(len(items), 3)
    assert_equal(items[0], 10)
    assert_equal(items[1], 20)
    assert_equal(items[2], 30)

    ll.reverse()
    var rev_items = ll.to_list()
    assert_equal(rev_items[0], 30)
    assert_equal(rev_items[1], 20)
    assert_equal(rev_items[2], 10)
    print("test_linked_list passed")

def test_tree_arena() raises:
    var arena = TreeArena()
    var left = arena.add_node(5)
    var right = arena.add_node(15)
    var root = arena.add_node(10, left, right)

    var inord = List[Int]()
    arena.inorder(root, inord)
    assert_equal(len(inord), 3)
    assert_equal(inord[0], 5)
    assert_equal(inord[1], 10)
    assert_equal(inord[2], 15)

    var lvl = arena.level_order(root)
    assert_equal(lvl[0], 10)
    assert_equal(lvl[1], 5)
    assert_equal(lvl[2], 15)
    print("test_tree_arena passed")

def test_heaps() raises:
    var min_h = MinHeap()
    min_h.push(30)
    min_h.push(10)
    min_h.push(20)
    assert_equal(min_h.pop(), 10)
    assert_equal(min_h.pop(), 20)
    assert_equal(min_h.pop(), 30)

    var max_h = MaxHeap()
    max_h.push(10)
    max_h.push(30)
    max_h.push(20)
    assert_equal(max_h.pop(), 30)
    assert_equal(max_h.pop(), 20)
    assert_equal(max_h.pop(), 10)
    print("test_heaps passed")

def test_trie() raises:
    var trie = Trie()
    trie.insert("apple")
    trie.insert("app")
    assert_true(trie.search("apple"))
    assert_true(trie.search("app"))
    assert_false(trie.search("appl"))
    assert_true(trie.starts_with("app"))
    assert_false(trie.starts_with("banana"))
    print("test_trie passed")

def main() raises:
    test_linked_list()
    test_tree_arena()
    test_heaps()
    test_trie()
    print("All shared dsa package unit tests passed!")
