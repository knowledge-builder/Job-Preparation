# Data Structures & Algorithms (DSA) Lecture Roadmap

## Goal

The goal is not just memorization.

You need to understand:

- What problem a structure solves
- How data moves internally
- Time complexity
- Memory tradeoffs
- Common interview patterns
- State transitions during operations
- Why one structure is chosen over another

This roadmap is organized from:

```text
foundations
→ core data structures
→ algorithms
→ interview problem patterns
```

---

# PHASE 1 — FOUNDATIONS

These are the most important topics.

Most DSA failures happen because people skip these.

---

# 1. Time & Space Complexity

## Goal

Understand how operations scale as input grows.

---

## Topics

- Big O notation
- Big Theta
- Big Omega
- Constant vs linear vs logarithmic growth
- Nested loops analysis
- Recursive complexity
- Amortized complexity

---

## Must Know Complexities

| Complexity | Meaning |
|---|---|
| O(1) | constant |
| O(log n) | logarithmic |
| O(n) | linear |
| O(n log n) | linearithmic |
| O(n²) | quadratic |
| O(2^n) | exponential |
| O(n!) | factorial |

---

## Mental Model

Question:

```text
"What changes as input size grows?"
```

Measure:

- operations
- memory
- recursion depth
- reallocations

---

# 2. Memory Model Foundations

## Topics

- Stack memory
- Heap memory
- References / pointers
- Value vs reference semantics
- Contiguous memory
- Dynamic allocation
- Cache locality

---

## Arrays

```text
Contiguous memory

[a][b][c][d]
```

Address calculation:

```text
base + index * element_size
```

Why arrays have:

- O(1) indexing
- expensive insertions

---

## Linked Structures

```text
[node] -> [node] -> [node]
```

Elements scattered in memory.

Why:

- insertion can be O(1)
- access becomes O(n)

---

# PHASE 2 — CORE DATA STRUCTURES

---

# 3. Arrays & Dynamic Arrays

## Topics

- Fixed arrays
- Dynamic arrays
- Resizing strategy
- Amortized insertion
- Shifting elements

---

## Operations

| Operation | Complexity |
|---|---|
| Access | O(1) |
| Append | O(1) amortized |
| Insert front | O(n) |
| Delete front | O(n) |

---

## Key Interview Ideas

- Two pointers
- Sliding window
- Prefix sums
- In-place modification

---

# 4. Linked Lists

## Types

- Singly linked list
- Doubly linked list
- Circular linked list

---

## Key Operations

- insertion
- deletion
- traversal
- reverse
- cycle detection

---

## Important Insight

```text
Array:
fast access
slow insertion

Linked list:
slow access
fast insertion
```

---

# 5. Stack

## Core Principle

```text
LIFO
Last In First Out
```

---

## Operations

- push()
- pop()
- top()

All:

```text
O(1)
```

---

## Common Problems

- parentheses matching
- expression evaluation
- DFS
- undo systems
- recursion simulation

---

# 6. Queue

## Core Principle

```text
FIFO
First In First Out
```

---

## Variants

- queue
- circular queue
- deque
- priority queue

---

## deque Important

```text
Fast insertion/deletion:
• front
• back

Both O(1)
```

---

## Common Problems

- BFS
- task scheduling
- buffering
- producer-consumer systems

---

# 7. Hash Tables / Hash Maps

## Core Concept

```text
key -> hash function -> bucket
```

---

## Topics

- collisions
- chaining
- open addressing
- load factor
- resizing

---

## Average Complexity

| Operation | Average |
|---|---|
| Insert | O(1) |
| Search | O(1) |
| Delete | O(1) |

Worst case:

```text
O(n)
```

---

## Common Problems

- frequency counting
- duplicate detection
- caching
- lookup acceleration

---

# 8. Trees

This is where many interviews escalate.

---

# Binary Tree

## Structure

```text
       A
      / \
     B   C
```

---

## Traversals

- preorder
- inorder
- postorder
- level-order

---

# Binary Search Tree (BST)

## Property

```text
left < root < right
```

---

## Average Complexities

| Operation | Complexity |
|---|---|
| Search | O(log n) |
| Insert | O(log n) |
| Delete | O(log n) |

Worst:

```text
O(n)
```

---

# Heap / Priority Queue

## Core Property

```text
Parent >= children   (max heap)
Parent <= children   (min heap)
```

---

## Complexity

| Operation | Complexity |
|---|---|
| Insert | O(log n) |
| Extract min/max | O(log n) |

---

## Common Uses

- scheduling
- top-k problems
- Dijkstra
- median tracking

---

# Trie

## Purpose

Efficient string prefix lookup.

---

## Common Uses

- autocomplete
- dictionaries
- prefix search

---

# Segment Tree

Advanced but common in competitive programming.

---

## Purpose

Efficient range queries.

---

## Complexity

| Operation | Complexity |
|---|---|
| Query | O(log n) |
| Update | O(log n) |

---

# PHASE 3 — ALGORITHMS

---

# 9. Sorting Algorithms

You must know:

- how they work
- their tradeoffs

---

## Must Know

| Algorithm | Best | Average | Worst |
|---|---|---|---|
| Bubble | O(n) | O(n²) | O(n²) |
| Selection | O(n²) | O(n²) | O(n²) |
| Insertion | O(n) | O(n²) | O(n²) |
| Merge Sort | O(n log n) | O(n log n) | O(n log n) |
| Quick Sort | O(n log n) | O(n log n) | O(n²) |
| Heap Sort | O(n log n) | O(n log n) | O(n log n) |

---

## Interview Focus

- stability
- in-place vs extra memory
- recursion behavior
- partitioning

---

# 10. Searching Algorithms

---

# Binary Search

## Requirement

```text
Data must be sorted
```

---

## Complexity

```text
O(log n)
```

---

## Important Interview Patterns

- lower bound
- upper bound
- first occurrence
- search answer space

---

# 11. Recursion & Backtracking

## Topics

- recursive stack frames
- base cases
- divide-and-conquer
- state rollback

---

## Common Problems

- permutations
- subsets
- maze solving
- N-Queens

---

# 12. Graph Algorithms

Extremely important.

---

# Graph Representations

- adjacency list
- adjacency matrix

---

# Traversals

## BFS

```text
Uses queue
Level-by-level traversal
```

---

## DFS

```text
Uses stack/recursion
Depth exploration
```

---

# Important Algorithms

- Dijkstra
- Topological sort
- Union Find
- Minimum spanning tree

---

# PHASE 4 — INTERVIEW PATTERNS

This is where DSA becomes practical.

---

# 13. Two Pointers

## Example

```text
[left ...... right]
```

---

## Common Uses

- sorted arrays
- palindrome
- pair sums

---

# 14. Sliding Window

## Idea

Maintain a moving range.

```text
[start .... end]
```

---

## Common Problems

- longest substring
- max sum subarray
- fixed-size windows

---

# 15. Prefix Sums

## Idea

Precompute cumulative totals.

```text
prefix[i]
```

---

## Benefit

Range queries become:

```text
O(1)
```

---

# 16. Monotonic Stack

Very common in interviews.

---

## Maintains

```text
strictly increasing
or
strictly decreasing
```

---

## Problems

- next greater element
- histogram area
- stock span

---

# 17. Greedy Algorithms

## Principle

```text
Make locally optimal choice
```

---

## Examples

- interval scheduling
- activity selection
- Huffman coding

---

# 18. Dynamic Programming (DP)

Most feared interview topic.

---

# Core Idea

```text
Reuse overlapping subproblems
```

---

## Process

```text
1. Define state
2. Define transition
3. Define base case
4. Compute iteratively/recursively
```

---

## Common DP Problems

- Fibonacci
- knapsack
- longest common subsequence
- coin change

---

# PHASE 5 — INTERVIEW STRATEGY

---

# How To Analyze DSA Questions

## Step 1 — Identify Constraints

- sorted?
- duplicates?
- memory limits?
- real-time lookup?

---

## Step 2 — Identify Required Operations

Need fast:

- access?
- insertion?
- deletion?
- min/max?
- ordering?

---

## Step 3 — Match Structure to Behavior

Example:

```text
Need:
• fast front deletion
• fast back deletion

→ deque
```

---

# VERY IMPORTANT INTERVIEW PATTERNS

| Problem Pattern | Typical Structure |
|---|---|
| Fast lookup | Hash map |
| Ordered retrieval | Tree |
| Min/max retrieval | Heap |
| FIFO processing | Queue |
| LIFO processing | Stack |
| Prefix lookup | Trie |
| Range query | Segment tree |
| Frequent insert/delete middle | Linked list |
| Random access | Array |

---

# RECOMMENDED LEARNING ORDER

```text
1. Complexity Analysis
2. Arrays
3. Hash Maps
4. Stack
5. Queue / deque
6. Linked List
7. Recursion
8. Trees
9. Heap
10. Graphs
11. Sorting
12. Binary Search
13. Dynamic Programming
```

---

# HOW WE SHOULD PRACTICE NEXT

We should train in layers.

---

# Layer 1 — Recognition

Example:

```text
Question:
Need O(1) lookup?

Answer:
Hash map
```

---

# Layer 2 — Complexity Analysis

Example:

```text
What is erase(begin()) in vector?

Answer:
O(n)
because elements shift
```

---

# Layer 3 — State Simulation

You explain:

- memory changes
- pointer movement
- stack states
- queue states

---

# Layer 4 — Real Coding

Then:

- implement structures manually
- solve interview questions
- optimize complexity
- explain tradeoffs

---

# Important Final Insight

Most interview DSA is actually about:

```text
Recognizing structural behavior patterns
```

NOT memorizing code.

Example:

```text
Need:
• sorted retrieval
• frequent min extraction

→ heap
```

That mental mapping is the actual skill interviewers test.
