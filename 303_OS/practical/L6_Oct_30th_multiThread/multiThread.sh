


:'


30th  Oct 2025 (Thurday - after Diwali ChhathPuja)


1. Title:
Speeding Up Computation Using Multi-threading


2. Objective:
To understand and implement multi-threading in C to parallelize compute-intensive tasks.
The aim is to speed up the verification of the Goldbach Conjecture by dividing the computation among multiple threads using the pthread library.



3. Background:
The Goldbach Conjecture states that every even number greater than 2 can be expressed as the sum of two prime numbers.
The given program goldbach.c performs the following steps:
Computes all prime numbers up to N = 100,000 using the Sieve of Eratosthenes.
For each even number 2i, counts the number of pairs of prime numbers (p1, p2) such that:
p1 + p2 = 2i

Stores the count of such pairs in an array gb_count[i].
Measures the total computation time and writes the results to output.txt.



4. Problem Description:
The original version of goldbach.c performs all computations in a single thread.
Our task is to parallelize the computation using 10 threads, where each thread works on a distinct range of even numbers.

Each thread must:

        Compute the number of Goldbach pairs for its assigned range.
        Update only its portion of the gb_count array.
        Run concurrently with other threads to improve performance.
        No synchronization is needed because each thread accesses a unique section of the array.



5. Implementation Requirements:

    Use POSIX Threads (pthread) library.
    Create 10 threads.
    Assign disjoint ranges of even numbers to each thread.
    Start the threads after recording the start time.
    Join all threads before recording the end time.
    Only parallelize the Goldbach pair computation section (not the Sieve).
    Declare primes[] and gb_count[] as global arrays for shared access.
    Verify that the output matches the provided expected-output.txt.



6. Design Steps:

    I. Compute all primes up to N using the Sieve of Eratosthenes (single-threaded).
    II. Divide the even numbers range (4 to N) among 10 threads.
    III.  Implement a function:
                            void* compute_goldbach(void* arg);

        which calculates Goldbach pairs for the thread’s assigned range.

    IV. Create threads using pthread_create().
    V. Synchronize threads using pthread_join().
    VI. Measure total elapsed time between thread start and completion.




7.Compilation and Execution:
     (a) Single-threaded Execution:
            $ gcc goldbach.c -lm
            $ ./a.out
            Computed primes upto 100000, count = 9592
            elapsed time: 3448984 microseconds


     (b) Multi-threaded Execution:
            $ gcc goldbach.c -lpthread -lm
            $ ./a.out
            Computed primes upto 100000, count = 9592
            elapsed time: 931387 microseconds





8. Observations:


| Version         | Threads | Time (microseconds) | Speedup |
| --------------- | ------- | ------------------- | ------- |
| Single-threaded | 1       | 3,448,984           | 1×      |
| Multi-threaded  | 10      | 931,387             | ≈ 3.7×  |



9. Conclusion:

        Multi-threading significantly reduces computation time for independent tasks.
        By dividing the workload into 10 threads, we utilized CPU cores efficiently.
        Output verification confirmed correctness of results.
        The experiment demonstrates the effectiveness of multi-threading in parallelizing compute-bound problems.



10. Key Takeaways:
        Multi-threading improves performance for parallelizable workloads.
        Proper division of work avoids the need for synchronization.
        The pthread library provides efficient APIs for thread creation and synchronization.
        Speedup varies depending on hardware and workload distribution.







'