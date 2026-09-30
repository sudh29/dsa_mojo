# Comprehensive Unit Tests for Generics, DSU, SegmentTree, and SIMD in Mojo 1.1

from std.testing import assert_equal, assert_true, assert_false
from dsa import (
    GenericNode,
    GenericLinkedList,
    GenericTreeArena,
    Stack,
    Queue,
    DisjointSetUnion,
    SegmentTree,
    simd_dot_product_f32,
    simd_vector_add_f32,
    simd_sum_i32,
    simd_max_i32,
)

def test_generic_linked_list() raises:
    # Test with Strings
    var str_ll = GenericLinkedList[String]()
    _ = str_ll.append("First")
    _ = str_ll.append("Second")
    _ = str_ll.prepend("Zero")
    assert_equal(str_ll.size(), 3)
    var items = str_ll.to_list()
    assert_equal(items[0], "Zero")
    assert_equal(items[1], "First")
    assert_equal(items[2], "Second")

    str_ll.reverse()
    var rev = str_ll.to_list()
    assert_equal(rev[0], "Second")
    assert_equal(rev[1], "First")
    assert_equal(rev[2], "Zero")
    print("test_generic_linked_list passed")

def test_generic_tree() raises:
    var arena = GenericTreeArena[String]()
    var l = arena.add_node("Left")
    var r = arena.add_node("Right")
    var root = arena.add_node("Root", l, r)

    var inord = List[String]()
    arena.inorder(root, inord)
    assert_equal(len(inord), 3)
    assert_equal(inord[0], "Left")
    assert_equal(inord[1], "Root")
    assert_equal(inord[2], "Right")
    print("test_generic_tree passed")

def test_stack_and_queue() raises:
    var st = Stack[Int]()
    st.push(10)
    st.push(20)
    assert_equal(st.peek(), 20)
    assert_equal(st.pop(), 20)
    assert_equal(st.pop(), 10)
    assert_true(st.is_empty())

    var q = Queue[String]()
    q.enqueue("A")
    q.enqueue("B")
    assert_equal(q.peek(), "A")
    assert_equal(q.dequeue(), "A")
    assert_equal(q.dequeue(), "B")
    assert_true(q.is_empty())
    print("test_stack_and_queue passed")

def test_dsu() raises:
    var dsu = DisjointSetUnion(5)
    assert_equal(dsu.count(), 5)
    _ = dsu.union_sets(0, 1)
    _ = dsu.union_sets(1, 2)
    assert_true(dsu.connected(0, 2))
    assert_false(dsu.connected(0, 3))
    assert_equal(dsu.count(), 3)
    print("test_dsu passed")

def test_segment_tree() raises:
    var arr = List[Int]()
    arr.append(1); arr.append(3); arr.append(5); arr.append(7); arr.append(9); arr.append(11)
    var st = SegmentTree(arr)
    # Query sum of range [1, 3] -> 3 + 5 + 7 = 15
    assert_equal(st.query(1, 3), 15)

    # Update arr[1] = 10 -> range [1, 3] is now 10 + 5 + 7 = 22
    st.update(1, 10)
    assert_equal(st.query(1, 3), 22)
    print("test_segment_tree passed")

def test_simd_operations() raises:
    var a = List[Float32]()
    var b = List[Float32]()
    for _ in range(8):
        a.append(2.0)
        b.append(3.0)
    var dot = simd_dot_product_f32(a, b)
    assert_equal(dot, 48.0)

    var v_add = simd_vector_add_f32(a, b)
    assert_equal(len(v_add), 8)
    assert_equal(v_add[0], 5.0)

    var nums = List[Int]()
    nums.append(10); nums.append(20); nums.append(30); nums.append(40); nums.append(5)
    assert_equal(simd_sum_i32(nums), 105)
    assert_equal(simd_max_i32(nums), 40)
    print("test_simd_operations passed")

def main() raises:
    test_generic_linked_list()
    test_generic_tree()
    test_stack_and_queue()
    test_dsu()
    test_segment_tree()
    test_simd_operations()
    print("All advanced DSA and SIMD tests passed successfully!")
