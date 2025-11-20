


#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <stdint.h> // for intptr_t

#define NUM_THREADS 10
#define INCREMENTS 1000

// Global counter shared by all threads
long counter = 0;

// Mutex for synchronization
pthread_mutex_t lock;

// Thread function to increment the counter
void* increment_counter(void* arg) {
    int use_lock = (intptr_t)arg;

    for (int i = 0; i < INCREMENTS; i++) {
        if (use_lock) {
            pthread_mutex_lock(&lock);
            counter++;
            pthread_mutex_unlock(&lock);
        } else {
            counter++; // no locking -> race condition
        }
    }
    return NULL;
}

int main() {
    pthread_t threads[NUM_THREADS];
    int use_lock;

    printf("============================================\n");
    printf("1. RUNNING WITHOUT MUTEX (Race Condition)\n");
    printf("============================================\n");

    counter = 0;
    use_lock = 0;

    // Create threads without using lock
    for (int i = 0; i < NUM_THREADS; i++)
        pthread_create(&threads[i], NULL, increment_counter, (void*)(intptr_t)use_lock);

    // Wait for all threads to finish
    for (int i = 0; i < NUM_THREADS; i++)
        pthread_join(threads[i], NULL);

    printf("Final counter value (no lock): %ld (expected 10000)\n\n", counter);

    // --------------------------------------------------------
    printf("============================================\n");
    printf("2. RUNNING WITH MUTEX LOCK\n");
    printf("============================================\n");

    pthread_mutex_init(&lock, NULL);
    counter = 0;
    use_lock = 1;

    // Create threads with lock protection
    for (int i = 0; i < NUM_THREADS; i++)
        pthread_create(&threads[i], NULL, increment_counter, (void*)(intptr_t)use_lock);

    // Wait for all threads to finish
    for (int i = 0; i < NUM_THREADS; i++)
        pthread_join(threads[i], NULL);

    printf("Final counter value (with lock): %ld (expected 10000)\n", counter);

    pthread_mutex_destroy(&lock);
    return 0;
}
