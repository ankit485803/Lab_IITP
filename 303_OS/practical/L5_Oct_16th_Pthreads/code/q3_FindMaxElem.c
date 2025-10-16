


#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
 
#define SIZE 10        // arrSize
#define THREADS 2      // Number of threads
 
int arr[SIZE] = {5, 12, 7, 25, 1, 19, 9, 4, 22, 10};  
int local_max[THREADS];  // To store local max from each thread
 
// Function to find the local max in each thread's chunk
void* find_max(void* arg) {
    int id = *(int*)arg;  // Get thread ID
    int start = id * (SIZE / THREADS);  // Start index
    int end = (id + 1) * (SIZE / THREADS);  // End index


    int max = arr[start];  // Initialize max
    for (int i = start + 1; i < end; i++) {  // Find max in chunk
        if (arr[i] > max) max = arr[i];
    }

    local_max[id] = max;  // Store local max
    printf("Thread %d local max = %d\n", id + 1, max);  // Output local max
    return NULL;
}
 



int main() {
    pthread_t tid[THREADS];  // Thread arr
    int ids[THREADS];  // To pass thread IDs

    // Create threads
    for (int i = 0; i < THREADS; i++) {
        ids[i] = i;
        pthread_create(&tid[i], NULL, find_max, &ids[i]);  // Start thread
    }

    // Wait for threads to finish
    for (int i = 0; i < THREADS; i++) {
        pthread_join(tid[i], NULL);  // Wait for each thread
    }

    // Compute global max from local max values
    int global_max = local_max[0];  // Initialize global max
    for (int i = 1; i < THREADS; i++) {
        if (local_max[i] > global_max) global_max = local_max[i];  // Compare with local max
    }

    printf("Global maximum value = %d\n", global_max);  // Output global max
    return 0;
}
