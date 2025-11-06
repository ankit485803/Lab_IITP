


#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <time.h>

#define NUM_THREADS 4
#define MESSAGES_PER_THREAD 5
#define LOG_FILE "thread_log.txt"

pthread_mutex_t log_lock;

// ------------------------------------------------------
// Thread-safe logging function
// ------------------------------------------------------
void log_message(const char* message) {
    pthread_mutex_lock(&log_lock);

    FILE* file = fopen(LOG_FILE, "a");
    if (!file) {
        perror("fopen");
        pthread_mutex_unlock(&log_lock);
        return;
    }

    // Get current time
    time_t now = time(NULL);
    struct tm* tinfo = localtime(&now);

    // Get thread ID
    pthread_t tid = pthread_self();

    // Format timestamp
    char time_buf[64];
    strftime(time_buf, sizeof(time_buf), "%Y-%m-%d %H:%M:%S", tinfo);

    // Write to file (atomic within mutex)
    fprintf(file, "[tid=%lu time=%s] %s\n", (unsigned long)tid, time_buf, message);
    fclose(file);

    pthread_mutex_unlock(&log_lock);
}

// ------------------------------------------------------
// Worker thread function
// ------------------------------------------------------
void* worker(void* arg) {
    int thread_num = *(int*)arg;
    char msg[128];

    for (int i = 1; i <= MESSAGES_PER_THREAD; i++) {
        snprintf(msg, sizeof(msg), "Thread %d - Message %d", thread_num, i);
        log_message(msg);
        usleep(100000 * (rand() % 3 + 1)); // random delay
    }

    return NULL;
}

// ------------------------------------------------------
// Main function
// ------------------------------------------------------
int main() {
    srand(time(NULL));
    pthread_t threads[NUM_THREADS];
    int thread_ids[NUM_THREADS];

    // Initialize mutex
    pthread_mutex_init(&log_lock, NULL);

    // Clear previous log
    FILE* file = fopen(LOG_FILE, "w");
    if (file) fclose(file);

    printf("Starting thread-safe logger...\n\n");

    // Create worker threads
    for (int i = 0; i < NUM_THREADS; i++) {
        thread_ids[i] = i + 1;
        pthread_create(&threads[i], NULL, worker, &thread_ids[i]);
    }

    // Wait for threads to complete
    for (int i = 0; i < NUM_THREADS; i++) {
        pthread_join(threads[i], NULL);
    }

    pthread_mutex_destroy(&log_lock);
    printf("\nLogging complete. Check '%s'.\n", LOG_FILE);

    return 0;
}
