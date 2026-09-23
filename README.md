# Data Structure Code in Mojo 🚀

[![Mojo Version](https://img.shields.io/badge/Mojo-1.1.0-blue.svg)](https://mojolang.org/)
[![MAX Version](https://img.shields.io/badge/MAX-26.6.0-orange.svg)](https://www.modular.com/max)
[![Environment](https://img.shields.io/badge/uv-managed-purple.svg)](https://docs.astral.sh/uv/)
[![Tests](https://img.shields.io/badge/Tests-398%2F398%20Passing%20(100%25)-brightgreen.svg)]()
[![Codebase](https://img.shields.io/badge/Python%20Files-0%20(Pure%20Mojo)-success.svg)]()

A comprehensive, production-ready collection of **398 Data Structures and Algorithms (DSA) problems** implemented entirely in [Mojo](https://mojolang.org/) (Mojo 1.1 / MAX 26.6).

Every solution is written according to modern Mojo 1.1 language idioms: strongly typed functions, memory-safe ownership semantics, standard `List[T]` collections, custom structs adhering to `Movable` and `ImplicitlyCopyable` traits, and deterministic `def main():` test suites.

---

## 📚 Modules Directory

| Category | Directory | Problems | Description |
|----------|-----------|:--------:|-------------|
| 1. Array | [`1_array/`](1_array/README.md) | 35 | Classic array problems (Kadane, 2-pointer, cycle sort, intervals) |
| 2. Matrix | [`2_matrix/`](2_matrix/README.md) | 10 | 2D Grid & Matrix manipulation problems (spiral traversal, rotate, search) |
| 3. String | [`3_string/`](3_string/README.md) | 35 | String parsing, palindromes, anagrams & subsequence problems |
| 4. Searching & Sorting | [`4_search_sort/`](4_search_sort/README.md) | 26 | Binary search variations, rotated search & counting problems |
| 5. Linked List | [`5_linklist/`](5_linklist/README.md) | 29 | Singly, doubly, and circular linked list algorithms |
| 6. Binary Tree | [`6_binary_tree/`](6_binary_tree/README.md) | 35 | Tree traversals, views, diameters, and tree properties |
| 7. Binary Search Tree | [`7_bst/`](7_bst/README.md) | 22 | BST search, insertion, deletion, and validation problems |
| 8. Tree Fundamentals | [`tree/`](tree/README.md) | 10 | Fundamental tree & heap structures (AVL, Max/Min Heap) |
| 9. Greedy Algorithms | [`8_greedy/`](8_greedy/README.md) | 27 | Activity selection, Huffman coding, Egyptian fraction & scheduling |
| 10. Backtracking | [`9_backtracking/`](9_backtracking/README.md) | 16 | N-Queens, Sudoku, Knight's Tour, Rat in Maze & subsets |
| 11. Recursion & Backtracking | [`recursion_backtracking/`](recursion_backtracking/README.md) | 6 | Classic recursion problems (Knapsack, Tower of Hanoi, PathFinder) |
| 12. Stacks & Queues | [`10_stack_queues/`](10_stack_queues/README.md) | 15 | Stack & queue data structures, monotonic stacks, min-stack |
| 13. Heaps & Priority Queues | [`11_heap/`](11_heap/README.md) | 18 | Min/Max heap, k-way merge, median in stream, sliding window |
| 14. Graph Algorithms | [`12_graph/`](12_graph/README.md) | 17 | BFS, DFS, Dijkstra, Kahn's Algo, Kruskal's MST, M-Coloring |
| 15. Graph Fundamentals | [`graph/`](graph/README.md) | 7 | Adjacency list & matrix representations, Floyd-Warshall |
| 16. Trie | [`13_Trie/`](13_Trie/README.md) | 6 | Prefix trees, autocomplete, unique rows, word break |
| 17. Dynamic Programming | [`14_dynamic_programming/`](14_dynamic_programming/README.md) | 50 | Classic DP problems (Knapsack, LCS, LIS, Matrix Chain, MCM) |
| 18. Bit Manipulation | [`15_bit_manipulation/`](15_bit_manipulation/README.md) | 10 | Bitwise arithmetic, set bits, power sets, non-repeating numbers |
| 19. Sorting Algorithms | [`Sorting_Algorithms/`](Sorting_Algorithms/README.md) | 6 | Core sorting algorithms (Bubble, Heap, Insertion, Merge, Quick, Selection) |
| 20. Basic Codes | [`basic_codes/`](basic_codes/README.md) | 14 | Foundational syntax, random walk, anagram, and number theory |
| 21. Basics & Concurrency | Root & [`Mojo Basics/`](Mojo%20Basics/first.mojo) | 4 | Concurrency primitives, multi-threading demos, and language introductory syntax |
| **Total** | | **398** | **100% Pass Rate across all Mojo programs** |

---

## ⚡ Key Mojo 1.1 Idiomatic Patterns

1. **Explicit Memory Ownership**:
   - Argument conventions: `read` (borrowing), `mut` (mutable in-place reference), and `^` (ownership transfer / transfer operator).
   - Container transfers: Returning or nesting `List[T]` structures utilizes the transfer operator (e.g., `matrix.append(row^)`).

2. **Modern Structs & Traits**:
   - Conformance to `Movable` and `ImplicitlyCopyable` traits.
   - Struct initializers use `def __init__(out self, ...)` and explicit copy constructors `def __init__(out self, *, copy: Self)` to guarantee safe copying without deprecated `@value` decorators.

3. **Safe String Operations**:
   - Byte-indexed string slicing using `s[byte=i]`, `s[byte=start:end]`, or `Int(s.as_bytes()[i])` for consistent memory safety.
   - String length evaluated via `s.byte_length()`.

4. **Keyword Cleanliness**:
   - Identifiers avoid reserved keywords in Mojo 1.1 (such as `match`, which is reserved for pattern matching).

---

## 🛠️ Getting Started with `uv` and Mojo

This repository is managed with [uv](https://docs.astral.sh/uv/) and the official Modular MAX / Mojo distribution.

### 1. Environment Setup

```bash
# Sync dependencies and activate virtual environment
uv sync
```

### 2. Verify Mojo Installation

```bash
uv run mojo --version
```
Expected output:
```
Mojo 1.1.0 (8189361e)
```

### 3. Run Any DSA Problem

```bash
uv run mojo <path_to_file>.mojo
```

#### Examples:

```bash
# Dynamic Programming
uv run mojo 14_dynamic_programming/0_Coin_Change.mojo
uv run mojo 14_dynamic_programming/1_0-1_Knapsack_Problem.mojo

# Sorting Algorithms
uv run mojo Sorting_Algorithms/quickSort.mojo

# Bit Manipulation
uv run mojo 15_bit_manipulation/0_Number_of_1_Bits.mojo
uv run mojo 15_bit_manipulation/4_Is_power_of_two.mojo

# Graph Algorithms
uv run mojo 12_graph/12_Dijkstra_algo.mojo
```

---

## 🧪 Testing and Validation

Every file contains a self-contained `def main():` function that executes test cases and prints verified outputs.

To run the automated test suite across all 398 `.mojo` files:

```bash
uv run python -c "
import glob, subprocess

files = sorted(glob.glob('*/*.mojo') + glob.glob('*.mojo') + glob.glob('Mojo Basics/*.mojo'))
passed, failed = 0, 0
for f in files:
    res = subprocess.run(['uv', 'run', 'mojo', f], capture_output=True, text=True)
    if res.returncode == 0:
        passed += 1
        print(f'[PASS] {f}')
    else:
        failed += 1
        print(f'[FAIL] {f}\n{res.stderr}')

print(f'\nTotal: {len(files)} | Passed: {passed} | Failed: {failed}')
"
```
