


#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define N 10  // Number of threads

void* print_message(void* arg) {
    int id = *(int*)arg;
    printf("I am thread %d\n", id);
    pthread_exit(NULL);
}

int main() {
    pthread_t threads[N];
    int thread_ids[N];

    // Create N threads
    for (int i = 0; i < N; i++) {
        thread_ids[i] = i;
        pthread_create(&threads[i], NULL, print_message, &thread_ids[i]);
    }

    // Wait for all threads to finish
    for (int i = 0; i < N; i++) {
        pthread_join(threads[i], NULL);
    }

    printf("I am the main thread\n");
    return 0;
}
