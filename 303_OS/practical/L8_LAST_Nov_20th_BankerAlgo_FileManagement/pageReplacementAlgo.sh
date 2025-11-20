

:'





Page Replacement Algorithms Lab – OS

Problem Statement:

1. FIFO (First-In-First-Out) Page Replacement:

- Write a program that takes:
   - Number of frames available in memory.
   - A page reference string (sequence of page numbers).

- Requirements:
   - Simulate FIFO page replacement using a queue.
   - Display each step showing the page loaded or replaced.
   - Count and display the total number of page faults.
   - Print the final content of the frames.

2. LRU (Least Recently Used) Page Replacement:

- Write a program that takes:
   - Number of frames available in memory.
   - A page reference string (sequence of page numbers).

- Requirements:
   - For every page reference, update the LRU order (most recently used at top).
   - Replace the page that was least recently used.
   - Print the frame contents after each reference.
   - Display total page hits and total page faults.

3. Optimal Page Replacement:

- Write a program that takes:
   - Number of frames available in memory.
   - A page reference string (sequence of page numbers).

- Requirements:
   - For each page fault, choose to replace the page that will not be used for the longest time in the future.
   - Show the scanning of future references.
   - Display the chosen victim page for replacement.
   - Print the total number of page faults.









Output Format (for all three algorithms):

1. Display the frames after each page reference.
2. Indicate whether a page was a hit or caused a fault.
3. For FIFO and LRU, clearly indicate which page is replaced when a fault occurs.
4. For Optimal, show the scan of future references and the page chosen to be replaced.
5. At the end, display:
   - Total number of page hits (for LRU).
   - Total number of page faults.
   - Final content of memory frames.




'