


:'

1.  Write a program that has a counter as a global variable. Spawn 10 threads in the program, and
let each thread increment the counter 1000 times in a loop. Print the final value of the counter
after all the threads finish—the expected value of the counter is 10000. Run this program first
without using locking across threads, and observe the incorrect updation of the counter due to race
conditions (the final value will be slightly less than 10000). Next, use locks when accessing the
shared counter and verify that the counter is now updated correctly.

NOTE: this is a solid multithreading example in C using POSIX threads (pthreads) to demonstrate race conditions and how mutex locks solve them.
Explanation
        Race condition: When multiple threads modify the same memory location (counter) without synchronization, the updates can overlap and get lost.
        Mutex: Ensures that only one thread at a time updates the shared variable, preserving correctness.





2. Write a program where the main default thread spawns N = 10 threads. Thread i should print
the message “I am thread i” to screen and exit. The main thread should wait for all N threads to
finish, then print the message “I am the main thread”, and exit.



3. You are given the file sequence.c, which creates N = 3 threads. Each thread i prints the string
“I am thread i” to the screen in an infinite loop. You must add synchronization between the threads
using locks and conditon variables so that the threads print one after the other in the order 0, 1, 2,
0, 1, 2, .... and so on. Please note that threads must NOT simply do busy-waiting, but must wait in
a condition variable queue until their turn to print comes.






'