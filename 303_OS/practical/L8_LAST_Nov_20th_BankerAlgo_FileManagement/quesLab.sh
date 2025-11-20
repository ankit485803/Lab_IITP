

:'


Write a program to simulate the Banker’s Algorithm for deadlock avoidance in an operating system. Your program must determine whether the system is in a safe state and process multiple resource requests from different processes safely.

Problem Statement: 

You are given a system with n processes (P0, P1, ... Pn-1) and m resource types (R0, R1, ... Rm-1). Each process declares the maximum number of resources it may need, and the system keeps track of how many resources are currently allocated and how many are available.

Your task is to:

1. Input the values for:
   - Number of processes (n) and resource types (m)
   - The Available vector (resources currently available)
   - The Max matrix (maximum demand for each process)
   - The Allocation matrix (current allocation for each process)

2. Compute the Need matrix: 
   Need[i][j] = Max[i][j] - Allocation[i][j]

3. Implement the Safety Algorithm to determine if the system is currently in a safe state.
   - If safe, display the safe sequence of processes.
   - If unsafe, display a message indicating that the system is not safe.

4. Implement the Resource-Request Algorithm:
   - Allow a process to request additional resources and determine whether the request can be safely granted using the Banker’s Algorithm rules.
   - If granting the request keeps the system in a safe state, update the allocation and print the new safe sequence. 
   - Otherwise, deny the request and print an appropriate message.





Output Format:
1. Display the Need matrix.
2. Print whether the system is SAFE or UNSAFE.
   - If the system is **SAFE**, display the safe sequence (e.g., Safe Sequence: P1 → P3 → P0 → P2).
   - If the system is **UNSAFE**, display a message indicating that the system is not safe.
3. After processing a request:
   - Print whether the request is **Granted** or **Denied**.
   - If granted, show the updated allocation matrix and the new safe sequence (if the system remains in a safe state).
   - If denied, indicate that the request cannot be granted at this time.



'