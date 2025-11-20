#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <time.h>

#define THREADS 4               // No of threads
#define POINTS_PER_THREAD 1000000 // No of darts per thread

// Function executed by each thread to simulate dart throws
void* count_hits(void* arg) {
    unsigned int seed = time(NULL) ^ pthread_self();  // Unique seed per thread
    int *hits = malloc(sizeof(int));  // Thread-local hit count
    *hits = 0;  

    for (int i = 0; i < POINTS_PER_THREAD; i++) {
        double x = (double)rand_r(&seed) / RAND_MAX;  // Random x-coordinate
        double y = (double)rand_r(&seed) / RAND_MAX;  // Random y-coordinate
        if (x*x + y*y <= 1.0)  // Check if the dart is inside the unit circle
            (*hits)++;  // Increment hit count if inside circle
    }
    return hits;  // Return the local hit count for the thread
}







int main() {
    pthread_t tid[THREADS];    // Array to store thread IDs
    int total_hits = 0;        // Variable to accumulate total hits from all threads

    // Create threads
    for (int i = 0; i < THREADS; i++) {
        pthread_create(&tid[i], NULL, count_hits, NULL);  // Start each thread
    }

    // Wait for threads to finish and collect results
    for (int i = 0; i < THREADS; i++) {
        int* hits;
        pthread_join(tid[i], (void**)&hits);  // Wait for thread and get its hit count
        total_hits += *hits;  // Add local hits to global total
        free(hits);  // Free dynamically allocated memory
    }

    // Estimate Pi using the formula: π ≈ 4 * (hits inside circle) / (total throws)
    double pi = 4.0 * total_hits / (THREADS * POINTS_PER_THREAD);
    printf("Estimated Pi = %f\n", pi);  // Output the estimated value of Pi

    return 0;
}
