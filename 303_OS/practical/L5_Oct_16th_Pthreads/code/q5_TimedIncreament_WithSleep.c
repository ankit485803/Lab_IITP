

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>



int seconds;  // no of seconds to increment counter



// Worker function to increment a counter each second
void* timer_func(void* arg) {
    for (int i = 1; i <= seconds; i++) {
        printf("Tick %d\n", i);  // Print current tick
        sleep(1);  // Wait for 1 second
    }
    printf("Worker finished counting %d seconds.\n", seconds);  // Worker finished message
    return NULL;
}





int main() {
    pthread_t tid;  // Thread ID for the worker thread
    printf("Enter number of seconds: ");
    scanf("%d", &seconds);  // User input for no of seconds

    // Create the worker thread
    pthread_create(&tid, NULL, timer_func, NULL);

    
    // Main thread waits for the worker to finish
    pthread_join(tid, NULL);

    printf("Main thread exiting.\n");  // Main thread finished
    return 0;
}
