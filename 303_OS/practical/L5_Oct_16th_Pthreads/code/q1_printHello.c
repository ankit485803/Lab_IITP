

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define NUM_THREADS 5

// Function executed by each thread
void* say_hello(void* arg) {
    int id = *(int*)arg;  // Dereference the argument to get the thread's unique ID
    printf("Hello from thread %d! (ID = %lu)\n", id, pthread_self());
    free(arg);  // Free the dynamically allocated memory for the thread argument
    return NULL;
}

int main() {
    pthread_t threads[NUM_THREADS];

    // Create threads
    for (int i = 0; i < NUM_THREADS; i++) {
        int* id = malloc(sizeof(int));  // Dynamically allocate memory for each thread's ID
        if (id == NULL) {
            fprintf(stderr, "Error allocating memory for thread ID\n");
            return 1;
        }

        *id = i + 1;  // Set the thread ID
        pthread_create(&threads[i], NULL, say_hello, id);  // Pass the dynamically allocated ID
    }

    // Wait for all threads to finish
    for (int i = 0; i < NUM_THREADS; i++) {
        pthread_join(threads[i], NULL);
    }

    printf("Main thread finished.\n");
    return 0;
}
