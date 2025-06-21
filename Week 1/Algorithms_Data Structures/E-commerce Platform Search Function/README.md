# 🛒 E-Commerce Platform Search Function (CTS Task)

This Java console application simulates an e-commerce platform's product search system using both **Linear Search** and **Binary Search**. The goal is to implement fast and efficient search functionality with proper algorithmic understanding.

## Understanding Asymptotic Notation

### What is Big O Notation?
Big O notation describes the **upper bound of an algorithm’s runtime** or **memory usage** as the input size grows. It provides a way to **analyze algorithm efficiency** regardless of hardware or environment.

### Why is it important?
- Helps compare different algorithms based on performance.
- Predicts how algorithms scale with larger datasets.
- Guides us in choosing the best approach (e.g., O(log n) over O(n)).

### Search Complexity Table:

| Search Method   | Best Case | Average Case | Worst Case |
|-----------------|-----------|--------------|------------|
| Linear Search   | O(1)      | O(n)         | O(n)       |
| Binary Search   | O(1)      | O(log n)     | O(log n)   |

## Analysis of Search Algorithms

### Linear Search
- Checks every element one by one.
- Does not require sorted data.
- **Time Complexity:** O(n)
- **Use Case:** Small or dynamic datasets.

### Binary Search
- Repeatedly divides the sorted array to find the target.
- Requires pre-sorting.
- **Time Complexity:** O(log n)
- **Use Case:** Large, frequently accessed, and sorted datasets.

### Which is more suitable?
- **Binary Search** is better for large, static, or infrequently updated product lists where speed is crucial.
- **Linear Search** is acceptable for small or rapidly changing data.

## Author

**Submitted By:** 6387612
**Submitted for:** Cognizant Digital Nurture 4.0  
**Task:** Exercise 2 - E-commerce Platform Search  
**Language:** Java