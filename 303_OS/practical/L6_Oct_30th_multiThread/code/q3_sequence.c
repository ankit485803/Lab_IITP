


#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

#define N 3           // Number of threads
#define ITERATIONS 10 // Number of times each thread prints

// Shared variables
pthread_mutex_t lock;
pthread_cond_t cond[N];  // One condition variable per thread
int turn = 0;            // Indicates which thread's turn it is (0,1,2,...)

void* print_thread(void* arg) {
    int id = *(int*)arg;

    for (int i = 0; i < ITERATIONS; i++) {
        pthread_mutex_lock(&lock);

        // Wait until it is this thread's turn
        while (turn != id) {
            pthread_cond_wait(&cond[id], &lock);
        }

        // Print message
        printf("I am thread %d\n", id);
        fflush(stdout);  // Force flush for visible order

        // Set next thread's turn
        turn = (turn + 1) % N;

        // Signal the next thread to proceed
        pthread_cond_signal(&cond[turn]);

        pthread_mutex_unlock(&lock);

        // Optional: small delay for readability
        usleep(100000); // 0.1 seconds
    }

    return NULL;
}






int main() {
    pthread_t threads[N];
    int ids[N];

    // Initialize mutex and condition variables
    pthread_mutex_init(&lock, NULL);
    for (int i = 0; i < N; i++) {
        pthread_cond_init(&cond[i], NULL);
    }

    // Create threads
    for (int i = 0; i < N; i++) {
        ids[i] = i;
        pthread_create(&threads[i], NULL, print_thread, &ids[i]);
    }

    // Kick-start the sequence by signaling thread 0
    pthread_mutex_lock(&lock);
    pthread_cond_signal(&cond[0]);
    pthread_mutex_unlock(&lock);

    // Wait for all threads to complete
    for (int i = 0; i < N; i++) {
        pthread_join(threads[i], NULL);
    }

    // Cleanup
    for (int i = 0; i < N; i++) {
        pthread_cond_destroy(&cond[i]);
    }
    pthread_mutex_destroy(&lock);

    printf("All threads finished.\n");
    return 0;
}
