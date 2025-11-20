


#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

#define BUFFER_SIZE 5
#define TOTAL_ITEMS 20

int buffer[BUFFER_SIZE];
int count = 0;
int head = 0, tail = 0;

pthread_mutex_t lock;
pthread_cond_t not_full;
pthread_cond_t not_empty;

// ------------------------------------------------------
// Producer Thread
// ------------------------------------------------------
void* producer(void* arg) {
    for (int i = 1; i <= TOTAL_ITEMS; i++) {
        pthread_mutex_lock(&lock);

        // Wait while buffer is full
        while (count == BUFFER_SIZE) {
            printf("Producer waiting (buffer full)...\n");
            pthread_cond_wait(&not_full, &lock);
        }

        // Produce item
        buffer[tail] = i;
        tail = (tail + 1) % BUFFER_SIZE;
        count++;
        printf("Produced: %d | Buffer count: %d\n", i, count);

        // Signal that buffer is not empty
        pthread_cond_signal(&not_empty);

        pthread_mutex_unlock(&lock);
        usleep(100000); // Simulate production delay
    }

    return NULL;
}

// ------------------------------------------------------
// Consumer Thread
// ------------------------------------------------------
void* consumer(void* arg) {
    for (int i = 1; i <= TOTAL_ITEMS; i++) {
        pthread_mutex_lock(&lock);

        // Wait while buffer is empty
        while (count == 0) {
            printf("Consumer waiting (buffer empty)...\n");
            pthread_cond_wait(&not_empty, &lock);
        }

        // Consume item
        int item = buffer[head];
        head = (head + 1) % BUFFER_SIZE;
        count--;
        printf(" Consumed: %d | Buffer count: %d\n", item, count);

        // Signal that buffer is not full
        pthread_cond_signal(&not_full);

        pthread_mutex_unlock(&lock);
        usleep(200000); // Simulate consumption delay
    }

    return NULL;
}

// ------------------------------------------------------
// Main
// ------------------------------------------------------
int main() {
    pthread_t prod_thread, cons_thread;

    // Initialize mutex and condition variables
    pthread_mutex_init(&lock, NULL);
    pthread_cond_init(&not_full, NULL);
    pthread_cond_init(&not_empty, NULL);

    printf("Starting Producer–Consumer Simulation...\n\n");

    // Create threads
    pthread_create(&prod_thread, NULL, producer, NULL);
    pthread_create(&cons_thread, NULL, consumer, NULL);

    // Wait for both to finish
    pthread_join(prod_thread, NULL);
    pthread_join(cons_thread, NULL);

    // Cleanup
    pthread_mutex_destroy(&lock);
    pthread_cond_destroy(&not_full);
    pthread_cond_destroy(&not_empty);

    printf("\nAll items produced and consumed successfully.\n");
    return 0;
}
